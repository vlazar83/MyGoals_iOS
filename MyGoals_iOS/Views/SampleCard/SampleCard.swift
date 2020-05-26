import Shuffle_iOS

class SampleCard: SwipeCard {
    
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
            return SampleCardOverlay.left()
        case .up:
            return SampleCardOverlay.up()
        case.right:
            return SampleCardOverlay.right()
        default:
            return nil
        }
    }
    
    func configure(withModel model: SampleCardModel) {
        content = SampleCardContentView(withImage: model.image?.getImage())
        footer = SampleCardFooterView(withTitle: "\(model.cardGoal)", subtitle: model.cardGoalDescription)
    }
}
