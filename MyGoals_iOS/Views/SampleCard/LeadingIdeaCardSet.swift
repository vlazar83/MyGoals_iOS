//
//  LeadingIdeaCardSet.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 29..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation
import UIKit

// it is named as set, but it will contain only 1 leading idea card!
class LeadingIdeaCardSet{

    static let shared = LeadingIdeaCardSet()
    static let leadingIdeaCardSetKey = "LEADING_IDEA_CARD_SET"

    private var cardModels : [SampleCardModel] = []
    //Initializer access level change now
    private init(){}

    func getCardModels() -> [SampleCardModel]{
        return cardModels
    }
    
    func setCardModels(NewCardModels: [SampleCardModel]) -> (){
        self.cardModels = NewCardModels
    }
    
    func addCardModel(card: SampleCardModel) -> (){
        cardModels.append(card)
    }
    
    func deleteCardModel(cardId: Int) -> (){
        var foundAtIndex = -1;
        for (index, element) in cardModels.enumerated() {
            
            if(cardId == element.cardId) {
                foundAtIndex = index;
                break;
            }
            
            
        }
        if(foundAtIndex != -1) {
            cardModels.remove(at: foundAtIndex)
        }
        
    }
    
    func dropAllCards() -> (){
        cardModels.removeAll()
    }

}
