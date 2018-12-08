//
//  ViewController.swift
//  RoadWarrior
//
//  Created by Garrett Hughes on 11/5/18.
//  Copyright © 2018 Garrett Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    
    
    @IBAction func openCamera(_ sender: Any) {
        presentCamera()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        promptPhoto()
    }
    
    func presentCamera() {
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true)
    }

    func promptPhoto() {
        
        let prompt = UIAlertController(title: "Choose a Photo",
                                       message: "Please choose a photo.",
                                       preferredStyle: .actionSheet)
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        func presentCamera(_ _: UIAlertAction) {
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true)
        }
        
        let cameraAction = UIAlertAction(title: "Camera",
                                         style: .default,
                                         handler: presentCamera)
        
        func presentLibrary(_ _: UIAlertAction) {
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true)
        }
        
        let libraryAction = UIAlertAction(title: "Photo Library",
                                          style: .default,
                                          handler: presentLibrary)
        
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        
        prompt.addAction(cameraAction)
        prompt.addAction(libraryAction)
        prompt.addAction(cancelAction)
        
        self.present(prompt, animated: true, completion: nil)
    }

}

