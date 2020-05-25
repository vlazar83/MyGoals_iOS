import UIKit

class SampleCardModel {
    
    static var cardsCount = 0
    
    enum cardTypes {
        case Blue
        case Red
        case Green
        case LightGreen
    }
    
    let cardGoal: String
    let cardGoalDescription: String
    let image: UIImage?
    let cardId: Int
    let cardType: cardTypes    // Blue / Red / Green / LightGreen
    
    internal init(cardGoal: String, cardGoalDescription: String, image: UIImage?, cardType: cardTypes) {
        
        SampleCardModel.cardsCount += 1
        
        self.cardGoal = cardGoal
        self.cardGoalDescription = cardGoalDescription
        self.image = image
        self.cardId = SampleCardModel.cardsCount
        self.cardType = cardType
        
    }
    
}
