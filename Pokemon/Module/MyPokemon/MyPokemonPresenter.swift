// 
//  MyPokemonPresenter.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import Foundation

class MyPokemonPresenter {
    
    private let interactor: MyPokemonInteractor
    private let router = MyPokemonRouter()
    
    init(interactor: MyPokemonInteractor) {
        self.interactor = interactor
    }
    
}
