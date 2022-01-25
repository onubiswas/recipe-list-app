//
//  RecipeFeaturedView.swift
//  recipe list app
//
//  Created by Anupama Biswas on 20/01/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0 ) {
            
            Text("Featured Recipe:")
                .bold()
                .padding(.leading)
                .padding(.top)
                .font(.title )
            
            GeometryReader{ geo in
                TabView{
                    ForEach(0..<model.recipes.count){ index in
                        if model.recipes[index].featured == true {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack{
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(8)
                                }
                            }
                            .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                            
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading , spacing: 8){
                Text("Preparation Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
                
                
            }
            .padding(.leading)
            .padding(.bottom)
            
        }
        
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
