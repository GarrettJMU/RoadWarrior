# RoadWarrior

Created by:
Garrett Hughes (823446111) <br/>
Rhythm Mecwan (819209255)

## Description:
The use case for this app is:<br/>
As a service professional I can take a picture of a fellow truck so that I can expand my network

## Features:
Upload a pic from camera or gallery <br/>
Customize text message to be sent <br/>
Use Vision ML to find text on image and regex to find the phone number <br/>
Use OCR to read said text <br/>
Push that to an AWS Lambda that sends it to slack with the image, message, and phone if OCR was successful

## Special Instructions to run:
App is restricted to iPhone 8 plus in portrait position <br/>
To run you'll need to use a real phone as your simulator, as you can't use the camera on the xcode simulator

## Third party Libraries:
list and url

## Known Issues:
