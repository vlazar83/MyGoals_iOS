//
//  CreatedCardSet.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 25..
//  Copyright © 2020. admin. All rights reserved.
//

import Foundation
import UIKit

class CreatedCardSet{

    static let shared = CreatedCardSet()

    private let cardModels : [SampleCardModel] = []
    //Initializer access level change now
    private init(){}

    func getCardModels() -> [SampleCardModel]{
        return cardModels
    }

}
