//
//  PokemonDetailVC.swift
//  Pokedex-xcode8-swift3
//
//  Created by Mark Booster on 30-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var pokeImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var nextEvolutionLbl: UILabel!
    @IBOutlet weak var currentPokeImg: UIImageView!
    @IBOutlet weak var evolutionImg: UIImageView!
    
    //MARK: Properties
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
    }
    
    //MARK: Functions
    
    //MARK: IBActions

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
