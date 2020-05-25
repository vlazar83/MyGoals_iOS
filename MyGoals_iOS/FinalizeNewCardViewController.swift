//
//  FinalizeNewCardViewController.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 25..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation
import UIKit

class FinalizeNewCardViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setToolbarHidden(false, animated: false)
        
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    @IBAction func createNewCard(_ sender: Any) {
    }
    override open var shouldAutorotate: Bool {
        return false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        imageView.image = info[.originalImage] as? UIImage

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }

        // print out the image size as a test
        print(image.size)
    }
}
