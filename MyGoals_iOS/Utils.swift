//
//  Utils.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 26..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation

class Utils {
    
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
    
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
