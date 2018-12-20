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
I'm not sure if it's on my end or on the OCR end but the OCR takes ~15-20s. I put some quick examples here that you can test off of:
FAILING EXAMPLE:
![](https://mail.google.com/mail/u/0?ui=2&ik=5664a5bb8b&attid=0.1&permmsgid=msg-f:1620386512394583846&th=167cc4f2a61cff26&view=fimg&sz=s0-l75-ft&attbid=ANGjdJ8XcOdsSy1Sn3Oo8r4OYitdMBfa7EXtTtPo89M3MS6EUsTfSUFtNVC6i40RRYpxVjk1x2x_Mz_rN-jGKPqQK6WTWikBzqNusbFB3oyhPFnh88DzlcXZlgTlEzM&disp=emb&realattid=167cc4eeb5ab90fc3361)

![](https://ssl.gstatic.com/ui/v1/icons/mail/images/cleardot.gif)

| ![](https://ssl.gstatic.com/ui/v1/icons/mail/no_photo.png) |

ReplyForward

 |

[](https://drive.google.com/u/0/settings/storage?hl=en)

[](https://www.google.com/gmail/about/policy/)

[](https://www.google.com/)

