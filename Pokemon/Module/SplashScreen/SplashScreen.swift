//
//  SplashScreen.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import UIKit

class SplashScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
//            if !AppManager.getUserOnboarding() {
                UIApplication.shared.windows.first?.rootViewController = HomeRouter().showView()
//            } else {
//                UIApplication.shared.windows.first?.rootViewController = MainTabbarRouter().showView()
//            }
        }
//        animationView.contentMode = .scaleAspectFill
//        animationView.loopMode = .playOnce
//        animationView.animationSpeed = 1.3
//        animationView.play(completion: { _ in

//        })

    }
}
