import customtkinter as ctk
from tkinter import ttk, messagebox, filedialog
import pandas as pd
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import matplotlib.pyplot as plt
from db import connect_db

ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

BG = "#020617"
CARD = "#0f172a"


class App(ctk.CTk):

    def __init__(self):
        super().__init__()

        self.title("Smart Placement System PRO")
        self.geometry("1500x850")
        self.configure(fg_color=BG)

        self.sort_order = True

        style = ttk.Style()
        style.theme_use("default")

        style.configure("Treeview",
                        background="#0f172a",
                        foreground="#e5e7eb",
                        fieldbackground="#0f172a",
                        rowheight=30)

        style.map("Treeview", background=[("selected", "#2563eb")])

        # Sidebar
        side = ctk.CTkFrame(self, width=220, fg_color="#020617")
        side.pack(side="left", fill="y")

        ctk.CTkLabel(side, text="⚡ SMART\nPLACEMENT", font=("Arial", 20, "bold")).pack(pady=30)

        ctk.CTkButton(side, text="Dashboard", command=self.dashboard).pack(pady=10, fill="x")
        ctk.CTkButton(side, text="Students", command=self.students_page).pack(pady=10, fill="x")
        ctk.CTkButton(side, text="Ranking", command=self.ranking_page).pack(pady=10, fill="x")
        ctk.CTkButton(side, text="Analytics", command=self.analytics_page).pack(pady=10, fill="x")

        self.main = ctk.CTkFrame(self, fg_color=BG)
        self.main.pack(fill="both", expand=True)

        self.dashboard()

    def clear(self):
        for w in self.main.winfo_children():
            w.destroy()

    # ================= DASHBOARD =================
    def dashboard(self):
        self.clear()

        conn = connect_db()
        df = pd.read_sql("SELECT * FROM students", conn)
        conn.close()

        total = len(df)
        avg = round(df["cgpa"].mean(), 2) if total > 0 else 0
        topper = df["cgpa"].max() if total > 0 else 0

        frame = ctk.CTkFrame(self.main, fg_color=BG)
        frame.pack(pady=20)

        def card(title, val):
            c = ctk.CTkFrame(frame, width=200, height=120, fg_color=CARD)
            c.pack(side="left", padx=15)
            ctk.CTkLabel(c, text=title).pack(pady=10)
            ctk.CTkLabel(c, text=str(val), font=("Arial", 22, "bold")).pack()

        card("Total Students", total)
        card("Avg CGPA", avg)
        card("Top CGPA", topper)

        if total > 0:
            fig, ax = plt.subplots()
            df["branch"].value_counts().plot(kind="bar", ax=ax)
            ax.set_title("Branch Distribution")

            canvas = FigureCanvasTkAgg(fig, master=self.main)
            canvas.draw()
            canvas.get_tk_widget().pack(pady=20)

    # ================= STUDENTS =================
    def students_page(self):
        self.clear()

        top = ctk.CTkFrame(self.main)
        top.pack(fill="x", pady=10)

        self.search_var = ctk.StringVar()
        self.branch_var = ctk.StringVar()
        self.cgpa_var = ctk.StringVar()

        ctk.CTkEntry(top, placeholder_text="Search Name/Email",
                     textvariable=self.search_var, width=180).pack(side="left", padx=5)

        self.branch_var.set("All")

        branch_dropdown = ctk.CTkComboBox(
        top,
        values=["All", "CSE", "ECE", "ME", "CE", "EE"],
        variable=self.branch_var,
        width=120
        )
        branch_dropdown.pack(side="left", padx=5)

        self.cgpa_var.set("All")

        cgpa_dropdown = ctk.CTkComboBox(
            top,
            values=["All", "6", "7", "8", "9"],
            variable=self.cgpa_var,
            width=100
        )
        cgpa_dropdown.pack(side="left", padx=5)
        
        ctk.CTkButton(top, text="Filter", command=self.advanced_filter).pack(side="left", padx=5)
        ctk.CTkButton(top, text="Reset", command=self.load_students).pack(side="left", padx=5)
        ctk.CTkButton(top, text="Sort CGPA", command=self.sort_cgpa).pack(side="left", padx=5)
        ctk.CTkButton(top, text="Export", command=self.export_excel).pack(side="left", padx=5)
        ctk.CTkButton(top, text="Import", command=self.import_excel).pack(side="left", padx=5)

        btn = ctk.CTkFrame(self.main)
        btn.pack(pady=10)

        ctk.CTkButton(btn, text="Add", command=self.add_student).pack(side="left", padx=5)
        ctk.CTkButton(btn, text="Update", command=self.update_student).pack(side="left", padx=5)
        ctk.CTkButton(btn, text="Delete", command=self.delete_student).pack(side="left", padx=5)
        ctk.CTkButton(btn, text="Recommend Jobs", command=self.recommend_jobs).pack(side="left", padx=5)

        self.tree = ttk.Treeview(self.main,
                                 columns=("ID", "Name", "Email", "Branch", "CGPA"),
                                 show="headings")
        self.tree.pack(fill="both", expand=True)

        for col in ("ID", "Name", "Email", "Branch", "CGPA"):
            self.tree.heading(col, text=col)

        self.load_students()

    def load_students(self):
        conn = connect_db()
        df = pd.read_sql("SELECT * FROM students", conn)
        conn.close()

        self.tree.delete(*self.tree.get_children())

        if df.empty:
            messagebox.showinfo("Info", "No records found")
            return

        for _, row in df.iterrows():
            self.tree.insert("", "end", values=list(row))

    # ================= FILTER =================
    def advanced_filter(self):
        name = self.search_var.get()
        branch = self.branch_var.get()
        cgpa = self.cgpa_var.get()

        query = "SELECT * FROM students WHERE 1=1"
        params = []

        if name:
            query += " AND name LIKE %s"
            params.append(f"%{name}%")

        if branch and branch != "All":
            query += " AND branch = %s"
            params.append(branch)

        if cgpa and cgpa != "All":
            try:
                params.append(float(cgpa))
                query += " AND cgpa >= %s"
            except:
                messagebox.showerror("Error", "Invalid CGPA")
                return

        conn = connect_db()
        df = pd.read_sql(query, conn, params=params)
        conn.close()

        self.tree.delete(*self.tree.get_children())

        if df.empty:
            messagebox.showinfo("Info", "No matching data")
            return

        for _, row in df.iterrows():
            self.tree.insert("", "end", values=list(row))

    # ================= SORT =================
    def sort_cgpa(self):
        data = [self.tree.item(i)["values"] for i in self.tree.get_children()]

        data.sort(key=lambda x: float(x[4]), reverse=not self.sort_order)
        self.sort_order = not self.sort_order

        self.tree.delete(*self.tree.get_children())
        for row in data:
            self.tree.insert("", "end", values=row)

    # ================= EXPORT =================
    def export_excel(self):
        conn = connect_db()
        df = pd.read_sql("SELECT * FROM students", conn)
        conn.close()

        file = filedialog.asksaveasfilename(defaultextension=".xlsx")
        if file:
            df.to_excel(file, index=False)
            messagebox.showinfo("Success", "Exported Successfully")
    
    # ================= IMPORT =================
    def import_excel(self):
        file = filedialog.askopenfilename(filetypes=[("Excel files", "*.xlsx")])
        if not file:
            return

        try:
            df = pd.read_excel(file)
            conn = connect_db()
            cur = conn.cursor()

            for _, row in df.iterrows():
                cur.execute(
                    "INSERT INTO students(name,email,branch,cgpa) VALUES (%s,%s,%s,%s)",
                    (row["name"], row["email"], row["branch"], row["cgpa"])
                )

            conn.commit()
            conn.close()

            self.load_students()
            messagebox.showinfo("Success", "Imported Successfully")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to import: {e}")
    # ================= RECOMMEND =================
    def recommend_jobs(self):
        sel = self.tree.selection()
        if not sel:
            messagebox.showwarning("Select", "Select a student first")
            return

        student_id = self.tree.item(sel[0])["values"][0]

        conn = connect_db()

        query = """
        SELECT s.name, c.company_name, c.package_lpa
        FROM students s
        JOIN skills sk ON s.student_id = sk.student_id
        JOIN jobs j ON sk.skill_name = j.required_skill
        JOIN companies c ON j.company_id = c.company_id
        WHERE s.student_id = %s
        AND s.cgpa >= c.min_cgpa
        """

        df = pd.read_sql(query, conn, params=[student_id])
        conn.close()

        win = ctk.CTkToplevel(self)
        win.title("Recommended Jobs")
        win.geometry("500x400")

        tree = ttk.Treeview(win, columns=("Name", "Company", "Package"), show="headings")
        tree.pack(fill="both", expand=True)

        for col in ("Name", "Company", "Package"):
            tree.heading(col, text=col)

        if df.empty:
            messagebox.showinfo("Info", "No jobs found")

        for _, row in df.iterrows():
            tree.insert("", "end", values=list(row))

    # ================= ADD =================
    def add_student(self):
        win = ctk.CTkToplevel(self)
        win.grab_set()

        name = ctk.StringVar()
        email = ctk.StringVar()
        branch = ctk.StringVar()
        cgpa = ctk.StringVar()

        ctk.CTkEntry(win, placeholder_text="Name", textvariable=name).pack(pady=8)
        ctk.CTkEntry(win, placeholder_text="Email", textvariable=email).pack(pady=8)
        ctk.CTkEntry(win, placeholder_text="Branch", textvariable=branch).pack(pady=8)
        ctk.CTkEntry(win, placeholder_text="CGPA", textvariable=cgpa).pack(pady=8)

        def save():
            try:
                cg = float(cgpa.get())
            except:
                messagebox.showerror("Error", "CGPA must be a number")
                return

            if not name.get() or not email.get():
                messagebox.showerror("Error", "All fields required")
                return

            conn = connect_db()
            cur = conn.cursor()

            cur.execute(
                "INSERT INTO students(name,email,branch,cgpa) VALUES (%s,%s,%s,%s)",
                (name.get(), email.get(), branch.get(), cg)
            )

            conn.commit()
            conn.close()

            self.load_students()
            win.destroy()

        ctk.CTkButton(win, text="Save", command=save).pack(pady=10)

    # ================= DELETE =================
    def delete_student(self):
        sel = self.tree.selection()
        if not sel:
            return

        if not messagebox.askyesno("Confirm", "Delete this student?"):
            return

        sid = self.tree.item(sel[0])["values"][0]

        conn = connect_db()
        cur = conn.cursor()
        cur.execute("DELETE FROM students WHERE student_id=%s", (sid,))
        conn.commit()
        conn.close()

        self.load_students()

    # ================= UPDATE =================
    def update_student(self):
        sel = self.tree.selection()
        if not sel:
            return

        data = self.tree.item(sel[0])["values"]

        win = ctk.CTkToplevel(self)
        win.grab_set()

        name = ctk.StringVar(value=data[1])
        email = ctk.StringVar(value=data[2])
        branch = ctk.StringVar(value=data[3])
        cgpa = ctk.StringVar(value=data[4])

        ctk.CTkEntry(win, textvariable=name).pack(pady=8)
        ctk.CTkEntry(win, textvariable=email).pack(pady=8)
        ctk.CTkEntry(win, textvariable=branch).pack(pady=8)
        ctk.CTkEntry(win, textvariable=cgpa).pack(pady=8)

        def save():
            try:
                cg = float(cgpa.get())
            except:
                messagebox.showerror("Error", "Invalid CGPA")
                return

            conn = connect_db()
            cur = conn.cursor()

            cur.execute("""
                UPDATE students
                SET name=%s,email=%s,branch=%s,cgpa=%s
                WHERE student_id=%s
            """, (name.get(), email.get(), branch.get(), cg, data[0]))

            conn.commit()
            conn.close()

            win.destroy()
            self.load_students()

        ctk.CTkButton(win, text="Update", command=save).pack(pady=10)

    # ================= RANKING =================
    def ranking_page(self):
        self.clear()

        conn = connect_db()
        df = pd.read_sql("SELECT name,cgpa FROM students ORDER BY cgpa DESC", conn)
        conn.close()

        tree = ttk.Treeview(self.main, columns=("Name", "CGPA"), show="headings")
        tree.pack(fill="both", expand=True)

        for col in ("Name", "CGPA"):
            tree.heading(col, text=col)

        for _, row in df.iterrows():
            tree.insert("", "end", values=list(row))

    # ================= ANALYTICS =================
    def analytics_page(self):
        self.clear()

        conn = connect_db()
        df = pd.read_sql("SELECT * FROM students", conn)
        conn.close()

        if df.empty:
            messagebox.showinfo("Info", "No data available")
            return

        fig1, ax1 = plt.subplots()
        ax1.hist(df["cgpa"], bins=6)
        ax1.set_title("CGPA Distribution")

        fig2, ax2 = plt.subplots()
        df["branch"].value_counts().plot(kind="bar", ax=ax2)
        ax2.set_title("Branch Wise Students")

        canvas1 = FigureCanvasTkAgg(fig1, master=self.main)
        canvas1.draw()
        canvas1.get_tk_widget().pack(pady=10)

        canvas2 = FigureCanvasTkAgg(fig2, master=self.main)
        canvas2.draw()
        canvas2.get_tk_widget().pack(pady=10)


app = App()
app.mainloop()