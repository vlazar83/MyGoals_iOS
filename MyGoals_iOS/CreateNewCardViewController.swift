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

class CreateNewCardViewController: UIViewController {
    
    var sampleCard:SampleCardModel = SampleCardModel(cardGoal: "Michelle",
    cardGoalDescription: "Graphic Designer",
    image: SampleCardModel.Image(withImage: UIImage(named: "michelle")!),
    cardType: SampleCardModel.cardTypes.Blue)
    
    @IBOutlet weak var cardDetailsTextField: UITextField!
    @IBOutlet weak var cardGoalTextField: UITextField!
    
    @IBAction func createbuttonClicked(_ sender: Any) {
        
        if(cardDetailsTextField.text!.isEmpty || cardGoalTextField.text!.isEmpty){
            showToast(message:NSLocalizedString("Fill all details first!", comment: ""))
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
    
    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
