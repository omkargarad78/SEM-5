n = int(input("Enter the number of processes: "))
processes = []

for i in range(1, n + 1):
    name = input(f"Enter name for Process P{i}: ")
    arrival_time = int(input(f"Enter arrival time for Process P{i}: "))
    burst_time = int(input(f"Enter burst time for Process P{i}: "))
    processes.append({"name": name, "arrival_time": arrival_time, "burst_time": burst_time, "remaining_time": burst_time})
    

processes.sort(key=lambda p: p["arrival_time"])
current_time = 0

while processes:
    shortest_job = None
    shortest_time = float('inf')

    for p in processes:
        if p["arrival_time"] <= current_time and p["remaining_time"] < shortest_time:
            shortest_job = p
            shortest_time = p["remaining_time"]

    if shortest_job is None:
        current_time += 1
    else:
        print(f"Executing {shortest_job['name']} at time {current_time}")
        shortest_job["remaining_time"] -= 1          #check the substract sign

        if shortest_job["remaining_time"] == 0:
            processes.remove(shortest_job)

        current_time += 1
