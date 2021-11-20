// 
//  HomeInteractor.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import Foundation
import RxAlamofire
import RxSwift

class HomeInteractor {

    var bag = DisposeBag()
    
    func inquiryPokemonList() -> PublishSubject<PokemonEntity> {
        let subject = PublishSubject<PokemonEntity>()
        RxAlamofire.requestJSON(.get, Endpoint.inquiryPokemon.value)
            .debug()
            .subscribe(onNext: { (r, json) in
                if let data = json as? [String: AnyObject] {
                    guard let count = data["count"] as? Int,
                          let next = data["next"] as? String,
                          let results = data["results"] as? [AnyObject] else {return}
                    var list: [PokemonListData] = []
                    for pokemon in results {
                        list.append(PokemonListData.init(url: pokemon["url"] as? String, name: pokemon["name"] as? String, image: "", baseExperience: 0, height: 0, weight: 0, order: 0))
                    }
                    subject.onNext(PokemonEntity.init(count: count, next: next, previous: false, results: list))

//                i dont know why it does not map itself to PokemonEntity as usual
//                if let data = json as? PokemonEntity {
//                    subject.onNext(data)
//                }
                }
            }, onError: { error in
                subject.onError(error)
            })
            .disposed(by: bag)
        return subject
    }

    func inquiryPokemonDetail(url: String) -> PublishSubject<PokemonListData> {
        let subject = PublishSubject<PokemonListData>()
        RxAlamofire.requestJSON(.get, url)
            .debug()
            .subscribe(onNext: { (r, json) in
                if let data = json as? [String: AnyObject] {
                    guard let sprites = data["sprites"] as? AnyObject,
                          let image = sprites["front_default"] as? String,
                          let baseExperience = data["base_experience"] as? Int,
                          let height = data["height"] as? Int,
                          let weight = data["weight"] as? Int,
                          let order = data["order"] as? Int,
                          let id = data["id"] as? Int else {
                        return
                    }
//                          let next = data["next"] as? String,
//                          let results = data["results"] as? [AnyObject] else {return}
//                    var list: [PokemonListData] = []
//                    for pokemon in results {
//                        list.append(PokemonListData.init(url: pokemon["url"] as? String, name: pokemon["name"] as? String, image: "", baseExperience: 0, height: 0, weight: 0, order: 0, id: 0))
//                    }
                    subject.onNext(PokemonListData.init(url: "", name: "", image: image, baseExperience: baseExperience, height: height, weight: weight, order: order, id: id))

//                i dont know why it does not map itself to PokemonEntity as usual
//                if let data = json as? PokemonEntity {
//                    subject.onNext(data)
//                }
                }
            }, onError: { error in
                subject.onError(error)
            })
            .disposed(by: bag)
        return subject
    }
}


