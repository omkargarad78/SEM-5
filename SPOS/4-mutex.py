a = [0] * 5
mutex = 1
empty = 5
full = 0

def wait(x):
    if x > 0:
        return x - 1
    return 0

def signal(x):
    return x + 1

def producer():
    global empty, mutex, full
    print("Empty:", empty, " Full:", full, " Mutex:", mutex)
    if empty != 0 and mutex == 1:
        print("Data to be produced: ", end="")
        empty = wait(empty)
        mutex = wait(mutex)
        data = int(input())
        a[full] = data
        print("Data produced is:", a[full])
        mutex = signal(mutex)
        full = signal(full)

def consumer():
    global empty, mutex, full
    print("Empty:", empty, " Full:", full, " Mutex:", mutex)
    if full != 0 and mutex == 1:
        full = wait(full)
        mutex = wait(mutex)
        print("Data consumed is:", a[full])
        mutex = signal(mutex)
        empty = signal(empty)

while True:
    print("-----------MENU----------")
    print("1. Producer\n2. Consumer\n3. Exit")
    choice = int(input("Enter the choice: "))

    if choice == 1:
        producer()
    elif choice == 2:
        consumer()
    elif choice == 3:
        break
