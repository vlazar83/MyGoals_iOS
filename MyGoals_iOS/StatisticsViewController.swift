//
//  StatisticsViewController.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 29..
//  Copyright © 2020. admin. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    

    @IBOutlet weak var redCardsStatisticsLabel: UILabel!
    
    @IBOutlet weak var blueCardsStatisticsLabel: UILabel!
    
    @IBOutlet weak var greenCardsStatisticsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        redCardsStatisticsLabel.text = String(Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).redCardCount)
        
        blueCardsStatisticsLabel.text = String(Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).blueCardCount)
        
        greenCardsStatisticsLabel.text = String(Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).greenCardCount + Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).lightGreenCardCount)
        
    }
    
}



