// 
//  HomeRouter.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import UIKit

class HomeRouter {
    
    func showView() -> HomeView {
        print("masuk showview")
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
}
