//
//  SettingsViewController.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 30..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var aloneOrInFamilyLabel: UILabel!
    
    @IBOutlet weak var introvertOrExtrovertLabel: UILabel!
    
    @IBOutlet weak var owlOrLarkLabel: UILabel!
    
    @IBOutlet weak var aloneOrInFamilySwitch: UISwitch!
    
    @IBOutlet weak var introvertOrExtrovertSwitch: UISwitch!
    
    @IBOutlet weak var owlOrLarkSwitch: UISwitch!
    
    @IBAction func aloneOrInFamilySwitchClicked(_ sender: Any) {
        
        if aloneOrInFamilySwitch.isOn {
            aloneOrInFamilyLabel.text = "In Family"
        }
        else {
            aloneOrInFamilyLabel.text = "Alone"
        }
        
    }
    
    @IBAction func introvertOrExtrovertSwitchClicked(_ sender: Any) {
        
        if introvertOrExtrovertSwitch.isOn {
            introvertOrExtrovertLabel.text = "Extrovert"
        }
        else {
            introvertOrExtrovertLabel.text = "Introvert"
        }
        
    }
    
    @IBAction func owlOrLarkSwitchClicked(_ sender: Any) {
        
        if owlOrLarkSwitch.isOn {
            owlOrLarkLabel.text = "Lark"
        }
        else {
            owlOrLarkLabel.text = "Owl"
        }
        
    }
    
    
    @IBOutlet weak var enteredAgeTextView: UITextField!
    
    @IBOutlet weak var redWeeklyTargetButtonLabel: UIButton!
    
    @IBOutlet weak var greenWeeklyTargetButtonLabel: UIButton!
    
    @IBOutlet weak var blueWeeklyTargetButtonLabel: UIButton!
    
    @IBAction func redWeeklyTargetButtonClicked(_ sender: Any) {
        
        if((redWeeklyTargetButtonLabel.currentTitle?.elementsEqual("10"))!){
            redWeeklyTargetButtonLabel.setTitle("1", for: .normal)
        } else {
            let target = Int(redWeeklyTargetButtonLabel.currentTitle!)! + 1
            redWeeklyTargetButtonLabel.setTitle(String(target), for: .normal)
        }
        
    }
    
    @IBAction func greenWeeklyTargetButtonClicked(_ sender: Any) {
        
        if((greenWeeklyTargetButtonLabel.currentTitle?.elementsEqual("10"))!){
            greenWeeklyTargetButtonLabel.setTitle("1", for: .normal)
        } else {
            let target = Int(greenWeeklyTargetButtonLabel.currentTitle!)! + 1
            greenWeeklyTargetButtonLabel.setTitle(String(target), for: .normal)
        }
        
    }
    
    @IBAction func blueWeeklyTargetButtonClicked(_ sender: Any) {
        
        if((blueWeeklyTargetButtonLabel.currentTitle?.elementsEqual("10"))!){
            blueWeeklyTargetButtonLabel.setTitle("1", for: .normal)
        } else {
            let target = Int(blueWeeklyTargetButtonLabel.currentTitle!)! + 1
            blueWeeklyTargetButtonLabel.setTitle(String(target), for: .normal)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
