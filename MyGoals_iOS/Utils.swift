//
//  Utils.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 26..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation

class Utils {
    
    // age related messages, for each age group
    static let defaultAge20RelatedSentences : [String] = ["Age 20","Age 21"]
    
    static let defaultAge30RelatedSentences : [String] = ["Age 30","Age 31"]
    
    static let defaultAge40RelatedSentences : [String] = ["Age 40","Age 41"]
    
    static let defaultAge50RelatedSentences : [String] = ["Age 50","Age 51"]
    
    static let defaultAge60RelatedSentences : [String] = ["Age 60","Age 61"]
    
    static let lastDisplayedAgeRelatedMessageKey = "LAST_DISPLAYED_AGE_RELATED_MESSAGE_KEY"
    
    static func loadCreatedCardsFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: CreatedCardSet.createdCardSetKey) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let createdCards = try decoder.decode([SampleCardModel].self, from: data)
                CreatedCardSet.shared.setCardModels(NewCardModels: createdCards)

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
    
    static func storeCreatedCardsToUserDefaults(){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(CreatedCardSet.shared.getCardModels())

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: CreatedCardSet.createdCardSetKey)

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    static func loadCardsFromUserDefaults(key: String) -> [SampleCardModel] {
        var createdCards:[SampleCardModel] = []
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                createdCards = try decoder.decode([SampleCardModel].self, from: data)

                } catch {
                    print("Unable to Decode Notes (\(error))")
                }
        }
        return createdCards
    }
    
    static func storeCardsToUserDefaults(cardSet: [SampleCardModel], key: String){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(cardSet)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: key)

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    static func loadStatisticsFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: Statistics.statisticsKey) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let statistics = try decoder.decode([Day].self, from: data)
                Statistics.shared.setStatistics(newStatisticsArray: statistics)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
    
    static func storeStatisticsToUserDefaults(){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(Statistics.shared.getStatistics())

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: Statistics.statisticsKey)

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    static func storeStatisticsYearToUserDefaults(){

        let defaults = UserDefaults.standard
        defaults.set(Statistics.shared.year, forKey: Statistics.statisticsYearKey)

    }
    
    static func loadStatisticsYearFromUserDefaults() -> Int{
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: Statistics.statisticsYearKey)
    }
    
    static func getRedCardsCountFromWeek() -> Int {
        var total = 0
        
        for n in getFirstDayOfWeekBasedOnToday()...getLastDayOfWeekBasedOnToday(){
            if(n<=366){
                total += Statistics.shared.getStatisticsForDay(day: n).redCardCount
            }
        }
        
        return total
    }
    
    static func getGreenCardsCountFromWeek() -> Int {
        var total = 0
        
        for n in getFirstDayOfWeekBasedOnToday()...getLastDayOfWeekBasedOnToday(){
            if(n<=366){
                total += Statistics.shared.getStatisticsForDay(day: n).greenCardCount
            }
            
        }
        
        return total
    }
    
    static func getLightGreenCardsCountFromWeek() -> Int {
        var total = 0
        
        for n in getFirstDayOfWeekBasedOnToday()...getLastDayOfWeekBasedOnToday(){
            if(n<=366){
                total += Statistics.shared.getStatisticsForDay(day: n).lightGreenCardCount
            }
        }
        
        return total
    }
    
    static func getBlueCardsCountFromWeek() -> Int {
        var total = 0
        
        for n in getFirstDayOfWeekBasedOnToday()...getLastDayOfWeekBasedOnToday(){
            if(n<=366){
                total += Statistics.shared.getStatisticsForDay(day: n).blueCardCount
            }
        }
        
        return total
    }
    
    
    static func getDayOfYear() -> Int{
        let date = Date() // now
        let cal = Calendar.current
        let day = cal.ordinality(of: .day, in: .year, for: date)
        return day!
    }
    
    // returns an integer from 1 - 7, with 1 being Sunday and 7 being Saturday
    static func getDayOfWeek() -> Int {
        return Date().dayNumberOfWeek()!
    }
    
    static func getFirstDayOfWeekBasedOnToday() -> Int {
        
        let todayInYear = getDayOfYear()
        let todayInWeek = getDayOfWeekInCorrectFormat()
        
        if(todayInYear - todayInWeek + 1 <= 0){
            return 1
        } else {
            return todayInYear - todayInWeek + 1
        }
        
    }
    
    static func getLastDayOfWeekBasedOnToday() -> Int {
        
        let todayInYear = getDayOfYear()
        let todayInWeek = getDayOfWeekInCorrectFormat()
        var returnNumber = getDayOfYear()  // set to this starting point first
        
        // in case of year end coming during the week.
        if(todayInYear + 7 - todayInWeek >= 366){
            
            // Get the current year
            let year = Calendar.current.component(.year, from: Date())
            // Get the first day of next year
            if let firstOfNextYear = Calendar.current.date(from: DateComponents(year: year + 1, month: 1, day: 1)) {
                // Get the last day of the current year
                let lastOfYear = Calendar.current.date(byAdding: .day, value: -1, to: firstOfNextYear)
                let cal = Calendar.current
                let day = cal.ordinality(of: .day, in: .year, for: lastOfYear!)
                returnNumber = day!
            }
            
        } else {
            returnNumber = todayInYear + 7 - todayInWeek
        }
        
        return returnNumber
        
    }
    
    static func getDayOfWeekInCorrectFormat() -> Int {
        
        switch getDayOfWeek() {
        case 1:
            return 7
        case 2:
            return 1
        case 3:
            return 2
        case 4:
            return 3
        case 5:
            return 4
        case 6:
            return 5
        case 7:
            return 6
        default:
            // TODO later
            print("This should not happen..TODO Case")
        }
        
        return Date().dayNumberOfWeek()!
    }
    
    static func loadSettingsFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: Settings.settingsKey) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let settings = try decoder.decode(SettingsData.self, from: data)
                //Statistics.shared.setStatistics(newStatisticsArray: statistics)
                Settings.shared.setSettingsData(newSettings: settings)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        if(Settings.shared.getSettingsData().goldenSentences.count == 0){
            Settings.shared.addDefaultGoldenSentences()
        }
        
    }
    
    static func storeSettingsToUserDefaults(){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(Settings.shared.getSettingsData())

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: Settings.settingsKey)

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    static func getRandomGoldenSentence() -> String?{
        let goldenSentenceCount = Settings.shared.getSettingsData().goldenSentences.count
        if(goldenSentenceCount > 0) {
            let number = Int.random(in: 0 ..< goldenSentenceCount)
            return Settings.shared.getSettingsData().goldenSentences[number]
        } else {
            return nil
        }
        
    }
    
    static func getRandomAgeRelatedMessage() -> String{
        let age = Settings.shared.getSettingsData().age
        var selectedMessage = ""
        
        if(age > 19 && age < 30){
            let sizeOfList = defaultAge20RelatedSentences.count
            let number = Int.random(in: 0 ..< sizeOfList)
            selectedMessage = defaultAge20RelatedSentences[number]
        } else if (age > 29 && age < 40){
            let sizeOfList = defaultAge30RelatedSentences.count
            let number = Int.random(in: 0 ..< sizeOfList)
            selectedMessage = defaultAge30RelatedSentences[number]
        } else if (age > 39 && age < 50){
            let sizeOfList = defaultAge40RelatedSentences.count
            let number = Int.random(in: 0 ..< sizeOfList)
            selectedMessage = defaultAge40RelatedSentences[number]
        } else if (age > 49 && age < 60){
            let sizeOfList = defaultAge50RelatedSentences.count
            let number = Int.random(in: 0 ..< sizeOfList)
            selectedMessage = defaultAge50RelatedSentences[number]
        } else if (age > 60){
            let sizeOfList = defaultAge60RelatedSentences.count
            let number = Int.random(in: 0 ..< sizeOfList)
            selectedMessage = defaultAge60RelatedSentences[number]
        }
        
        return selectedMessage
    }
    
    static func storeDayAboutLastDisplayedAgeRelatedMessageToUserDefaults(){
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm"
        let str = df.string(from: Date())
        UserDefaults.standard.setValue(str, forKey: lastDisplayedAgeRelatedMessageKey)

    }
    
    static func loadDayAboutLastDisplayedAgeRelatedMessageToUserDefaults() -> Date{
        
        if let strOut = UserDefaults.standard.string(forKey: lastDisplayedAgeRelatedMessageKey) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            return dateFormatter.date(from: strOut)!
            
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            return dateFormatter.date(from: "2015-04-01T11:42:00")!
        }

    }
    
    static func checkIfAgeRelatedMessageDisplayIsNeeded() ->Bool{
        if(loadDayAboutLastDisplayedAgeRelatedMessageToUserDefaults().addingTimeInterval(604800) < Date()){
            return true
        } else {
            return false
        }
    }
    
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
