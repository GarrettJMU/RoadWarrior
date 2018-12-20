//
//  ViewController.swift
//  RoadWarrior
//
//  Created by Garrett Hughes on 11/5/18.
//  Copyright © 2018 Garrett Hughes. All rights reserved.
//

import UIKit
import Vision
import SwiftOCR
import NVActivityIndicatorView

class CameraViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, NVActivityIndicatorViewable {
    @IBOutlet weak var openCamButton: UIButton!
    @IBOutlet weak var spinnerView: UIView!

    let imagePicker = UIImagePickerController()
    let swiftOCRInstance = SwiftOCR()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        let frame = CGRect(x: spinnerView.center.x, y: spinnerView.center.y, width: 50, height: 50)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame)
        self.view.addSubview(activityIndicatorView)

    }
    
    @IBAction func openCamera(_ sender: Any) {
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func openGallery(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                                        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        swiftOCRInstance.recognize(originalImage) { recognizedString in
            print("This is the recognized String <\(recognizedString)>")
            if (recognizedString == "") {
                return
            }
            self.determineIfPhoneNumber(recognizedString)
            self.stopAnimating()

        }
        let cgOrientation = CGImagePropertyOrientation(rawValue: UInt32(Float(originalImage.imageOrientation.rawValue)))

        guard let cgImage = originalImage.cgImage else {
            return
        }

        performVisionRequest(image: cgImage,
                             orientation: cgOrientation!)

        dismiss(animated: true, completion: nil)
    }
    
    func determineIfPhoneNumber(_ OCRValue: String) {
        print("Checking to see if value <\(OCRValue)> is a phone number")
        let result = self.validatePhoneNumber(OCRValue)
        
        if result {
            stopAnimating()

            print("this is a successful hit")
        } else {
            stopAnimating()

            let alert = UIAlertController(title: "Failure!", message: "Text message is queued to go out.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        stopAnimating()

    }
    
    func validatePhoneNumber(_ value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    fileprivate func performVisionRequest(image: CGImage, orientation: CGImagePropertyOrientation) {
        startAnimating()
        let requests = createVisionRequests()
        let imageRequestHandler = VNImageRequestHandler(cgImage: image,
                                                        orientation: orientation,
                                                        options: [:])
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try imageRequestHandler.perform(requests)
            } catch let error as NSError {
                print("Failed to perform image request: \(error)")
                self.launchUnexpectedErrorAlert()
                return
            }
        }
    }
    
    fileprivate func createVisionRequests() -> [VNRequest] {        
        var requests: [VNRequest] = []
        requests.append(self.textDetectionRequest)
        
        return requests
    }
    
    lazy var textDetectionRequest: VNDetectTextRectanglesRequest = {
        let textDetectRequest = VNDetectTextRectanglesRequest(completionHandler: self.handleDetectedText)
        textDetectRequest.reportCharacterBoxes = true
        
        return textDetectRequest
    }()
    
    fileprivate func handleDetectedText(request: VNRequest?, error: Error?) {
        if let nsError = error as NSError? {
            print(nsError, "this is the nsError")
            self.launchUnexpectedErrorAlert()
            return
        }
        print(request?.results, "this is the request.results")
    }
    
    func launchUnexpectedErrorAlert() {
        let alert = UIAlertController(title: "Error!", message: "There was an unexpected error.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    

}

