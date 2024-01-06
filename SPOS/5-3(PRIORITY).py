def process_data(no_of_processes):
    process_data = []
    for i in range(no_of_processes):
        process_id = int(input("Enter Process ID: "))
        burst_time = int(input(f"Enter Burst Time for Process {process_id}: "))
        priority = int(input(f"Enter Priority for Process {process_id}: "))
        process_data.append([process_id, 0, burst_time, priority])

    scheduling_process(process_data)


def scheduling_process(process_data):
    process_data.sort(key=lambda x: x[3], reverse=True)
    start_time = []
    exit_time = []
    s_time = 0
    for i in range(len(process_data)):
        start_time.append(s_time)
        s_time = s_time + process_data[i][2]
        e_time = s_time
        exit_time.append(e_time)
        process_data[i].append(e_time)
    t_time = calculate_turnaround_time(process_data)
    w_time = calculate_waiting_time(process_data)
    print_data(process_data, t_time, w_time)


def calculate_turnaround_time(process_data):
    total_turnaround_time = 0
    for i in range(len(process_data)):
        turnaround_time = process_data[i][4] - process_data[i][1]
        total_turnaround_time = total_turnaround_time + turnaround_time
        process_data[i].append(turnaround_time)
    average_turnaround_time = total_turnaround_time / len(process_data)
    return average_turnaround_time


def calculate_waiting_time(process_data):
    total_waiting_time = 0
    for i in range(len(process_data)):
        waiting_time = process_data[i][5] - process_data[i][2]
        total_waiting_time = total_waiting_time + waiting_time
        process_data[i].append(waiting_time)
    average_waiting_time = total_waiting_time / len(process_data)
    return average_waiting_time


def print_data(process_data, average_turnaround_time, average_waiting_time):
    process_data.sort(key=lambda x: x[0])
    print("Process_ID  Arrival_Time  Burst_Time  Priority  Completion_Time  Turnaround_Time  Waiting_Time")

    for i in range(len(process_data)):
        for j in range(len(process_data[i])):
            print(process_data[i][j], end="\t\t\t\t")
        print()

    print(f'Average Turnaround Time: {average_turnaround_time}')
    print(f'Average Waiting Time: {average_waiting_time}')


no_of_processes = int(input("Enter number of processes: "))
process_data(no_of_processes)
