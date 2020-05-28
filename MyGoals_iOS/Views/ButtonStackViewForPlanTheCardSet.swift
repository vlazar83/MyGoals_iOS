//
//  ButtonStackViewForPlanTheCardSet.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 28..
//  Copyright © 2020. admin. All rights reserved.
//
import PopBounceButton

protocol ButtonStackViewDelegateForPlanTheCardSet: class {
    func didTapButton(button: TinderButton)
}

class ButtonStackViewForPlanTheCardSet: UIStackView {
    
    weak var delegate: ButtonStackViewDelegateForPlanTheCardSet?
    
    private let undoButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "undo"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    private let passButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "pass"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    private let deleteButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "deleteBin"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 3
        return button
    }()
    
    private let likeButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 4
        return button
    }()
    
    private let takeTheseChosenCardsButton: TinderButton = {
        let button = TinderButton()
        button.setImage(UIImage(named: "lightning"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .equalSpacing
        alignment = .center
        configureButtons()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButtons() {
        let largeMultiplier: CGFloat = 66/414 //based on width of iPhone 8+
        let smallMultiplier: CGFloat = 54/414 //based on width of iPhone 8+
        //addArrangedSubview(from: undoButton, diameterMultiplier: smallMultiplier)
        addArrangedSubview(from: passButton, diameterMultiplier: largeMultiplier)
        addArrangedSubview(from: takeTheseChosenCardsButton, diameterMultiplier: smallMultiplier)
        //addArrangedSubview(from: deleteButton, diameterMultiplier: smallMultiplier)
        //addArrangedSubview(from: takephotoButton, diameterMultiplier: smallMultiplier)
        addArrangedSubview(from: likeButton, diameterMultiplier: largeMultiplier)

    }
    
    private func addArrangedSubview(from button: TinderButton, diameterMultiplier: CGFloat) {
        let container = ButtonContainer()
        container.addSubview(button)
        button.anchorToSuperview()
        addArrangedSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: diameterMultiplier).isActive = true
        container.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
    }
    
    @objc private func handleTap(_ button: TinderButton) {
        delegate?.didTapButton(button: button)
    }
}

private class ButtonContainer: UIView {
    
    override func draw(_ rect: CGRect) {
        applyShadow(radius: 0.2 * bounds.width, opacity: 0.05, offset: CGSize(width: 0, height: 0.15 * bounds.width))
    }
}
