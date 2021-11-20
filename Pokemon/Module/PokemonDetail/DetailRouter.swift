// 
//  DetailRouter.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import UIKit

class DetailRouter {
    
    func showView() -> DetailView {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(interactor: interactor)
        
        let storyboardId = String(describing: DetailView.self)
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: storyboardId) as? DetailView else {
            fatalError("Error loading Storyboard")
        }
        view.presenter = presenter
        return view
    }
}
