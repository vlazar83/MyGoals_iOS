import UIKit

class SampleCardModel {
    
    static var cardsCount = 0
    
    enum cardTypes {
        case Blue
        case Red
        case Green
    }
    
    let cardGoal: String
    let cardGoalDescription: String
    let image: UIImage?
    let cardId: Int
    let cardType: cardTypes    // Blue / Red / Green
    
    internal init(cardGoal: String, cardGoalDescription: String, image: UIImage?, cardType: cardTypes) {
        
        SampleCardModel.cardsCount += 1
        
        self.cardGoal = cardGoal
        self.cardGoalDescription = cardGoalDescription
        self.image = image
        self.cardId = SampleCardModel.cardsCount
        self.cardType = cardType
        
    }
    
}
