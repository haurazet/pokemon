// 
//  HomeView.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var topView: UIView!

    var bag = DisposeBag()
    var presenter: HomePresenter?
    var pokemons = PublishSubject<[PokemonListData]>()
    var pokemonData: PokemonEntity?
    var newResult: [PokemonListData] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        configure(tableView)
        inquiryPokemonList()
    }

    func setNavigationBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: self.topView.frame.height, width: view.frame.size.width, height: 44))
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "Pokemon Home")
        let doneItem = UIBarButtonItem(title: "List", style: .done, target: self, action: #selector(getList))
        navItem.rightBarButtonItem = doneItem
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()

        navBar.setItems([navItem], animated: false)
    }

    @objc func getList() {
        guard let presenter = presenter,
              let navigation = self.navigationController else {return}
        presenter.navigateToMyPokemon(from: navigation)
    }

    func configure(_ tableView: UITableView) {
        tableView.register(
            PokemonCellTableViewCell.nib,
            forCellReuseIdentifier: PokemonCellTableViewCell.identifier)

        pokemons.bind(
            to: tableView.rx.items(
                cellIdentifier: PokemonCellTableViewCell.identifier,
                cellType: PokemonCellTableViewCell.self)) { _, item, cell in
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            cell.selectionStyle = .none
            cell.nameLabel.text = item.name?.capitalized

            guard let url = URL(string: item.image ?? "") else {return}
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    cell.pokemonImage.image = UIImage(data: data!)
                }
            }
        } .disposed(by: bag)

        tableView.rx.setDelegate(self)
            .disposed(by: bag)
    }

    func inquiryPokemonList() {
        self.presenter?.inquiryPokemonList().asObserver().subscribe(onNext: { [weak self] data in
            guard let self = self,
                  let pokemonList = data.results else {return}
            self.pokemonData = data

            for pokemon in pokemonList {
                self.inquiryPokemonDetail(url: pokemon.url ?? "")
            }

            self.pokemons.onNext(pokemonList)
        }).disposed(by: self.bag)
    }

    func inquiryPokemonDetail(url: String) {
        self.presenter?.inquiryPokemonDetail(url: url).asObserver().subscribe(onNext: { [weak self] data in
            guard let self = self,
                  let result = self.pokemonData?.results,
                  let name = data.name else {return}

            for pokemon in result{
                if name.lowercased() == pokemon.name?.lowercased() {
                    self.newResult.append(PokemonListData.init(url: pokemon.url, name: pokemon.name, image: data.image, baseExperience: data.baseExperience, height: data.height, weight: data.weight, order: data.order))
                    self.pokemons.onNext(self.newResult)
                }
            }
        }).disposed(by: self.bag)
    }
}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = presenter,
              let navigation = self.navigationController else {return}
        presenter.navigateToDetail(from: navigation, data: self.newResult[indexPath.row])
    }
}
