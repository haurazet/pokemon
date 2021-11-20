// 
//  HomePresenter.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import Foundation

class HomePresenter {
    
    private let interactor: HomeInteractor
    private let router = HomeRouter()
    
    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }
    
}
