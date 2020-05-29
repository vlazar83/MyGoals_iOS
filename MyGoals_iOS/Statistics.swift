//
//  Statistics.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 29..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation

class Statistics :NSObject, Codable{
    
    var year: Int
    static let shared = Statistics()
    static let statisticsKey = "STATISTICS_KEY"
    
    private var statisticsArray : [Day] = []
    
    override init(){
        self.year = Calendar.current.component(.year, from: Date())
        
        for n in 0...367 {
            statisticsArray.append(Day(dayOfYear: n))
        }
        
    }
    
    func resetValues() -> (){
        self.year = Calendar.current.component(.year, from: Date())
        
        for n in 0...367 {
            statisticsArray.append(Day(dayOfYear: n))
        }
    }
    
    func getStatistics() -> [Day]{
        return statisticsArray
    }
    
    func setStatistics(newStatisticsArray: [Day]) -> (){
        self.statisticsArray = newStatisticsArray
    }
    
    func resetStatistics() -> (){
        self.statisticsArray.removeAll()
        resetValues()
    }
    
}


class Day :NSObject, Codable{
    
    // shows which day we are at
    private var dayOfYear:Int
    
    private var lightGreenCardCount:Int
    private var greenCardCount:Int
    private var blueCardCount:Int
    private var redCardCount:Int
    
    //Initializer access level change now
    init(dayOfYear : Int){
        self.dayOfYear = dayOfYear
        self.lightGreenCardCount = 0
        self.greenCardCount = 0
        self.blueCardCount = 0
        self.redCardCount = 0
        
    }
    
    
    
}
