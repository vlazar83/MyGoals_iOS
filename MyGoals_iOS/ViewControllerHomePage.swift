//
//  ViewControllerHomePage.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 04. 20..
//  Copyright © 2020. admin. All rights reserved.
//
import Shuffle_iOS
import UIKit
import PopBounceButton

protocol RefreshCardsDelegateProtocol {
  func refreshCards()
}

class ViewControllerHomePage: UIViewController, RefreshCardsDelegateProtocol {

    private let cardStack = SwipeCardStack()
    
    private let buttonStackView = ButtonStackView()
        
    private var cardModels = PlannedCardSet.shared.getCardModels()
    
    private var wasCalledFromButton: Bool = false
    
    func refreshCards() {
      // do something
        PlannedCardSet.shared.setCardModels(NewCardModels: Utils.loadCardsFromUserDefaults(key: LeadingIdeaCardSet.leadingIdeaCardSetKey) + Utils.loadCardsFromUserDefaults(key: PlannedCardSet.plannedCardSetKey))
        cardModels = PlannedCardSet.shared.getCardModels()
        
        cardStack.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardModels = Utils.loadCardsFromUserDefaults(key: LeadingIdeaCardSet.leadingIdeaCardSetKey) + Utils.loadCardsFromUserDefaults(key: PlannedCardSet.plannedCardSetKey)
        cardStack.delegate = self
        cardStack.dataSource = self
        buttonStackView.delegate = self
        
        //configureNavigationBar()
        layoutButtonStackView()
        layoutCardStackView()
        configureBackgroundGradient()
        Utils.loadCreatedCardsFromUserDefaults()
        setupStatistics()
        
        Utils.loadSettingsFromUserDefaults()
        scheduleNotification()
        
        startToastIfInFamily()
        
    }
    
    func startToastIfInFamily(){
        
        if(Settings.shared.getSettingsData().inFamily && Utils.getBlueCardsCountFromWeek() < 1 && Utils.getDayOfWeek() > 4){
            
            let number = Int.random(in: 0 ..< 2)
            if(number == 0){
                self.view.makeToast(NSLocalizedString("Did you calculate in your planning with your family too?", comment: ""),duration:5.0, position: .bottom)
            } else {
                self.view.makeToast(NSLocalizedString("What activities did you favour, if not your family?", comment: ""),duration:5.0, position: .bottom)
            }

        }
    }
    
    func scheduleNotification(){
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        // Define the custom actions.
        let acceptAction = UNNotificationAction(identifier: "CLOSE_ACTION",
              title: NSLocalizedString("Close", comment: ""),
              options: UNNotificationActionOptions(rawValue: 0))

        // Define the notification type
        let meetingInviteCategory =
              UNNotificationCategory(identifier: "GOLDEN_SENTENCE_NOTIFICATION",
              actions: [acceptAction],
              intentIdentifiers: [],
              hiddenPreviewsBodyPlaceholder: "",
              options: .customDismissAction)
        // Register the notification type.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.setNotificationCategories([meetingInviteCategory])
        
        let content = UNMutableNotificationContent()
        content.title = NSLocalizedString("Golden Sentence", comment: "")
        content.body = Utils.getRandomGoldenSentence() ?? Settings.emptyGoldenSentences
        content.userInfo = ["SAMPLE_DATA_1" : "111", "SAMPLE_DATA_2" : "222" ]
        content.categoryIdentifier = "GOLDEN_SENTENCE_NOTIFICATION"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: content, trigger: trigger)

        // Schedule the request with the system.
        notificationCenter.add(request) { (error) in
           if error != nil {
              // Handle any errors.
           }
        }
        
        
    }
    
    func setStatusBar() {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        
        if(statusBarView.tintColor == UIColor.black){
            statusBarView.backgroundColor = UIColor.white
        } else if(statusBarView.tintColor == UIColor.white){
            statusBarView.backgroundColor = UIColor.black
        } else {
            statusBarView.backgroundColor = UIColor.darkGray
        }
        
        
        view.addSubview(statusBarView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setStatusBar()
    }
    
    private func setupStatistics(){
        
        let yearOfSavedStatistics = Utils.loadStatisticsYearFromUserDefaults()
        
        // meaning no previous run happened
        if(yearOfSavedStatistics == 0){
            // start new statistics
            Statistics.shared.resetValues()
        } else if(yearOfSavedStatistics != Calendar.current.component(.year, from: Date())){
            // start new statistics for a new year
            Statistics.shared.resetValues()
        } else {
            // reload statistics, we are still in the current year
            Utils.loadStatisticsFromUserDefaults()
        }
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
extension ViewControllerHomePage: ButtonStackViewDelegate, SwipeCardStackDataSource, SwipeCardStackDelegate {
    
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
        if(direction == .right && !wasCalledFromButton){
            addToStatistics()
        }
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        print("Card tapped")
    }
    
    func didTapButton(button: TinderButton) {
        switch button.tag {
        case 1:
            PlannedCardSet.shared.setCardModels(NewCardModels: Utils.loadCardsFromUserDefaults(key: LeadingIdeaCardSet.leadingIdeaCardSetKey) + Utils.loadCardsFromUserDefaults(key: PlannedCardSet.plannedCardSetKey))
            cardModels = PlannedCardSet.shared.getCardModels()
            
            cardStack.reloadData()
        case 2:
            cardStack.swipe(.left, animated: true)
        case 3:
            cardStack.swipe(.up, animated: true)
        case 4:
            //cardStack.swipe(.right, animated: true)
            // only swipe in case thera are any cards on top
            if(cardStack.topCard != nil){
                wasCalledFromButton = true
                addToStatistics()
            }

            
        default:
            break
        }
    }
    
    func addToStatistics(){
        switch cardModels[cardStack.topCardIndex].cardType {
            case SampleCardModel.cardTypes.Blue:
                Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).blueCardCount+=1
            case SampleCardModel.cardTypes.Red:
                Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).redCardCount+=1
            case SampleCardModel.cardTypes.Green:
                Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).greenCardCount+=1
            case SampleCardModel.cardTypes.LightGreen:
                Statistics.shared.getStatisticsForDay(day: Utils.getDayOfYear()).lightGreenCardCount+=1
            case SampleCardModel.cardTypes.LeadingIdea:
                // do nothing
                print("Leading Idea card does not calculated into Statistics!")
            }
        Utils.storeStatisticsToUserDefaults()
        Utils.storeStatisticsYearToUserDefaults()
        cardStack.swipe(.right, animated: true)
        wasCalledFromButton = false
    }
    
}
