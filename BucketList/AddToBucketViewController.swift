//
//  AddToBucketViewController.swift
//  BucketList
//
//  Created by Matthew Jerdidah Hansen on 28/01/2018.
//  Copyright © 2018 Matthew Jerdidah Hansen. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class AddToBucketViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBAction func addBucket(_ sender: Any) {
        if (titleField.text != "") {
            Titles.append(titleField.text!)
            Descriptions.append(descriptionField.text)
            // Dates.append(datePicker.datePickerMode)
            // Images.append(<#T##newElement: String##String#>)
            
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    // @IBOutlet var profileButton: UIButtonX!
    var imagePicker: UIImagePickerController!

    
    @IBAction func uploadImage(_ sender: UIImageView) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            let cameraAction = UIAlertAction(title: "Use Camera", style: .default) { (action) in
                
                let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
                
                if (status == .authorized) {
                    self.DisplayPicker(type: .camera)
                }
                
                if (status == .restricted) {
                    self.HandleRestriction()
                }
                
                if (status == .denied) {
                    self.HandleDenial()
                }
                
                if (status == .notDetermined) {
                    AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted) in
                        if (granted) {
                            self.DisplayPicker(type: .camera)
                        }
                    })
                }
            }
            alertController.addAction(cameraAction)
        }
        
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            let photoLibraryAction = UIAlertAction(title: "Use Photo Library", style: .default) { (action) in
                
                let status = PHPhotoLibrary.authorizationStatus()
                
                if (status == .authorized) {
                    self.DisplayPicker(type: .photoLibrary)
                }
                
                if (status == .restricted) {
                    self.HandleRestriction()
                }
                
                if (status == .denied) {
                    self.HandleDenial()
                }
                
                if (status == .notDetermined) {
                    PHPhotoLibrary.requestAuthorization({ (status) in
                        if (status == PHAuthorizationStatus.authorized) {
                            self.DisplayPicker(type: .photoLibrary)
                        }
                    })
                }
            }
            alertController.addAction(photoLibraryAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        alertController.popoverPresentationController?.sourceView = self.img
        alertController.popoverPresentationController?.sourceRect = self.img.bounds
        
        present(alertController, animated: true, completion: nil)
    }
    
    func HandleDenial() {
        let alertController = UIAlertController(title: "Media Access Denied", message: "BucketList does not have access to use your device's media. Please update your settings", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Go To Settings", style: .default) { (action) in
            DispatchQueue.main.async {
                UIApplication.shared.open(NSURL(string: UIApplicationOpenSettingsURLString)! as URL)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.popoverPresentationController?.sourceView = self.img
        alertController.popoverPresentationController?.sourceRect = self.img.bounds
        
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func HandleRestriction() {
        let alertController = UIAlertController(title: "Media Access Denied", message: "This device is restricted from accessing any media at this time", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.popoverPresentationController?.sourceView = self.img
        alertController.popoverPresentationController?.sourceRect = self.img.bounds
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func DisplayPicker(type: UIImagePickerControllerSourceType) {
        self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: type)!
        self.imagePicker.sourceType = type
        self.imagePicker.allowsEditing = true
        
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerEditedImage]
        img.image = chosenImage as? UIImage
        
        dismiss(animated: true) {() -> Void in }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) {() -> Void in }
    }
    
    
    @IBAction func cancelbucket(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // largeTitleNavBar()
        // self.img.layer.cornerRadius = img.frame.size.height / 2.0
        // self.img.clipsToBounds = true
    }
    
    
//    func largeTitleNavBar () {
//        navigationController?.navigationBar.prefersLargeTitles = true
//
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
