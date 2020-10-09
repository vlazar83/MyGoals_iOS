//
//  SettingsViewController.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 30..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation
import UIKit

protocol RefreshTableViewDelegateProtocol {
  func refreshTableView()
}

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RefreshTableViewDelegateProtocol {
    
    func refreshTableView() {
      // do something
        self.tableView.reloadData()
    } 
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var aloneOrInFamilyLabel: UILabel!
    
    @IBOutlet weak var introvertOrExtrovertLabel: UILabel!
    
    @IBOutlet weak var owlOrLarkLabel: UILabel!
    
    @IBOutlet weak var aloneOrInFamilySwitch: UISwitch!
    
    @IBOutlet weak var introvertOrExtrovertSwitch: UISwitch!
    
    @IBOutlet weak var owlOrLarkSwitch: UISwitch!
    
    @IBAction func aloneOrInFamilySwitchClicked(_ sender: Any) {
        
        if aloneOrInFamilySwitch.isOn {
            aloneOrInFamilyLabel.text = NSLocalizedString("In Family", comment: "")
            Settings.shared.getSettingsData().inFamily = true
        }
        else {
            aloneOrInFamilyLabel.text = NSLocalizedString("Alone", comment: "")
            Settings.shared.getSettingsData().inFamily = false
        }
        
    }
    
    @IBAction func introvertOrExtrovertSwitchClicked(_ sender: Any) {
        
        if introvertOrExtrovertSwitch.isOn {
            introvertOrExtrovertLabel.text = NSLocalizedString("Extrovert", comment: "")
            Settings.shared.getSettingsData().isExtrovert = true
        }
        else {
            introvertOrExtrovertLabel.text = NSLocalizedString("Introvert", comment: "")
            Settings.shared.getSettingsData().isExtrovert = false
        }
        
    }
    
    @IBAction func owlOrLarkSwitchClicked(_ sender: Any) {
        
        if owlOrLarkSwitch.isOn {
            owlOrLarkLabel.text = NSLocalizedString("Lark", comment: "")
            Settings.shared.getSettingsData().isLark = true
        }
        else {
            owlOrLarkLabel.text = NSLocalizedString("Owl", comment: "")
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.loadSettingsFromUserDefaults()
        setupValuesOnUi()
        
        enteredAgeTextView.addTarget(self, action: #selector(SettingsViewController.textFieldDidChange(_:)), for: .editingDidEnd)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        if let ageValue = Int(enteredAgeTextView.text ?? "40"){
            if(ageValue >= 15 && ageValue <= 100) {
                 Settings.shared.getSettingsData().age = ageValue
            } else {
                Settings.shared.getSettingsData().age = 40
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Utils.storeSettingsToUserDefaults()
    }
    
    private func setupValuesOnUi(){
        
        if(Settings.shared.getSettingsData().inFamily){
            aloneOrInFamilySwitch.isOn = true
            aloneOrInFamilyLabel.text = NSLocalizedString("In Family", comment: "")
        } else {
            aloneOrInFamilySwitch.isOn = false
            aloneOrInFamilyLabel.text = NSLocalizedString("Alone", comment: "")
        }
        
        if(Settings.shared.getSettingsData().isExtrovert){
            introvertOrExtrovertSwitch.isOn = true
            introvertOrExtrovertLabel.text = NSLocalizedString("Extrovert", comment: "")
        } else {
            introvertOrExtrovertSwitch.isOn = false
            introvertOrExtrovertLabel.text = NSLocalizedString("Introvert", comment: "")
        }
        
        if(Settings.shared.getSettingsData().isLark){
            owlOrLarkSwitch.isOn = true
            owlOrLarkLabel.text = NSLocalizedString("Lark", comment: "")
        } else {
            owlOrLarkSwitch.isOn = false
            owlOrLarkLabel.text = NSLocalizedString("Owl", comment: "")
        }
        
        enteredAgeTextView.text = String(Settings.shared.getSettingsData().age)
        
    redWeeklyTargetButtonLabel.setTitle(String(Settings.shared.getSettingsData().weeklyRedTarget), for: .normal)
    
    greenWeeklyTargetButtonLabel.setTitle(String(Settings.shared.getSettingsData().weeklyGreenTarget), for: .normal)
    
    blueWeeklyTargetButtonLabel.setTitle(String(Settings.shared.getSettingsData().weeklyBlueTarget), for: .normal)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.shared.getSettingsData().goldenSentences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoldenSentenceCell", for: indexPath) as! GoldenSentenceTableViewCell
        cell.goldenSentenceLabel.text = Settings.shared.getSettingsData().goldenSentences[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // create the alert instead of the Toast
        let alert = UIAlertController(title: NSLocalizedString("Really delete?", comment: ""), message: NSLocalizedString("Really delete this golden sentence?", comment: ""), preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Delete", comment: ""),
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
                                      
                                    Settings.shared.getSettingsData().goldenSentences.remove(at: indexPath.row)
                                    self.tableView.reloadData()
        }))

        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
        
        
    }
    
}
