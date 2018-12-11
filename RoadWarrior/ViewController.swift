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

class CameraViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    let swiftOCRInstance = SwiftOCR()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func openCamera(_ sender: Any) {
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func openGallery(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController,
                                        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        // Display image on screen.
//        show(originalImage)
        swiftOCRInstance.recognize(originalImage) { recognizedString in
            print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
            print(recognizedString)
            print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        }
        let cgOrientation = CGImagePropertyOrientation(rawValue: UInt32(Float(originalImage.imageOrientation.rawValue)))
        
        guard let cgImage = originalImage.cgImage else {
            return
        }
        
        performVisionRequest(image: cgImage,
                             orientation: cgOrientation!)
        
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func performVisionRequest(image: CGImage, orientation: CGImagePropertyOrientation) {
        let requests = createVisionRequests()
        let imageRequestHandler = VNImageRequestHandler(cgImage: image,
                                                        orientation: orientation,
                                                        options: [:])
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try imageRequestHandler.perform(requests)
            } catch let error as NSError {
                print("Failed to perform image request: \(error)")
//                self.presentAlert("Image Request Failed", error: error)
                return
            }
        }
    }
    
    fileprivate func createVisionRequests() -> [VNRequest] {        
        var requests: [VNRequest] = []
        
        // Create & include a request if and only if switch is ON.
        requests.append(self.textDetectionRequest)
        
        // Return grouped requests as a single array.
        return requests
    }
    
    lazy var textDetectionRequest: VNDetectTextRectanglesRequest = {
        let textDetectRequest = VNDetectTextRectanglesRequest(completionHandler: self.handleDetectedText)
        // Tell Vision to report bounding box around each character.
        textDetectRequest.reportCharacterBoxes = true
        return textDetectRequest
    }()
    
    fileprivate func handleDetectedText(request: VNRequest?, error: Error?) {
        if let nsError = error as NSError? {
//            self.presentAlert("Text Detection Error", error: nsError)
            return
        }
        print(request?.results, "this is the request.results")
    }

}

