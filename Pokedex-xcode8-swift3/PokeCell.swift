//
//  PokeCell.swift
//  Pokedex-xcode8-swift3
//
//  Created by Mark Booster on 24-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    
    required init?(coder aDecoder: NSCoder ) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }

    
    func configureCell(pokemon: Pokemon) {
        thumbImage.image = UIImage(named: "\(pokemon.pokedexID)")
        pokeName.text = pokemon.name.capitalized
    }
    
}
