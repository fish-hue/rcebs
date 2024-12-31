Remote Code Execution (RCE) Test Script
This script is designed for testing the potential existence of a Remote Code Execution (RCE) vulnerability in a given website. 
It specifically targets websites where arbitrary PHP code might be executed via an HTTP request. 
The script attempts to execute the PHP phpinfo() function, which is typically used to gather information about the PHP environment.

⚠️ Important: Only use this script on websites that you own or have explicit permission to test. 
Unauthorized testing on websites you do not own or do not have permission to test is illegal and unethical. ⚠️

Table of Contents
Purpose
Prerequisites
Usage
How It Works
Safety Considerations
Setting Up a Safe Testing Environment
Legal Disclaimer
Purpose
This script is designed to check if a given website is vulnerable to a specific type of Remote Code Execution (RCE) vulnerability. By sending an HTTP request with a payload that attempts to execute the phpinfo() function, it checks if the website allows arbitrary PHP code execution.

Prerequisites
Before using the script, ensure that the following are installed on your system:

Curl: A command-line tool for transferring data with URLs. It is used in this script to send HTTP requests to the target website.
Bash: This script is written in Bash, which is commonly found on Linux and macOS. For Windows, you may need a compatible shell like Git Bash or Windows Subsystem for Linux (WSL).
Usage
To use the script, follow these steps:

Clone the Repository or create a new file for the script.

Open a terminal and navigate to the directory where the script is located.

Run the script:

bash
Copy code
chmod +x rce_test.sh      # Make the script executable (if necessary)
./rce_test.sh             # Run the script
Follow the prompts: The script will ask for the following inputs:

Website URL: Enter the target website (e.g., example.com).
Review the output:

If the target website is vulnerable, you will see a message indicating that it is vulnerable, highlighted in red.
If the target is not vulnerable, the script will output a message indicating the same.
How It Works
Input: The user is asked to provide a website URL (e.g., example.com).

Crafted HTTP Request: The script sends an HTTP POST request to the target website with a payload that attempts to execute phpinfo() via a vulnerable endpoint:

bash
Copy code
curl -s "http://$host/ajax/render/widget_tabbedcontainer_tab_panel" -d 'subWidgets[0][template]=widget_php&subWidgets[0][config][code]=phpinfo();'
Check for Response: The script checks the response from the server for the presence of the string phpinfo. If it finds the string, it assumes that the server executed the PHP code and is vulnerable.

Output: If the target is vulnerable, the script will print the website's URL with a message indicating it is vulnerable. If not, it will display a message that the site is not vulnerable.

Safety Considerations
⚠️ Only use this script on websites that you have explicit permission to test. Unauthorized scanning and exploiting vulnerabilities without permission is illegal and unethical.

Recommendations:
Test on Local or Controlled Environments: If you're new to penetration testing or using this script for educational purposes, make sure to set up a local vulnerable environment (e.g., using DVWA, bWAPP, or OWASP Juice Shop) or use ethical hacking platforms like Hack The Box or TryHackMe.

Rate Limiting: Be mindful not to overwhelm the target server with too many requests. Always limit your requests and consider adding delays between requests if you are testing multiple targets.

Monitoring: Always monitor your requests to ensure you aren't accidentally triggering security mechanisms like IDS/IPS or firewalls.

Setting Up a Safe Testing Environment
For safe testing, it’s recommended to set up a local or isolated environment:

Install Vulnerable Web Apps:

DVWA (Damn Vulnerable Web Application): A PHP/MySQL web application designed to be insecure for testing and learning purposes.
bWAPP (buggy Web Application): Another intentionally vulnerable web app that can be used to practice exploitation techniques.
Using Docker Containers: You can quickly set up a vulnerable web application in a Docker container. Here's how to set up DVWA in Docker:

bash
Copy code
# Pull the DVWA image from Docker Hub
docker pull vulnerables/web-dvwa

# Run the DVWA container
docker run --rm -d -p 80:80 vulnerables/web-dvwa
Use Ethical Hacking Platforms: Platforms like Hack The Box and TryHackMe provide legal, safe environments for testing vulnerabilities.

Legal Disclaimer
By using this script, you acknowledge and agree to the following:

Only use this script on systems that you own or have explicit permission to test. Unauthorized use of this script on systems you do not own or do not have permission to test is illegal and unethical.
This script is for educational and testing purposes only. The author is not responsible for any misuse or illegal activities associated with this script.
Ensure you comply with all local laws and regulations regarding cybersecurity, penetration testing, and ethical hacking.
License
This script is provided for educational and ethical purposes. 

