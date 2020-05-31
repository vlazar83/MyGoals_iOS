//
//  CreatedCardsViewController.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 05. 25..
//  Copyright © 2020. admin. All rights reserved.
//
import Shuffle_iOS
import UIKit
import PopBounceButton

protocol RefreshOwnCardsDelegateProtocol {
  func refreshOwnCards()
}

class CreatedCardsViewController: UIViewController, RefreshOwnCardsDelegateProtocol {

    func refreshOwnCards() {

        CreatedCardSet.shared.setCardModels(NewCardModels: Utils.loadCardsFromUserDefaults(key: CreatedCardSet.createdCardSetKey))
        cardModels = CreatedCardSet.shared.getCardModels()
        
        cardStack.reloadData()
    }
    
    private let cardStack = SwipeCardStack()
    
    private let buttonStackView = ButtonStackViewForCreatedCards()
        
    private var cardModels = CreatedCardSet.shared.getCardModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardStack.delegate = self
        cardStack.dataSource = self
        buttonStackView.delegate = self
        
        //configureNavigationBar()
        layoutButtonStackView()
        layoutCardStackView()
        configureBackgroundGradient()
        
    }

    private func configureNavigationBar() {
        let backButton = UIBarButtonItem(title: "Back",
                                         style: .plain,
                                         target: self,
                                         action: #selector(handleShift))
        backButton.tag = 1
        backButton.tintColor = .lightGray
        navigationItem.leftBarButtonItem = backButton
        
        let forwardButton = UIBarButtonItem(title: "Forward",
                                            style: .plain,
                                            target: self,
                                            action: #selector(handleShift))
        forwardButton.tag = 2
        forwardButton.tintColor = .lightGray
        navigationItem.rightBarButtonItem = forwardButton

        navigationController?.navigationBar.layer.zPosition = -1
    }
    
    private func configureBackgroundGradient() {
        let backgroundGray = UIColor(red: 244/255, green: 247/255, blue: 250/255, alpha: 1)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, backgroundGray.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func layoutButtonStackView() {
        view.addSubview(buttonStackView)
        buttonStackView.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 24, paddingBottom: 12, paddingRight: 24)
    }
    
    private func layoutCardStackView() {
        view.addSubview(cardStack)
        cardStack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.safeAreaLayoutGuide.leftAnchor,
                         bottom: buttonStackView.topAnchor,
                         right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 40)
    }
    
    @objc private func handleShift(_ sender: UIButton) {
        cardStack.shift(withDistance: sender.tag == 1 ? -1 : 1, animated: true)
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }

}

//MARK: Data Source + Delegates
extension CreatedCardsViewController: ButtonStackViewDelegateForCreatedCards, SwipeCardStackDataSource, SwipeCardStackDelegate {
    
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let card = SampleCard()
        card.configure(withModel: cardModels[index])
        return card
    }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return cardModels.count
    }
    
    func didSwipeAllCards(_ cardStack: SwipeCardStack) {
        print("Swiped all cards!")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didUndoCardAt index: Int, from direction: SwipeDirection) {
        print("Undo \(direction) swipe on \(cardModels[index].cardGoal)")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
        print("Swiped \(direction) on \(cardModels[index].cardGoal)")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        print("Card tapped")
    }
    
    func didTapButton(button: TinderButton) {
        switch button.tag {
        case 1:
            cardStack.reloadData()
        case 2:
            cardStack.swipe(.left, animated: true)
        case 3:
            if(cardModels.count > 0 && cardStack.topCard != nil) {
                CreatedCardSet.shared.deleteCardModel(cardId: cardModels[cardStack.topCardIndex].cardId)
                PlannedCardSet.shared.deleteCardModel(cardId: cardModels[cardStack.topCardIndex].cardId)
                Utils.storeCardsToUserDefaults(cardSet: PlannedCardSet.shared.getCardModels(), key: PlannedCardSet.plannedCardSetKey)
                cardStack.swipe(.up, animated: true)
                cardModels = CreatedCardSet.shared.getCardModels()
                cardStack.reloadData()
                Utils.storeCreatedCardsToUserDefaults()
            }
        case 4:
            cardStack.swipe(.right, animated: true)
        case 5:
            // new card creation starting here
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let finalizeNewCardViewController = storyBoard.instantiateViewController(withIdentifier: "finalizeNewCard") as! FinalizeNewCardViewController
            self.present(finalizeNewCardViewController, animated: true, completion: nil)
        default:
            break
        }
    }
}
