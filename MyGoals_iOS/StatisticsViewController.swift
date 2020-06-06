//
//  StatisticsViewController.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 29..
//  Copyright © 2020. admin. All rights reserved.
//

import UIKit
import UICircularProgressRing
import Toast_Swift

class StatisticsViewController: UIViewController {
    @IBOutlet weak var redCardsLabel: UILabel!
    @IBOutlet weak var greenCardsLabel: UILabel!
    @IBOutlet weak var blueCardsLabel: UILabel!
    
    @IBOutlet weak var redCircleRing: UICircularProgressRing!
    @IBOutlet weak var blueCircleRing: UICircularProgressRing!
    @IBOutlet weak var greenCircleRing: UICircularProgressRing!
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        var redProgress, greenProgress, blueProgress: Int
        
        redProgress = Utils.getRedCardsCountFromWeek() * 100 / Settings.shared.getSettingsData().weeklyRedTarget
        
        redCircleRing.startProgress(to: CGFloat(redProgress), duration: 5.0) {

        }
        
        // green and lightGreen cards are calculated together!
        greenProgress = (Utils.getGreenCardsCountFromWeek() + Utils.getLightGreenCardsCountFromWeek()) * 100 / Settings.shared.getSettingsData().weeklyGreenTarget
        
        greenCircleRing.startProgress(to: CGFloat(greenProgress), duration: 5.0) {

        }
        
        blueProgress = Utils.getBlueCardsCountFromWeek() * 100 / Settings.shared.getSettingsData().weeklyBlueTarget
        
        blueCircleRing.startProgress(to: CGFloat(blueProgress), duration: 5.0) {

        }
        
        if(Settings.shared.getSettingsData().isExtrovert){
            if(Utils.getGreenCardsCountFromWeek() < 3){
                self.view.makeToast("Try to spend time with your family/friends!",duration:5.0, position: .bottom)
            }
        } else {
            if(Utils.getLightGreenCardsCountFromWeek() < 3){
                self.view.makeToast("Try to allocate time for yourself!",duration:5.0, position: .bottom)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        redCardsLabel.text?.append(contentsOf: String(Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).redCardCount) + " / " + String(Utils.getRedCardsCountFromWeek()) + " / " + String(Settings.shared.getSettingsData().weeklyRedTarget))
        
        blueCardsLabel.text?.append(contentsOf: String(Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).blueCardCount) + " / " + String(Utils.getBlueCardsCountFromWeek()) + " / " + String(Settings.shared.getSettingsData().weeklyBlueTarget))
        
        greenCardsLabel.text?.append(contentsOf: String(Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).greenCardCount + Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).lightGreenCardCount) + " / " + String(Utils.getGreenCardsCountFromWeek() + Utils.getLightGreenCardsCountFromWeek()) + " / " + String(Settings.shared.getSettingsData().weeklyGreenTarget))
        
        
    }
    
}



