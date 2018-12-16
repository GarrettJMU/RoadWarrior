//
//  SettingsViewController.swift
//  RoadWarrior
//
//  Created by Garrett Hughes on 12/15/18.
//  Copyright © 2018 Garrett Hughes. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var defaultMessageTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillInFields()
    }
    
    func fillInFields() {
        guard let phoneNumer = UserDefaults.standard.string(forKey: "phoneNumber"), let message = UserDefaults.standard.string(forKey: "message") else {
            fillInFieldsWithDefaults()
            return
        }
        phoneNumberTextField.text = phoneNumer
        defaultMessageTextField.text = message
    }
    
    func fillInFieldsWithDefaults() {
        phoneNumberTextField.text = ""
        defaultMessageTextField.text = "Hi, I'm looking to expand my network in the area. If you're ever in need of Service Company, feel free to reach out."
    }
    
    @IBAction func updateNSDefaults(_ sender: Any) {
        UserDefaults.standard.set(phoneNumberTextField.text,forKey: "phoneNumber")
        UserDefaults.standard.set(defaultMessageTextField.text, forKey: "message")
        showAlertForSave()
        
    }
    
    func showAlertForSave() {
        let alert = UIAlertController(title: "Success!", message: "You have updated your preferences.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            let newView = CameraViewController()
            self.navigationController?.pushViewController(newView, animated: true)
            }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

