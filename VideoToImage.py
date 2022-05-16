import cv2
import os
import imutils

vidcap = cv2.VideoCapture('/Users/sreyareddy/Developer/Python/KNU Museum/All Videos/102.MOV')

save_path = '/Users/sreyareddy/Developer/Python/KNU Museum/Images/Train/10'

def getFrame(sec):
    vidcap.set(cv2.CAP_PROP_POS_MSEC,sec*1000)
    hasFrames,image = vidcap.read()
    if hasFrames:
        filename = "(102)"+str(count)+".jpg"
        completeName = os.path.join(save_path, filename)
        try:
            resized = imutils.resize(image, width=200)
            img = cv2.cvtColor(resized, cv2.COLOR_BGR2GRAY)

            cv2.imwrite(completeName, img)  # save frame as JPG file
        except:
            print("Not Working")

    return hasFrames

sec = 0

# Capture one frame every 0.5 seconds
frameRate = 0.5  
count = 1
success = getFrame(sec)
while success:
    count = count + 1
    sec = sec + frameRate
    sec = round(sec, 2)
    success = getFrame(sec)

    
