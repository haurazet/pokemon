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
            let homeView = UINavigationController(rootViewController: HomeRouter().showView())
            UIApplication.shared.windows.first?.rootViewController = homeView
        }
    }
}
