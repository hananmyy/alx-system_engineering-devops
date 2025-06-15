# Bash Scripting Tasks Summary
## **Project: Shell Scripting - Environment & Arithmetic Operations**

### **Table of Contents**
1. [Task 0: Change PATH](#task-0-change-path)
2. [Task 1: Test PATH](#task-1-test-path)
3. [Task 2: Count Directories in PATH](#task-2-count-directories-in-path)
4. [Task 3: List Environment Variables](#task-3-list-environment-variables)
5. [Task 4: List Local Variables, Environment Variables, and Functions](#task-4-list-local-variables-environment-variables-and-functions)
6. [Task 5: Create a Local Variable](#task-5-create-a-local-variable)
7. [Task 6: Create a Global Variable](#task-6-create-a-global-variable)
8. [Task 7: Arithmetic Operation Using an Environment Variable](#task-7-arithmetic-operation-using-an-environment-variable)
9. [Task 8: Print the Number of Arguments](#task-8-print-the-number-of-arguments)
10. [Task 9: Print All Arguments](#task-9-print-all-arguments)
11. [Task 10: Print All Possible Two-Letter Combinations](#task-10-print-all-possible-two-letter-combinations)
12. [Task 11: Print the Sum of Arguments](#task-11-print-the-sum-of-arguments)
13. [Task 12: Format a Floating-Point Number](#task-12-format-a-floating-point-number)



## **Task 0: Change PATH**
- **Objective:** Modify `PATH` to include `/action` directory.
- **Implementation:**
  ```bash
  export PATH=$PATH:/action


### **Task 1: Test PATH**
- **Objective:** Create a simple script inside `/action` and ensure it runs globally.
- **Implementation:**
  ```bash
  mkdir -p /action
  echo -e '#!/bin/bash\necho "Hello from /action!"' > /action/test_script
  chmod +x /action/test_script


### **Task 2: Count Directories in PATH**
- **Objective:** Count how many directories exist in the `PATH` environment variable.
- **Implementation:**
  ```bash
  echo "$PATH" | tr ':' '\n' | wc -l


### **Task 3: List Environment Variables**
- **Objective:** Display all environment variables in the system.
- **Implementation:**
  ```bash
  printenv


### **Task 3: List Environment Variables**
- **Objective:** Display all environment variables in the system.
- **Implementation:**
  ```bash
  printenv


### **Task 5: Create a Local Variable**
- **Objective:** Define a local variable named `BEST` with a value.
- **Implementation:**
  ```bash
  BEST="The power of a local variable"


### **Task 6: Create a Global Variable**
- **Objective:** Define a global (environment) variable named `BEST` with a value.
- **Implementation:**
  ```bash
  export BEST="The power of a global variable"


### **Task 7: Arithmetic Operation Using an Environment Variable**
- **Objective:** Add `128` to the value stored in the environment variable `TRUEKNOWLEDGE` and print the result.
- **Implementation:**
  ```bash
  #!/bin/bash
  echo $((128 + TRUEKNOWLEDGE))


### **Task 8: Print the Number of Arguments**
- **Objective:** Print the number of arguments passed to the script.
- **Implementation:**
  ```bash
  #!/bin/bash
  echo $#


### **Task 9: Print All Arguments**
- **Objective:** Display all arguments passed to the script.
- **Implementation:**
  ```bash
  #!/bin/bash
  echo "$@"


### **Task 10: Print All Possible Two-Letter Combinations**
- **Objective:** Generate and print every possible combination of two lowercase letters (`a-z`).
- **Implementation:**
  ```bash
  #!/bin/bash
  echo {a..z}{a..z} | tr ' ' '\n'


### **Task 10: Print All Possible Two-Letter Combinations**
- **Objective:** Generate and print every possible combination of two lowercase letters (`a-z`).
- **Implementation:**
  ```bash
  #!/bin/bash
  echo {a..z}{a..z} | tr ' ' '\n'


### **Task 12: Format a Floating-Point Number**
- **Objective:** Print a number from the environment variable `NUM`, formatted to two decimal places.
- **Implementation:**
  ```bash
  #!/bin/bash
  printf "%.2f\n" "$NUM"


### **Task 12: Format a Floating-Point Number**
- **Objective:** Print a number from the environment variable `NUM`, formatted to two decimal places.
- **Implementation:**
  ```bash
  #!/bin/bash
  printf "%.2f\n" "$NUM"

