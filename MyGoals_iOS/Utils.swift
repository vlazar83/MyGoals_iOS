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
    
    
    
}
