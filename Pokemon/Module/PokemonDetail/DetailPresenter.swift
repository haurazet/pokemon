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
    
    init(interactor: DetailInteractor) {
        self.interactor = interactor
    }
    
}
