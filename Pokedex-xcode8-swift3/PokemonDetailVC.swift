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
        
        let img = UIImage(named: "\(pokemon.pokedexID)")
        pokeImg.image = img
        currentPokeImg.image = img
        pokedexIDLbl.text = "\(pokemon.pokedexID)"
        
        
        pokemon.downloadPokemonDetail {
            self.updateUI()
        }
        
        nameLbl.text = pokemon.name.capitalized
    }
    
    //MARK: Functions
    
    func updateUI() {
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        typeLbl.text = pokemon.type
        
        
    }
    
    //MARK: IBActions

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
