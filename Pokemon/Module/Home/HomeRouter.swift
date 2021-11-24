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

        let storyboard = UIStoryboard(
            name: String(describing: HomeView.self),
            bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: String(describing: HomeView.self)) as? HomeView else {
            fatalError("Error loading Storyboard")
        }
        
        view.presenter = presenter

        return view
    }

    func navigateToDetail(from navigation: UINavigationController, data: PokemonListData) {
        let detailVC = DetailRouter().showView(data: data)
        navigation.pushViewController(detailVC, animated: true)
    }

    func navigateToMyPokemon(from navigation: UINavigationController) {
        let myPokemonVC = MyPokemonRouter().showView()
        navigation.pushViewController(myPokemonVC, animated: true)
    }
}
