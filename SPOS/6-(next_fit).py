def next_fit(program_size, memory, current_ptr):
    for i in range(current_pointer, len(memory)):
        if not memory[i][2] and memory[i][0] >= program_size:
            memory[i] = (memory[i][0] - program_size, program_size, True)
            current_pointer = i
            return current_pointer
    for i in range(0, current_pointer):
        if not memory[i][2] and memory[i][0] >= program_size:
            memory[i] = (memory[i][0] - program_size, program_size, True)
            current_pointer = i
            return current_pointer
    return -1

# Define memory and program sizes directly
memory = [(1000, 0, False), (800, 0, False), (600, 0, False), (1200, 0, False), (500, 0, False)]
program_sizes = [700, 400]
current_ptr = 0

for program_size in program_sizes:
    position = next_fit(program_size, memory, current_ptr)
    if position == -1:
        print(f"Not Enough Memory for Program of size {program_size}")
    else:
        print(f"Program of size {program_size} inserted at position: {position}")

# Output memory status
for block in memory:
    free, consumed, is_occupied = block
    print(f"{free:<14}{consumed:<11}{'Allocated' if is_occupied else 'Empty'}")
