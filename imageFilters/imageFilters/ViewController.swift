//
//  ViewController.swift
//  imageFilters
//
//  Created by Lance Davenport on 3/3/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
   
    @IBOutlet weak var imageView: UIImageView!
    var orginalPhoto: UIImage!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var filterChoice:String = ""
    var CIFilterNames = [
        "CIPhotoEffectChrome",
        "CIPhotoEffectFade",
        "CIPhotoEffectInstant",
        "CIPhotoEffectNoir",
        "CIPhotoEffectProcess",
        "CIPhotoEffectTonal",
        "CIPhotoEffectTransfer",
        "CISepiaTone"
    ]
    @IBAction func photoButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func fadeFilter(_ sender: Any) {
        let context = CIContext(options:nil)
        if let filter = CIFilter(name: "CIPhotoEffectFade" ) {
            let beginImage = CIImage(image: orginalPhoto)
            filter.setDefaults()
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            
            if let output = filter.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    imageView.image = processedImage
                }
            }
        }
        
    }
    @IBAction func chromeFilter(_ sender: Any) {
        let context = CIContext(options:nil)
        if let filter = CIFilter(name: "CIPhotoEffectChrome" ) {
            let beginImage = CIImage(image: orginalPhoto)
            filter.setDefaults()
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            
            if let output = filter.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    imageView.image = processedImage
                }
            }
        }
    }
    @IBAction func noirFilter(_ sender: Any) {
        let context = CIContext(options:nil)
        if let filter = CIFilter(name: "CIPhotoEffectNoir" ) {
            let beginImage = CIImage(image: orginalPhoto)
            filter.setDefaults()
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            
            if let output = filter.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    imageView.image = processedImage
                }
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage]as! UIImage
        imageView.image = image
        orginalPhoto = image
        imageView.transform = CGAffineTransform(rotationAngle: .pi/2)
    }
    
}

