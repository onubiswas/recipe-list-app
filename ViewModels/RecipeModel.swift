//
//  RecipeModel.swift
//  recipe list app
//
//  Created by Anupama Biswas on 15/01/22.
//


import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
         
        
    }
}



