//
//  ContentView.swift
//  recipe list app
//
//  Created by Anupama Biswas on 15/01/22.
//

import SwiftUI

struct RecipeListViews: View {
    
    //@ObservedObject var model = RecipeModel()
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            
            List (model.recipes) { r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
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
                    )
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListViews()
    }
}
