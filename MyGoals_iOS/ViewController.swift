//
//  ViewController.swift
//  MyGoals_iOS
//
//  Created by admin on 2020. 04. 17..
//  Copyright © 2020. admin. All rights reserved.
//

import UIKit
import paper_onboarding

class ViewController: UIViewController {
    
    @IBOutlet weak var skipButton: UIButton!
    
    var onBoardingHappenedAlready = false
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        print("OnBoarding finished, we won't show it again. Have fun using this app.")
        onBoardingHappenedAlready = true
        storeOnBoardingState()
        goToHomePage()
        
    }
    
    fileprivate let items = [
        OnboardingItemInfo(informationImage: Asset.church.image,
                           title: NSLocalizedString("App's Goal", comment: ""),
                           description: NSLocalizedString("To help us capture Kronos in Kairos", comment: ""),
                           pageIcon: Asset.cross.image,
                           color: UIColor(red: 0.40, green: 0.56, blue: 0.71, alpha: 1.00),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: Asset.growth.image,
                           title: NSLocalizedString("How it helps?", comment: ""),
                           description: NSLocalizedString("Make your own recepie", comment: ""),
                           pageIcon: Asset.shoppingCart.image,
                           color: UIColor(red: 0.61, green: 0.56, blue: 0.74, alpha: 1.00),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: Asset.bible.image,
                           title: NSLocalizedString("App\'s Method", comment: ""),
                           description: NSLocalizedString("\"waking up by reminding\" - (2Pt 1, 13)", comment: ""),
                           pageIcon: Asset.star.image,
                           color: UIColor(red: 0.85, green: 0.32, blue: 0.30, alpha: 1.00),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: Asset.dove.image,
                            title: NSLocalizedString("The Soul in work", comment: ""),
                            description: NSLocalizedString("The app helps us to capture the Soul in our life", comment: ""),
                            pageIcon: Asset.key.image,
                            color: UIColor(red: 0.16, green: 0.21, blue: 0.31, alpha: 1.00),
                            titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont)
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        skipButton.isHidden = true
        
        setupPaperOnboardingView()
        view.bringSubviewToFront(skipButton)
        
    }
    
    private func storeOnBoardingState() {
        let preferences = UserDefaults.standard

        let onBoardingKey = "onBoarding"

        preferences.set(onBoardingHappenedAlready, forKey: onBoardingKey)

        //  Save to disk
        let didSave = preferences.synchronize()

        if !didSave {
            //  Couldn't save (I've never seen this happen in real world testing)
        }
    }
    
    private func goToHomePage() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewControllerHomePage") as! ViewControllerHomePage
        
        // instead of card presentation style let's use full screen instead
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)

        // Add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }


}

// MARK: PaperOnboardingDelegate

extension ViewController: PaperOnboardingDelegate {

    func onboardingWillTransitonToIndex(_ index: Int) {
        skipButton.isHidden = index == 3 ? false : true
    }

    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
        // configure item
        
        //item.titleLabel?.backgroundColor = .redColor()
        //item.descriptionLabel?.backgroundColor = .redColor()
        //item.imageView = ...
    }
}

// MARK: PaperOnboardingDataSource

extension ViewController: PaperOnboardingDataSource {

    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return items[index]
    }

    func onboardingItemsCount() -> Int {
        return items.count
    }
    
    //    func onboardinPageItemRadius() -> CGFloat {
    //        return 2
    //    }
    //
    //    func onboardingPageItemSelectedRadius() -> CGFloat {
    //        return 10
    //    }
    //    func onboardingPageItemColor(at index: Int) -> UIColor {
    //        return [UIColor.white, UIColor.red, UIColor.green][index]
    //    }
}




//MARK: Constants
private extension ViewController {
    
    static let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
    static let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
}
