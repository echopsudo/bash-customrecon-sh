# bash-customrecon-sh

## Disclaimer
This project is intended for educational purposes and authorized penetration testing only.  
Do not use this tool against systems or networks without explicit permission.

---

# Project Scope
This project automates reconnaissance tasks using Bash shell scripting. Bash was chosen because it allows for fast experimentation with command-line tools and helps build a strong foundation in scripting. This project serves as a stepping stone to more advanced programming languages, such as Python, while demonstrating practical automation of network and web enumeration workflows. This is also my personal project to demonstrate real-world coding and penetration-testing skills for further oppurtunities in education and careers.

---


# What It Does
This script automates a reconnaissance pipeline by chaining multiple tools and processes:

- Port and service discovery  
- Web directory enumeration  
- HTTP content retrieval  
- Pattern matching and data extraction  

It processes discovered endpoints and extracts potential sensitive data patterns using automated filtering techniques.

## Tools Used
- Nmap (network scanning)  
- Gobuster (directory enumeration)  
- curl (HTTP requests)  
- grep (pattern matching)  

---

## Usage
chmod +x script_name.sh
echo "IP_ADRRESS" > ip.txt (This uses IP addresses from a txt file for personal convienence.)
./script_name.sh

