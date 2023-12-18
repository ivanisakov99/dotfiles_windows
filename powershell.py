from multiprocessing import Process
import os
import re
import subprocess
import threading
import time
from concurrent.futures import ThreadPoolExecutor


# output = subprocess.Popen(["Write-Output", "Hello"])

# def watchStdout():
#     print("hello \n My name is ...")

# def watchStderr():
#    print("This is an error\noh no....")

# def run_io_tasks_in_parallel(tasks):
#     with ThreadPoolExecutor() as executor:
#         running_tasks = [executor.submit(task) for task in tasks]
#         for running_task in running_tasks:
#             running_task.result()

# run_io_tasks_in_parallel([
#     lambda: watchStdout(),
#     lambda: watchStderr(),
# ])





# output = subprocess.Popen(['powershell.exe', ".\\test.ps1"])
# output = subprocess.Popen(['powershell.exe', "Write-Err"], stdout=subprocess.DEVNULL, stderr=None)
# output.communicate()

with open(os.devnull, "w") as devnull_w, open(os.devnull, "r") as devnull_r:
    subprocess.run(['powershell.exe', "Write-Ho hello"], stdout=devnull_w, stderr=subprocess.STDOUT)




# print("Ret code:", output.returncode)



prefix = "C:/Users/isako/.dotfiles/"
arg = prefix + "nprintSomething.ps1"

# print(arg)

# output = subprocess.Popen(['powershell.exe', arg])
# output.communicate()
