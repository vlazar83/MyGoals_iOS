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
        SampleCardModel(cardGoal: "Self-Time",
                        cardGoalDescription: "reading a book",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/greenCard_introvert_1")!),
                        cardType: SampleCardModel.cardTypes.LightGreen),
        SampleCardModel(cardGoal: "Self-Time",
                        cardGoalDescription: "board game night with the family",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/greenCard_extrovert_1")!),
                        cardType: SampleCardModel.cardTypes.Green),
        SampleCardModel(cardGoal: "Self-Time",
                        cardGoalDescription: "pray",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/greenCard_introvert_2")!),
                        cardType: SampleCardModel.cardTypes.LightGreen),
        SampleCardModel(cardGoal: "Self-Time",
                        cardGoalDescription: "football with friends",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/greenCard_extrovert_2")!),
                        cardType: SampleCardModel.cardTypes.Green),
        SampleCardModel(cardGoal: "Self-Time",
                        cardGoalDescription: "other activities for yourself",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/greenCard_generic")!),
                        cardType: SampleCardModel.cardTypes.Green),
        SampleCardModel(cardGoal: "Family",
                        cardGoalDescription: "visit your family",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/blueCard_1")!),
                        cardType: SampleCardModel.cardTypes.Blue),
        SampleCardModel(cardGoal: "Family",
                        cardGoalDescription: "family trip in the woods",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/blueCard_2")!),
                        cardType: SampleCardModel.cardTypes.Blue),
        SampleCardModel(cardGoal: "Family",
                        cardGoalDescription: "other activities with your loved ones",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/blueCard_generic")!),
                        cardType: SampleCardModel.cardTypes.Blue),
        SampleCardModel(cardGoal: "Work",
                        cardGoalDescription: "worships on Sundays",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/redCard_1")!),
                        cardType: SampleCardModel.cardTypes.Red),
        SampleCardModel(cardGoal: "Work",
                        cardGoalDescription: "teaching about God's love",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/redCard_2")!),
                        cardType: SampleCardModel.cardTypes.Red),
        SampleCardModel(cardGoal: "Work",
                        cardGoalDescription: "preparations...",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/redCard_3")!),
                        cardType: SampleCardModel.cardTypes.Red),
        SampleCardModel(cardGoal: "Work",
                        cardGoalDescription: "other work related activities",
                        image: SampleCardModel.Image(withImage: UIImage(named: "default_graphics/redCard_generic")!),
                        cardType: SampleCardModel.cardTypes.Red)
    ]
    //Initializer access level change now
    private init(){}

    func getCardModels() -> [SampleCardModel]{
        return cardModels
    }

}
