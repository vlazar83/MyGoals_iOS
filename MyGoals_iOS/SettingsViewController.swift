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
            Settings.shared.getSettingsData().inFamily = true
        }
        else {
            aloneOrInFamilyLabel.text = "Alone"
            Settings.shared.getSettingsData().inFamily = false
        }
        
    }
    
    @IBAction func introvertOrExtrovertSwitchClicked(_ sender: Any) {
        
        if introvertOrExtrovertSwitch.isOn {
            introvertOrExtrovertLabel.text = "Extrovert"
            Settings.shared.getSettingsData().isExtrovert = true
        }
        else {
            introvertOrExtrovertLabel.text = "Introvert"
            Settings.shared.getSettingsData().isExtrovert = false
        }
        
    }
    
    @IBAction func owlOrLarkSwitchClicked(_ sender: Any) {
        
        if owlOrLarkSwitch.isOn {
            owlOrLarkLabel.text = "Lark"
            Settings.shared.getSettingsData().isLark = true
        }
        else {
            owlOrLarkLabel.text = "Owl"
            Settings.shared.getSettingsData().isLark = false
        }
        
    }
    
    
    @IBOutlet weak var enteredAgeTextView: UITextField!
    
    @IBOutlet weak var redWeeklyTargetButtonLabel: UIButton!
    
    @IBOutlet weak var greenWeeklyTargetButtonLabel: UIButton!
    
    @IBOutlet weak var blueWeeklyTargetButtonLabel: UIButton!
    
    @IBAction func redWeeklyTargetButtonClicked(_ sender: Any) {
        
        if((redWeeklyTargetButtonLabel.currentTitle?.elementsEqual("10"))!){
            redWeeklyTargetButtonLabel.setTitle("1", for: .normal)
            Settings.shared.getSettingsData().weeklyRedTarget = 1
        } else {
            let target = Int(redWeeklyTargetButtonLabel.currentTitle!)! + 1
            redWeeklyTargetButtonLabel.setTitle(String(target), for: .normal)
            Settings.shared.getSettingsData().weeklyRedTarget = target
        }
        
    }
    
    @IBAction func greenWeeklyTargetButtonClicked(_ sender: Any) {
        
        if((greenWeeklyTargetButtonLabel.currentTitle?.elementsEqual("10"))!){
            greenWeeklyTargetButtonLabel.setTitle("1", for: .normal)
            Settings.shared.getSettingsData().weeklyGreenTarget = 1
        } else {
            let target = Int(greenWeeklyTargetButtonLabel.currentTitle!)! + 1
            greenWeeklyTargetButtonLabel.setTitle(String(target), for: .normal)
            Settings.shared.getSettingsData().weeklyGreenTarget = target
        }
        
    }
    
    @IBAction func blueWeeklyTargetButtonClicked(_ sender: Any) {
        
        if((blueWeeklyTargetButtonLabel.currentTitle?.elementsEqual("10"))!){
            blueWeeklyTargetButtonLabel.setTitle("1", for: .normal)
            Settings.shared.getSettingsData().weeklyBlueTarget = 1
        } else {
            let target = Int(blueWeeklyTargetButtonLabel.currentTitle!)! + 1
            blueWeeklyTargetButtonLabel.setTitle(String(target), for: .normal)
            Settings.shared.getSettingsData().weeklyBlueTarget = target
        }
        
        Utils.storeSettingsToUserDefaults()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.loadSettingsFromUserDefaults()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Utils.storeSettingsToUserDefaults()
    }
    
    
}
