//
//  RecipeTabView.swift
//  recipe list app
//
//  Created by Anupama Biswas on 17/01/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            RecipeFeaturedView()
                .tabItem{
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            RecipeListViews()
                .tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
