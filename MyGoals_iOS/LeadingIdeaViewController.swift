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
            
            LeadingIdeaCardSet.shared.addCardModel(card: Utils.generateLeadingIdeaCard(withIdea: enteredLeadingIdea.text!))
            
            Utils.storeCardsToUserDefaults(cardSet: LeadingIdeaCardSet.shared.getCardModels(), key: LeadingIdeaCardSet.leadingIdeaCardSetKey)
            
            navigateBack()
            
        } else {
             self.view.makeToast(NSLocalizedString("Fill the Idea first!", comment: ""),duration:5.0, position: .bottom)
        }
        
    }
    
    func navigateBack(){
        self.delegate?.refreshCards()
        dismiss(animated: true, completion: nil)
    }
    
}

