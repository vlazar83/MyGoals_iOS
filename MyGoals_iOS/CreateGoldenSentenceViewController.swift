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
            Settings.shared.getSettingsData().goldenSentences.append(enteredText.text ?? "new golden sentence")
            self.delegate?.refreshTableView()
            Utils.storeSettingsToUserDefaults()
            dismiss(animated: true, completion: nil)
        } else {
            showToast(message: "Enter the new golden sentence first!")
        }
        

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.delegate = self.presentingViewController as? RefreshTableViewDelegateProtocol
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
