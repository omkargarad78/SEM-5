def best_fit(program_size, memory, current_ptr):
    min_index = -1
    min_val = float('inf')
    for i in range(len(memory)):
        if not memory[i][2] and memory[i][0] >= program_size and memory[i][0] - program_size < min_val:
            min_index = i
            min_val = memory[i][0] - program_size
    if min_index != -1:
        memory[min_index] = (memory[min_index][0] - program_size, program_size, True)
        return min_index
    return -1

# Define memory and program sizes directly
memory = [(1000, 0, False), (800, 0, False), (600, 0, False), (1200, 0, False), (500, 0, False)]
program_sizes = [700, 400]
current_ptr = 0

for program_size in program_sizes:
    position = best_fit(program_size, memory, current_ptr)
    if position == -1:
        print(f"Not Enough Memory for Program of size {program_size}")
    else:
        print(f"Program of size {program_size} inserted at position: {position}")

# Output memory status
for block in memory:
    free, consumed, is_occupied = block
    print(f"{free:<14}{consumed:<11}{'Allocated' if is_occupied else 'Empty'}")
