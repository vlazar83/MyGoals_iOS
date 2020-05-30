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
    static let statisticsYearKey = "STATISTICS_YEAR_KEY"
    
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
    
    func getStatisticsForDay(day:Int) -> Day{
        return statisticsArray[day]
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
    var dayOfYear:Int
    
    var lightGreenCardCount:Int
    var greenCardCount:Int
    var blueCardCount:Int
    var redCardCount:Int
    
    //Initializer access level change now
    init(dayOfYear : Int){
        self.dayOfYear = dayOfYear
        self.lightGreenCardCount = 0
        self.greenCardCount = 0
        self.blueCardCount = 0
        self.redCardCount = 0
        
    }
    
    
    
}
