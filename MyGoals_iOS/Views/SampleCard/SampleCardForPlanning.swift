//
//  SampleCardForPlanning.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 07. 15..
//  Copyright © 2020. admin. All rights reserved.
//

import Shuffle_iOS

class SampleCardForPlanning: SwipeCard {
    
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
            return SampleCardOverlayForPlanning.left()
        case .up:
            return SampleCardOverlayForPlanning.up()
        case.right:
            return SampleCardOverlayForPlanning.right()
        default:
            return nil
        }
    }
    
    func configure(withModel model: SampleCardModel) {
        content = SampleCardContentView(withImage: model.image?.getImage())
        footer = SampleCardFooterView(withTitle: "\(model.cardGoal)", subtitle: model.cardGoalDescription)
    }
}
