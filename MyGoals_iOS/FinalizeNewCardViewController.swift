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
    
    @IBOutlet weak var imageTitle: UITextField!
    @IBOutlet weak var imageDetails: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var createNewGreenCardButton: UIButton!
    @IBOutlet weak var createNewRedCardButton: UIButton!
    @IBOutlet weak var createNewLightGreenCardButton: UIButton!
    @IBOutlet weak var createNewBlueCardButton: UIButton!
    
    var delegate: RefreshOwnCardsDelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setToolbarHidden(false, animated: false)
        createNewGreenCardButton.isHidden = true
        createNewRedCardButton.isHidden = true
        createNewBlueCardButton.isHidden = true
        createNewLightGreenCardButton.isHidden = true
        self.delegate = self.presentingViewController as? RefreshOwnCardsDelegateProtocol
    }

    @IBAction func takePhoto(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @IBAction func createNewBlueCard(_ sender: Any) {
        
        if(imageTitle.text!.isEmpty || imageDetails.text!.isEmpty){
            self.view.makeToast(NSLocalizedString("Fill all details first!", comment: ""),duration:5.0, position: .bottom)
        } else {
            createTheNewCard(type: SampleCardModel.cardTypes.Blue)
            navigateBack()
        }
        
    }
    
    @IBAction func createNewRedCard(_ sender: Any) {
        
        if(imageTitle.text!.isEmpty || imageDetails.text!.isEmpty){
            self.view.makeToast(NSLocalizedString("Fill all details first!", comment: ""),duration:5.0, position: .bottom)
        } else {
            createTheNewCard(type: SampleCardModel.cardTypes.Red)
            navigateBack()
        }
        
    }
    
    @IBAction func createNewLightGreenCard(_ sender: Any) {
        
        if(imageTitle.text!.isEmpty || imageDetails.text!.isEmpty){
            self.view.makeToast(NSLocalizedString("Fill all details first!", comment: ""),duration:5.0, position: .bottom)
        } else {
            createTheNewCard(type: SampleCardModel.cardTypes.LightGreen)
            navigateBack()
        }
    }
    
    @IBAction func createNewGreenCard(_ sender: Any) {
        
        if(imageTitle.text!.isEmpty || imageDetails.text!.isEmpty){
            self.view.makeToast(NSLocalizedString("Fill all details first!", comment: ""),duration:5.0, position: .bottom)
        } else {
            createTheNewCard(type: SampleCardModel.cardTypes.Green)
            navigateBack()
        }
        
    }
    
    func createTheNewCard(type: SampleCardModel.cardTypes){
        let newCard = SampleCardModel(cardGoal: imageTitle.text ?? "title",
                                      cardGoalDescription: imageDetails.text ?? "details",
                                      image: SampleCardModel.Image(withImage: imageView!.image!),
                                      cardType: type)
        
        CreatedCardSet.shared.addCardModel(card: newCard)
        
        Utils.storeCreatedCardsToUserDefaults()
    }
    
    func navigateBack(){
        // ask the delegate to refresh the own card set
        self.delegate?.refreshOwnCards()
        dismiss(animated: true, completion: nil)
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
        createNewGreenCardButton.isHidden = false
        createNewRedCardButton.isHidden = false
        createNewBlueCardButton.isHidden = false
        createNewLightGreenCardButton.isHidden = false
    }
}
