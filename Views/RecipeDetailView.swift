//
//  RecipeDetailView.swift
//  recipe list app
//
//  Created by Anupama Biswas on 15/01/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe : Recipe
    var body: some View {
        
        ScrollView {
            VStack (alignment: .leading ){
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(10)
                VStack(alignment: .leading ) {
                    Text("   Ingredients:")
                        .font(.headline)
                        .padding(.bottom)
                    ForEach (recipe.ingredients, id: \.self ){ r in
                        Text("· " + r)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading ){
                    Text("Directions")
                        .font(.headline)
                        .padding()
                    ForEach (0..<recipe.directions.count, id:\.self ){ index in
                        Text(String(index+1 ) + ". " + recipe.directions[index])
                            .padding(2)
                    }
                }
            }
        
        }
        .navigationBarTitle(recipe.name)
        .padding([.leading, .bottom, .trailing])
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
