from piCamera import PiCamera
from time import sleep

camera=PiCamera()
camera.start_preview()
camera.rotation=180

for i in range(2):
    sleep(5)
    camera.capture('/home/pi/Desktop/img%s.jpg' %i)
    
camera.stop_preview()

# In command prompt

# raspistill -o image.jpg
# raspivid -o video.h264 -t 10000