//
//  DataService.swift
//  recipe list app
//
//  Created by Anupama Biswas on 15/01/22.
//

import Foundation

class DataService {
    
    
    static func getLocalData () -> [Recipe] {

        // Parse local json file
        //get a url path to json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check pathString is not nil, otherwise ...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a json decoder
            
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
//                print(recipeData.count)
                // Add the unique IDs
                for r in recipeData{
                    r.id = UUID()
                    
                    for i in r.ingredients{
                        i.id = UUID()
                    }
                }
//                print(recipeData.count)
                return recipeData
            }
            catch{
                // error with parsing json
                print(error)
            }
        }catch{
            // error with getting data
            print(error)
        }
        // Return the rec ipes
        return [Recipe]()
    }
    
}



