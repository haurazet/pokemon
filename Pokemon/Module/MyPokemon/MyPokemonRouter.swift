// 
//  MyPokemonRouter.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import UIKit

class MyPokemonRouter {
    
    func showView() -> MyPokemonView {
        let interactor = MyPokemonInteractor()
        let presenter = MyPokemonPresenter(interactor: interactor)
        
        let storyboardId = String(describing: MyPokemonView.self)
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: storyboardId) as? MyPokemonView else {
            fatalError("Error loading Storyboard")
        }
        view.presenter = presenter
        return view
    }

}
