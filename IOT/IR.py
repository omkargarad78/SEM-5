import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)
GPIO.setup(5, GPIO.IN)
GPIO.setup(3,GPIO.OUT)

while True:
    var=GPIO.input(5)
    print(var)
    
    if(var==0):
        GPIO.output(3, True)
        
    else:
        GPIO.output(3, False)
    

GPIO.cleanup()