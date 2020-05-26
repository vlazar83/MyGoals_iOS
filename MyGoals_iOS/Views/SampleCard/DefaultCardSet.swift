//
//  DefaultCardSet.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 04. 23..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation
import UIKit

class DefaultCardSet{

    static let shared = DefaultCardSet()

    var locationGranted: Bool?
    private let cardModels = [
        SampleCardModel(cardGoal: "Michelle",
                        cardGoalDescription: "Graphic Designer",
                        image: SampleCardModel.Image(withImage: UIImage(named: "michelle")!),
                        cardType: SampleCardModel.cardTypes.Blue),
        SampleCardModel(cardGoal: "Daiane",
                        cardGoalDescription: "Graphic Designer",
                        image: SampleCardModel.Image(withImage: UIImage(named: "daiane")!),
                        cardType: SampleCardModel.cardTypes.Green),
        SampleCardModel(cardGoal: "Bailey",
                        cardGoalDescription: "Graphic Designer",
                        image: SampleCardModel.Image(withImage: UIImage(named: "bailey")!),
                        cardType: SampleCardModel.cardTypes.Red)
    ]
    //Initializer access level change now
    private init(){}

    func getCardModels() -> [SampleCardModel]{
        return cardModels
    }

}
