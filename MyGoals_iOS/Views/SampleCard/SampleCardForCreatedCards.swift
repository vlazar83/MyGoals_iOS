//
//  SampleCardForCreatedCards.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 07. 15..
//  Copyright © 2020. admin. All rights reserved.
//

import Shuffle_iOS

class SampleCardForCreatedCards: SwipeCard {
    
    override var swipeDirections: [SwipeDirection] {
        return [.left, .right]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        footerHeight = 80
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func overlay(forDirection direction: SwipeDirection) -> UIView? {
        switch direction {
        case .left:
            return SampleCardOverlayForCreatedCards.left()
        case .up:
            return SampleCardOverlayForCreatedCards.up()
        case.right:
            return SampleCardOverlayForCreatedCards.right()
        default:
            return nil
        }
    }
    
    func configure(withModel model: SampleCardModel) {
        content = SampleCardContentView(withImage: model.image?.getImage())
        
        switch model.cardType {
        case .Red:
            footer = SampleCardFooterView(withTitle: "\(model.cardGoal)", subtitle: model.cardGoalDescription, withColor: UIColor.red)
        case .Blue:
            footer = SampleCardFooterView(withTitle: "\(model.cardGoal)", subtitle: model.cardGoalDescription, withColor: UIColor(red: 102.0/255.0, green: 134.0/255.0, blue: 214.0/255.0, alpha: 1.0))
        case .Green:
            footer = SampleCardFooterView(withTitle: "\(model.cardGoal)", subtitle: model.cardGoalDescription, withColor: UIColor.green)
        case .LightGreen:
            footer = SampleCardFooterView(withTitle: "\(model.cardGoal)", subtitle: model.cardGoalDescription, withColor: UIColor(red: 26.0/255.0, green: 188.0/255.0, blue: 156.0/255.0, alpha: 1.0))
        case .LeadingIdea: // this should not be the case ever. The planning card set does not contain the Leading Idea card. We need to have it here to avoid compiler error.
            footer = SampleCardFooterView(withTitle: "\(model.cardGoal)", subtitle: model.cardGoalDescription)
        }
        
        //footer = SampleCardFooterView(withTitle: "\(model.cardGoal)", subtitle: model.cardGoalDescription)
    }
}
