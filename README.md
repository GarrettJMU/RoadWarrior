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
REST to slack with the image, message, and phone

## Special Instructions to run:
App is restricted to iPhone 8 plus in portrait position <br/>
To run you'll need to use a real phone as your simulator, as you can't use the camera on the xcode simulator 

## Third party Libraries:
Swift OCR -> https://github.com/garnele007/SwiftOCR <br/>
NVActivityIndicatorView -> https://github.com/ninjaprox/NVActivityIndicatorView <br/>
Alamofire -> https://github.com/Alamofire/Alamofire

## Known Issues:
The OCR isn't powerful enough to read the text so it always hits the else block and sends to slack (which is OK as we still retain the data). Given this issue we focused on just sending the image to slack no matter what (so we retain the image). We'll then have an intern read the text, send off the message on a short coded message (we do not have said intern, yet). <br/>
I cant put Housecall's private keys for Slack in the app (for obvious reasons) so I created a mock call here that just returns hello world <br/>
I'm not sure if it's on my end or on the OCR end but the OCR takes ~15-20s. I put some quick examples here that you can test off of: </br>
We wanted to do one stretch feature (which we chose to be upload from gallery). For whatever reason that keeps crashing on us. <br/>
### FAILING EXAMPLE: TAKE A PICTURE WITH YOUR PHONE, YOU'LL SEE A LOADING SPINNER AND A FAILURE DIALOG <br/>
<img src="http://bourbonstreetshots.com/wp-content/uploads/2016/12/failure.jpg"/>

### AN EXAMPLE THAT SHOULD WORK: TAKE A PICTURE WITH YOUR PHONE, YOU'LL SEE A LOADING SPINNER AND A FAILURE DIALOG<br/>
You can see in the logs request.results has multiple things from the Vision kit yet OCR picks it up as TJLL <br/>

<img src="https://www.wikihow.com/images/f/f7/Ask-Your-Crush-for-Their-Cell-Phone-Number-Step-15.jpg"/> 

