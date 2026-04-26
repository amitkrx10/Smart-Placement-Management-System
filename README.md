# Smart Placement System PRO  

A Python + MySQL based desktop application that helps manage student placement data with features like analytics, ranking, and smart job recommendations.

---

## Overview  

Smart Placement System PRO is designed to simplify placement management in colleges. It provides an easy-to-use GUI to manage student records, analyze performance, and recommend jobs based on skills and CGPA.

---

## Features  

### Dashboard  
- Total students, average CGPA, top CGPA  
- Visual charts for insights  

### Student Management  
- Add, update, delete student records  
- Search and filter by name, branch, CGPA  
- Sort students by CGPA  

### Ranking System  
- Displays students ranked by CGPA  

### Analytics  
- CGPA distribution graph  
- Branch-wise student analysis  

### Job Recommendation  
- Suggests companies based on:  
  - Skills  
  - CGPA eligibility  

### Excel Support  
- Import student data  
- Export data to Excel  

---

## Tech Stack  

- Frontend: Python (CustomTkinter, Tkinter)  
- Backend: Python  
- Database: MySQL  
- Libraries: Pandas, Matplotlib  

---

## Project Structure  
Smart-Placement-System/
├── main.py
├── db.py
├── requirements.txt
├── database.sql
└── README.md

## Installation & Setup  
## Installation & Setup  

### 1. Clone the repository  
-bash
git clone https://github.com/your-username/smart-placement-system.git
cd smart-placement-system

2. Install dependencies
pip install -r requirements.txt

3. Setup MySQL Database
Open MySQL
Run the SQL file (database.sql) to create tables and data

4. Run the application
python main.py

5 How It Works
Stores student data in MySQL database
Uses SQL queries for filtering, ranking, and analysis
Matches student skills and CGPA with company requirements
Displays results through a GUI

6 Objective
Simplify placement data management
Provide data-driven insights
Help students get better job opportunities
Assist placement cells in decision-making

7 Future Enhancements
Web-based version
AI-based recommendation system
Resume analysis
Login system (Admin/Student)



Author
Amit Kumar
B.Tech CSE


