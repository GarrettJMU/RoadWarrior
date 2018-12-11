//
//  ViewController.swift
//  RoadWarrior
//
//  Created by Garrett Hughes on 11/5/18.
//  Copyright © 2018 Garrett Hughes. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    
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

}

