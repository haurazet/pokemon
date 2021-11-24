// 
//  DetailView.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import UIKit

class DetailView: UIViewController {

    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonBaseExperienceLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!

    
    var presenter: DetailPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPokemon()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "Pokemon Detail"
    }

    func setupPokemon() {
        guard let presenter = presenter,
              let baseExperience = presenter.pokemonData.baseExperience,
              let url = presenter.pokemonData.url else {
            return
        }
        pokemonNameLabel.text = presenter.pokemonData.name
        pokemonBaseExperienceLabel.text = "Base Experience: \(baseExperience)"
        print("data url \(presenter.pokemonData.url ?? "")")
        guard let url = URL(string: url) else {return}
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                self.pokemonImage.image = UIImage(data: data!)
            }
        }
    }

}

