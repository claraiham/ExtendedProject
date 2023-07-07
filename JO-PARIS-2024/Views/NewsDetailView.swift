//
//  NewsDetailView.swift
//  JO-PARIS-2024
//
//  Created by Remy on 28/06/2023.
//

import SwiftUI

struct NewsDetailView: View {
    var SportImage:String
    var SportArticle: String
    var TitleSport:String
    var textFavori:String
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var sportVM: SportViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                AsyncImage(url: URL(string: SportImage) ){
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    //                    .frame(width: 342, height: 234)
                        .clipped()
                        .scaledToFill()
                        .ignoresSafeArea(.all)
                    
                } placeholder: {
                    
                }
                Color("Zeus")
                    .opacity(0.90)
                    .edgesIgnoringSafeArea(.all)
                
                
                    ScrollView {
                        VStack{
                            Text(TitleSport)
                                .frame(width: 370)
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.top, 88)
                            
                            Text(SportArticle)
                                .frame(width: 370)
                                .font(.title3)
                                .foregroundColor(Color.white.opacity(0.95))
                                .padding(.bottom, 96)
                                .padding(.horizontal, 24)
                        } // Fin de la VStack
                        Spacer()
                        
                    }
                    .ignoresSafeArea(.all)
                
            }
        }
    }
    
    
    struct NewsDetailView_Previews: PreviewProvider {
        static var previews: some View {
            NewsDetailView(SportImage: "https://pbs.twimg.com/media/FY03MXyXkAI7lOo.jpg:large", SportArticle: "Aujourd'hui la castagne... blablablablablballlll", TitleSport: "La bagare", textFavori: "Popatoes")
                .environmentObject(UserViewModel())
                .environmentObject(CountryViewModel())
                .environmentObject(AthleteViewModel())
                .environmentObject(SportViewModel())
        }
    }
}
