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
        
        // set this up later in Settings TODO!
        let target = 3
        
        redProgress = Utils.getRedCardsCountFromWeek() * 100 / target
        
        redCircleRing.startProgress(to: CGFloat(redProgress), duration: 5.0) {
          print("Done animating!")
          // Do anything your heart desires...
        }
        
        greenProgress = Utils.getGreenCardsCountFromWeek() * 100 / target
        
        greenCircleRing.startProgress(to: CGFloat(greenProgress), duration: 5.0) {
          print("Done animating!")
          // Do anything your heart desires...
        }
        
        blueProgress = Utils.getBlueCardsCountFromWeek() * 100 / target
        
        blueCircleRing.startProgress(to: CGFloat(blueProgress), duration: 5.0) {
          print("Done animating!")
          // Do anything your heart desires...
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



