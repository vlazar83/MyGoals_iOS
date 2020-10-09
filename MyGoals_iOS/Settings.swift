//
//  Settings.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 31..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation

class Settings{
    
    static let shared = Settings()
    static let settingsKey = "SETTINGS_KEY"
    static let emptyGoldenSentences = NSLocalizedString("There are no golden sentences to display, create one from menu", comment : "")

    private var settingsData : SettingsData = SettingsData()
    //Initializer access level change now
    private init(){}
    
    func getSettingsData() -> SettingsData{
        return settingsData
    }
    
    func setSettingsData(newSettings: SettingsData) -> (){
        self.settingsData = newSettings
    }
    
    func addDefaultGoldenSentences() -> (){
        self.settingsData.goldenSentences = SettingsData.defaultGoldenSentences
    }

}

class SettingsData: NSObject, Codable{
    
    private let defaultWeeklyTarget = 3
    public let defaultAge = 40

    var weeklyRedTarget: Int
    var weeklyGreenTarget: Int
    var weeklyBlueTarget: Int
    var age: Int
    var isLark: Bool
    var isExtrovert: Bool
    var inFamily: Bool
    
    var goldenSentences : [String] = []
    
    static let defaultGoldenSentences : [String] = ["Sample Golden Sentence 1","Sample Golden Sentence 2"]
    
    internal override init() {
        
        self.weeklyRedTarget = defaultWeeklyTarget
        self.weeklyGreenTarget = defaultWeeklyTarget
        self.weeklyBlueTarget = defaultWeeklyTarget
        self.age = defaultAge
        self.isLark = true
        self.isExtrovert = true
        self.inFamily = true
        
        self.goldenSentences.append(contentsOf: SettingsData.defaultGoldenSentences)
        
    }
    
}
