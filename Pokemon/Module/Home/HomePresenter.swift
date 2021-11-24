// 
//  HomePresenter.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import Foundation
import RxSwift

class HomePresenter {
    
    private let interactor: HomeInteractor
    private let router = HomeRouter()
    
    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }

    // MARK: - Inquiry

    func inquiryPokemonList() -> PublishSubject<PokemonEntity> {
        return interactor.inquiryPokemonList()
    }

    func inquiryPokemonDetail(url: String) -> PublishSubject<PokemonListData> {
        return interactor.inquiryPokemonDetail(url: url)
    }

    // MARK: - Navigation
    func navigateToDetail(from navigation: UINavigationController, data: PokemonListData) {
        router.navigateToDetail(from: navigation, data: data)
    }

    func navigateToMyPokemon(from navigation: UINavigationController) {
        router.navigateToMyPokemon(from: navigation)
    }
}
