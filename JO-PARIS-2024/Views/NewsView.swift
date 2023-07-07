//
//  NewsView.swift
//  JO-PARIS-2024
//
//  Created by Rémy on 21/06/2023.
// --------  Ecran des actualités  --------

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var countryVM: CountryViewModel
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var sportVM: SportViewModel
    @EnvironmentObject var athleteVM: AthleteViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("A la une")
                        .font(Font.custom("Paris2024-Variable", size: 24))
                        .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                        .padding(.horizontal, 15)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(sportVM.sports) { sport in
                                NavigationLink(destination: NewsDetailView(SportImage: sport.SportImage, SportArticle: sport.SportArticle, TitleSport: sport.TitleSport, textFavori: sport.SportArticle)) {
                                    ButtonNewsView(SportImage: sport.SportImage, textFavori: sport.TitleSport)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 210, height: 20)
                    //                    Spacer()
                    //                    VStack(spacing: 15) {
                    
                    Text("Aujourd’hui")
                        .font(Font.custom("Paris2024-Variable", size: 24))
                        .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                    //                    }
                    //                    .padding([.leading, .bottom, .trailing], 15)
                    
                    VStack(spacing: 20) {
                        ForEach(sportVM.sports.reversed()) { sport in
                            NavigationLink(destination: NewsDetailView(SportImage: sport.SportImage, SportArticle: sport.SportArticle, TitleSport: sport.TitleSport, textFavori: sport.SportArticle)) {
                                ButtonNewsView(SportImage: sport.SportImage, textFavori: sport.TitleSport)
                            }
                        }
                    }
                    .padding()
                }
            }
            /*
            .onAppear {
                Task {
                    await sportVM.fetchSport()
                    await athleteVM.fetchAthlete()
                    await countryVM.fetchCountry()
                    await userVM.fetchUser()
                    
                    userVM.getCountries(countryVM.countries)
                    userVM.getSport(sportVM.sports)
                    userVM.getAthlete(athleteVM.athletes)
                }
            }*/
        }
    }
    
    struct NewsView_Previews: PreviewProvider {
        static var previews: some View {
            NewsView()
                .environmentObject(UserViewModel())
                .environmentObject(CountryViewModel())
                .environmentObject(AthleteViewModel())
                .environmentObject(SportViewModel())
        }
    }
}
