n = int(input("Enter the number of processes: "))
processes = []

for i in range(n):
    name = input(f"Enter the name of process {i + 1}: ")
    arrival_time = int(input(f"Enter the arrival time of process {i + 1}: "))
    burst_time = int(input(f"Enter the burst time of process {i + 1}: "))
    processes.append({"name": name, "arrival_time": arrival_time, "burst_time": burst_time})

# Implement manual sorting by arrival time
for i in range(n - 1):
    for j in range(0, n - i - 1):
        if processes[j]["arrival_time"] > processes[j + 1]["arrival_time"]:
            processes[j], processes[j + 1] = processes[j + 1], processes[j]

current_time = 0
total_waiting_time = 0
total_turnaround_time = 0


print("\nProcess Execution Order:")
print("----------------------------")

for current_process in processes:
    print(f"Time {current_time}: Executing {current_process['name']}")

    # Calculate waiting time for the current process
    waiting_time = max(0, current_time - current_process['arrival_time'])
    total_waiting_time += waiting_time
    current_time += current_process['burst_time']

    # Calculate turnaround time for the current process
    turnaround_time = waiting_time + current_process['burst_time']
    total_turnaround_time += turnaround_time

average_turnaround_time = total_turnaround_time / n
average_waiting_time = total_waiting_time / n

print("\nAverage Turnaround Time:", average_turnaround_time)
print("Average Waiting Time:", average_waiting_time)
