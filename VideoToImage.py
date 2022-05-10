import cv2
import os

vidcap = cv2.VideoCapture('/Users/sreyareddy/Downloads/All Videos/12.MOV')
save_path = '/Users/sreyareddy/Downloads/Images/Object 1'

def getFrame(sec):
    vidcap.set(cv2.CAP_PROP_POS_MSEC,sec*1000)
    hasFrames,image = vidcap.read()
    if hasFrames:
        filename = "(12)"+str(count)+".jpg"
        completeName = os.path.join(save_path, filename)
        cv2.imwrite(completeName, image)     # save frame as JPG file
    return hasFrames


sec = 0
frameRate = 0.1  # //it will capture image in each 0.1 second
count = 1
success = getFrame(sec)
while success:
    count = count + 1
    sec = sec + frameRate
    sec = round(sec, 2)
    success = getFrame(sec)

