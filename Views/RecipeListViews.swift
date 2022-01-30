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
            
            VStack (alignment: .leading ){
                Text("All Recipes")
                    .bold()
                    .padding(.top)
                    .font(.title )
                 
                ScrollView {
                    LazyVStack (alignment: .leading){
                        ForEach (model.recipes) { r in
                                
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
                                                .foregroundColor(.black)
                                                .font(.headline)
                                            }
                                    }
                                    )
                            }
                                            }
                }
                
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListViews()
            .environmentObject(RecipeModel() )
    }
}
