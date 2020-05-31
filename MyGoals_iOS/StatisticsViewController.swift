//
//  StatisticsViewController.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 29..
//  Copyright © 2020. admin. All rights reserved.
//

import UIKit
import UICircularProgressRing

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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        redCardsLabel.text?.append(contentsOf: String(Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).redCardCount) + " / " + String(Utils.getRedCardsCountFromWeek()))
        
        blueCardsLabel.text?.append(contentsOf: String(Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).blueCardCount) + " / " + String(Utils.getBlueCardsCountFromWeek()))
        
        greenCardsLabel.text?.append(contentsOf: String(Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).greenCardCount + Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).lightGreenCardCount) + " / " + String(Utils.getGreenCardsCountFromWeek() + Utils.getLightGreenCardsCountFromWeek()))
        
        
    }
    
}



