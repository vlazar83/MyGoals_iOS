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
        
    }
    
    fileprivate let items = [
        OnboardingItemInfo(informationImage: Asset.hotels.image,
                           title: "Hotels",
                           description: "All hotels and hostels are sorted by hospitality rating",
                           pageIcon: Asset.key.image,
                           color: UIColor(red: 0.40, green: 0.56, blue: 0.71, alpha: 1.00),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: Asset.banks.image,
                           title: "Banks",
                           description: "We carefully verify all banks before add them into the app",
                           pageIcon: Asset.wallet.image,
                           color: UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: Asset.stores.image,
                           title: "Stores",
                           description: "All local stores are categorized for your convenience",
                           pageIcon: Asset.shoppingCart.image,
                           color: UIColor(red: 0.61, green: 0.56, blue: 0.74, alpha: 1.00),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        skipButton.isHidden = true
        
        checkIfOnBoardingHappenedBefore()
        
        if(!onBoardingHappenedAlready) {
            setupPaperOnboardingView()
            view.bringSubviewToFront(skipButton)
        }
        
    }
    
    private func checkIfOnBoardingHappenedBefore() {
        let preferences = UserDefaults.standard

        let onBoardingKey = "onBoarding"

        if preferences.object(forKey: onBoardingKey) == nil {
            onBoardingHappenedAlready = false
        } else {
            onBoardingHappenedAlready = preferences.bool(forKey: onBoardingKey)
        }
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
        skipButton.isHidden = index == 2 ? false : true
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
        return 3
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
