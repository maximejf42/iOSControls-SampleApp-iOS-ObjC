//
//  SwiftImageController.swift
//  iOSAutomationTestApp
//
//  Created by Chanikya Mandapathi on 9/4/16.
//  Copyright © 2016 CanNMobile. All rights reserved.
//

import UIKit
import Tealeaf

class SwiftImageController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.imageView.image = UIImage(imageLiteral: "tealeaf")
    }
    
    @IBAction func getPhoto(_ sender: AnyObject) {
        
        self.imageView.image = UIImage(named:"tealeaf")
        
//        let picker = UIImagePickerController()
//        picker.sourceType = .PhotoLibrary
//        picker.delegate = self
//        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = image
       // dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postPhoto(_ sender: AnyObject) {
        
        let stat:Bool = TLFCustomEvent.sharedInstance().logImage(self.imageView.image)
        print("Status of log image \(stat)")
        
        AppManager.sharedInstance().isImageUploaded = stat
    }
}
