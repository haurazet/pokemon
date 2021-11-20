// 
//  HomeRouter.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import UIKit

class HomeRouter {
    
    func showView() -> HomeView {
        let interactor = HomeInteractor()
        let presenter = HomePresenter(interactor: interactor)
        
        let storyboardId = String(describing: HomeView.self)
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: storyboardId) as? HomeView else {
            fatalError("Error loading Storyboard")
        }
        view.presenter = presenter
        return view
    }
    
    //Navigate to other xib-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
    */
    
    //Navigate to other storyboard-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
     */
    
}
