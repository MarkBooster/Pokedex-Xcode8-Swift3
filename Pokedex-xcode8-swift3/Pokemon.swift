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
    private var _description: String!
    private var _type: String!
    private var _height: String!
    private var _defense: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolution: String!
    private var _pokemonURL: String!
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        
        return _type
        
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        
        return _height
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        
        return _defense
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        
        return _attack
    }
    
    var nextEvolution: String {
        if _nextEvolution == nil {
            _nextEvolution = ""
        }
        
        return _nextEvolution
    }
    
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
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexID)/"
    }
    
    func downloadPokemonDetail(completed: DownloadComplete) {
        let url = URL(string: _pokemonURL)
        if url != nil {
            let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if let responseData = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments)
                        
                        if let dict = json as? Dictionary<String, AnyObject> {
                            
                            if let weight = dict["weight"] as? String {
                                self._weight = weight
                                
                            }
                            
                            if let height = dict["height"] as? String {
                                self._height = height
                                
                            }
                            
                            if let attack = dict["attack"] as? Int {
                                self._attack = "\(attack)"
                                
                            }
                            
                            if let defense = dict["defense"] as? Int {
                                self._defense = "\(defense)"
                            
                            }
                            
                            print(self._weight)
                            print(self._height)
                            print(self._attack)
                            print(self._defense)
                            
                            if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0 {
                                
                                if let name = types[0]["name"] {
                                    self._type = name.capitalized
                                }
                                
                                if types.count > 1 {
                                    
                                    for x in 1..<types.count {
                                        
                                        if let name = types[x]["name"] {
                                            
                                            self._type! += "/\(name.capitalized)"
 
                                        }
                                    }
                                }
                                
                                print(self._type)
                                
                            } else {
                                self._type = ""
                            }
                            
                            if let descArr = dict["descriptions"] as? [Dictionary<String, String>] , descArr.count > 0 {
                                
                                if let uri = descArr[0]["resource_uri"] {
                                    
                                    
                                    let descUrl = URL(string: "\(URL_BASE)\(uri)")
                                    print(uri)
                                    if descUrl != nil {
                                        let descTask = URLSession.shared.dataTask(with: descUrl!, completionHandler: { (data, response, error) in
                                            if let responseDescData = data {
                                                do {
                                                    let descJson = try JSONSerialization.jsonObject(with: responseDescData, options: JSONSerialization.ReadingOptions.allowFragments)
                                                    
                                                    if let descDict = descJson as? Dictionary<String, AnyObject> {
                                                        if let description = descDict["description"] as? String {
                                                            let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokémon")
                                                            self._description = newDescription
                                                            
                                                        }
                                                    }
                                                    
                                                    
                                                    
                                                } catch let err as NSError {
                                                    print(err.debugDescription)
                                                }
                                            }
                                            completed()

                                        })

                                        descTask.resume()
                                    }
                                }
                                
                            }
                        }
                        
                    } catch let err as NSError {
                        print(err.debugDescription)
                    }
                }
                completed()
            })
            task.resume()
            
        }
    }
    
}
