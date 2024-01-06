import RPi.GPIO as GPIO 
import time

GPIO.setmode(GPIO.BOARD)

GPIO.setup(5, GPIO.OUT)
GPIO.setup(3,GPIO.OUT)
while True:
    GPIO.output(5,True)
    time.sleep(2)
    GPIO.output(5,False)
    time.sleep(2)
    GPIO.output(3,True)
    time.sleep(2)
    GPIO.output(3,False)
    time.sleep(2)
    GPIO.cleanup()
