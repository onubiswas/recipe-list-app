//
//  ContentView.swift
//  recipe list app
//
//  Created by Anupama Biswas on 15/01/22.
//

import SwiftUI

struct RecipeListViews: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        List (model.recipes) { r in
            HStack {
                Image(r.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 60)
                    .clipped()
                    .cornerRadius(8)
                     
                        
                    Text(r.name)
                    .font(.headline)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListViews()
    }
}
