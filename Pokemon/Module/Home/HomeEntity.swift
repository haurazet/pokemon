// 
//  HomeEntity.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import Foundation

//struct HomeEntity {
//
//}

struct PokemonEntity: Codable {
    let count: Int
    let next: String
    let previous: Bool
    let results: [PokemonListData]?

    private enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "result"
    }
}

struct PokemonListData: Codable {
    var url, name, image: String?
    var baseExperience, height, weight, order, id : Int?

//    init(url: String?, name: String?, image: String?, baseExperience: Int?, height: Int?,
//         weight: Int?, order: Int?) {
//        var url = url
//        var name = name
//        var image = image
//        var baseExperience = baseExperience
//        var height = height
//        var weight = weight
//        var order = order
//    }

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case image
        case baseExperience
        case height
        case weight
        case order
    }
}

enum Endpoint {
    case inquiryPokemon
//    case inquiryPokemonDetail

    var value: String {
        let baseURL = "https://pokeapi.co/api/v2/"
        switch self {
        case .inquiryPokemon:
            return baseURL+"pokemon/"

        }
    }
}
