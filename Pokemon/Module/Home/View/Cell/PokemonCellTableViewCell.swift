//
//  PokemonCellTableViewCell.swift
//  Pokemon
//
//  Created by Haura Zahro on 20/11/21.
//

import UIKit

class PokemonCellTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    static let identifier = String(describing: PokemonCellTableViewCell.self)
    static let nib = UINib(
        nibName: identifier,
        bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
