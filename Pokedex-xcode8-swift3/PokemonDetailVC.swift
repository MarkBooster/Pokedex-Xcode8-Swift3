//
//  PokemonDetailVC.swift
//  Pokedex-xcode8-swift3
//
//  Created by Mark Booster on 30-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
        

    }
}
