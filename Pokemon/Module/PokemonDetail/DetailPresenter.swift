// 
//  DetailPresenter.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import Foundation

class DetailPresenter {
    
    private let interactor: DetailInteractor
    private let router = DetailRouter()
    let pokemonData: PokemonListData
    
    init(interactor: DetailInteractor, data: PokemonListData) {
        self.interactor = interactor
        self.pokemonData = data
    }
    
}
