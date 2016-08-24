//
//  Pokemon.swift
//  Pokedex-xcode8-swift3
//
//  Created by Mark Booster on 24-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
    }
    
}
