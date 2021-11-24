// 
//  MyPokemonView.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import UIKit

class MyPokemonView: UIViewController {
    
    var presenter: MyPokemonPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "My Pokemon"
    }

}

