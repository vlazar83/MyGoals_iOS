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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        redCardsStatisticsLabel.text = String(Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).redCardCount)
        
    }
    
}



