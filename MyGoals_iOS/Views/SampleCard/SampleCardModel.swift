import UIKit
import Foundation

class SampleCardModel :NSObject, Codable{
    
    static var cardsCount = 0
    
    enum cardTypes: String, Codable {
        case Blue
        case Red
        case Green
        case LightGreen
    }
    
    let cardGoal: String
    let cardGoalDescription: String
    let image: Image?
    let cardId: Int
    let cardType: cardTypes    // Blue / Red / Green / LightGreen
    
    internal init(cardGoal: String, cardGoalDescription: String, image: Image?, cardType: cardTypes) {
        
        SampleCardModel.cardsCount += 1
        
        self.cardGoal = cardGoal
        self.cardGoalDescription = cardGoalDescription
        self.image = image
        self.cardId = SampleCardModel.cardsCount
        self.cardType = cardType
        
    }
    
    struct Image: Codable{
        let imageData: Data?
        
        init(withImage image: UIImage) {
            self.imageData = image.jpegData(compressionQuality: 0.5)
        }

        func getImage() -> UIImage? {
            guard let imageData = self.imageData else {
                return nil
            }
            let image = UIImage(data: imageData)
            
            return image
        }
    }
    
}
