import Adafruit_DHT
import RPi.GPIO as GPIO

GPIO.setmode (GPIO.BCM)

while True:
    h ,t=Adafruit_DHT.read_retry(Adafruit_DHT.DHT11,2)
    print(h, t)
    
    
GPIO.cleanup()