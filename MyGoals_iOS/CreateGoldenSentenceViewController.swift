//
//  CreateGoldenSentenceViewController.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 31..
//  Copyright © 2020. admin. All rights reserved.
//

import UIKit

class CreateGoldenSentenceViewController: UIViewController {

    @IBOutlet weak var enteredText: UITextField!
    
    var delegate: RefreshTableViewDelegateProtocol?
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
        if(!(enteredText.text?.isEmpty ?? true)){
            Settings.shared.getSettingsData().goldenSentences.append(enteredText.text ?? NSLocalizedString("new golden sentence", comment: ""))
            self.delegate?.refreshTableView()
            Utils.storeSettingsToUserDefaults()
            dismiss(animated: true, completion: nil)
        } else {
            self.view.makeToast(NSLocalizedString("Enter the new golden sentence first!", comment: ""),duration:5.0, position: .bottom)
        }
        

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.delegate = self.presentingViewController as? RefreshTableViewDelegateProtocol
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
