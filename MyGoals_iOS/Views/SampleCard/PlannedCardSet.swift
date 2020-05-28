//
//  PlannedCardSet.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 28..
//  Copyright © 2020. admin. All rights reserved.
//
// This is the card set with we can work during the week.
// We collect these cards in the PlanTheCardSetViewController
// And we present all these cards on the ViewControllerHomePage to work with it during the week.


import Foundation
import UIKit

class PlannedCardSet{

    static let shared = PlannedCardSet()
    static let plannedCardSetKey = "PLANNED_CARD_SET"

    var locationGranted: Bool?
    private var cardModels: [SampleCardModel] = []
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

    func emptySet() -> (){
        cardModels.removeAll()
    }
    
}
