//
//  MyAlertsViewController.swift
//  iOSControls
//
//  Created by Chanikya on 5/22/18.
//  Copyright © 2018 CanNMobile. All rights reserved.
//

import UIKit

class MyAlertsViewController: UIViewController {
    
    @IBOutlet weak var alertControllerBtnOutlet: UIButton!
    @IBOutlet weak var customAlertBtnOutlet: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alertControllerBtnOutlet.layer.cornerRadius = 2
        self.alertControllerBtnOutlet.layer.borderWidth = 1
        self.alertControllerBtnOutlet.layer.borderColor = UIColor.gray.cgColor
        
        self.customAlertBtnOutlet.layer.cornerRadius = 2
        self.customAlertBtnOutlet.layer.borderWidth = 1
        self.customAlertBtnOutlet.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func defaultAlertBtnTapped(_ sender: Any) {
        let alert = UIAlertController(title: "AlertController", message: "Example UIAlertController", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
            alert.dismiss(animated: true) {() -> Void in }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
            alert.dismiss(animated: true) {() -> Void in }
        })
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.view.tag = 9008
        present(alert, animated: true) {() -> Void in }
    }
    
    @IBAction func customAlertBtnTapped(_ sender: Any) {
        let customAlert = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlertID") as! CustomAlertController
        customAlert.providesPresentationContextTransitionStyle = true
        customAlert.definesPresentationContext = true
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        customAlert.delegate = self
        self.present(customAlert, animated: true, completion: nil)
    }
    
}

extension MyAlertsViewController: CustomAlertControllerDelegate {
    
    func okButtonTapped(selectedOption: String, textFieldValue: String) {
        print("okButtonTapped with \(selectedOption) option selected")
        print("TextField has value: \(textFieldValue)")
    }
    
    func cancelButtonTapped() {
        print("cancelButtonTapped")
    }
}
