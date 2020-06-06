//
//  CreateNewCard.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 28..
//  Copyright © 2020. admin. All rights reserved.
//
import Shuffle_iOS
import UIKit
import PopBounceButton
import Toast_Swift

class CreateNewCardViewController: UIViewController {
    
    var sampleCard:SampleCardModel = SampleCardModel(cardGoal: "Michelle",
    cardGoalDescription: "Graphic Designer",
    image: SampleCardModel.Image(withImage: UIImage(named: "michelle")!),
    cardType: SampleCardModel.cardTypes.Blue)
    
    @IBOutlet weak var cardDetailsTextField: UITextField!
    @IBOutlet weak var cardGoalTextField: UITextField!
    
    @IBAction func createbuttonClicked(_ sender: Any) {
        
        if(cardDetailsTextField.text!.isEmpty || cardGoalTextField.text!.isEmpty){
            self.view.makeToast(NSLocalizedString("Fill all details first!", comment: ""),duration:5.0, position: .bottom)
        } else {
            let newCard = SampleCardModel(cardGoal: cardGoalTextField.text ?? "goal",
                                          cardGoalDescription: cardDetailsTextField.text ?? "details",
                                          image: sampleCard.image,
                                          cardType: sampleCard.cardType)
            
            CreatedCardSet.shared.addCardModel(card: newCard)
            
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBOutlet weak var createButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch sampleCard.cardType {
        case .Red:
            createButtonOutlet.setImage(UIImage(named: "plusRed"), for: .normal)
        case .Blue:
            createButtonOutlet.setImage(UIImage(named: "plusBlue"), for: .normal)
        case .Green:
            createButtonOutlet.setImage(UIImage(named: "plusGreen"), for: .normal)
        case .LightGreen:
            createButtonOutlet.setImage(UIImage(named: "plusLightGreen"), for: .normal)
        case .LeadingIdea: // this should not be the case ever. The planning card set does not contain the Leading Idea card. We need to have it here to avoid compiler error.
            createButtonOutlet.setImage(UIImage(named: "plusRed"), for: .normal)
        }
        //
        
    }
    
}
