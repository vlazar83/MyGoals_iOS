//
//  LeadingIdeaViewController.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 29..
//  Copyright © 2020. admin. All rights reserved.
//
import UIKit

class LeadingIdeaViewController: UIViewController {
    
    var delegate: RefreshCardsDelegateProtocol?
    
    @IBOutlet weak var enteredLeadingIdea: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.delegate = self.presentingViewController?.presentingViewController as? RefreshCardsDelegateProtocol

        
    }
    
    @IBAction func updateButtonClicked(_ sender: Any) {
        
        if(!enteredLeadingIdea.text!.isEmpty){
            
            LeadingIdeaCardSet.shared.dropAllCards()
            
            LeadingIdeaCardSet.shared.addCardModel(card:
                SampleCardModel(cardGoal: NSLocalizedString("Leading Idea", comment: ""),
                                cardGoalDescription: enteredLeadingIdea.text!,
                                image: SampleCardModel.Image(withImage: UIImage(named: "michelle")!),
                                cardType: SampleCardModel.cardTypes.LeadingIdea)
            )
            
            Utils.storeCardsToUserDefaults(cardSet: LeadingIdeaCardSet.shared.getCardModels(), key: LeadingIdeaCardSet.leadingIdeaCardSetKey)
            
            navigateBack()
            
        } else {
            showToast(message : NSLocalizedString("Fill the Idea first!", comment: ""))
        }
        
    }
    
    func navigateBack(){
        self.delegate?.refreshCards()
        dismiss(animated: true, completion: nil)
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

