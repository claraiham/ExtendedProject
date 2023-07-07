//
//  TabBarView.swift
//  JO-PARIS-2024
//
//  Created by Manu on 21/06/2023.
//
// --------  Tab Bar pour tous les écrans  --------

import SwiftUI



struct TabBarView: View {
    
    @State private var selectedTab: Int = 0
    
    init() {
            // Couleur de fond de la TabBar
            UITabBar.appearance().backgroundColor = UIColor.white
            // Couleur personnalisée des icones inactives
            UITabBar.appearance().unselectedItemTintColor = UIColor(named: "Grey")
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                        .resizable()
                        .environment(\.symbolVariants, .none)
                    Text("Actus")
                }
                .tag(0)

            LiveView()
                .tabItem {
                    Image(systemName: "play.square.stack")
                        .resizable()
                        .environment(\.symbolVariants, .none)
                    Text("Live")
                }
                .tag(1)
            
            EventsView()
                .tabItem {
                    Image(systemName: "calendar.badge.clock")
                        .resizable()
                        .environment(\.symbolVariants, .none)
                    Text("Evènements")
                }
                .tag(2)

            ProfilView()
                .tabItem {
                    Image(systemName: "person")
                        .resizable()
                        .environment(\.symbolVariants, .none)
                    Text("Profil")
                }
                .tag(3)
        }
        .tint(Color("Apache"))
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(UserViewModel())
            .environmentObject(CountryViewModel())
            .environmentObject(AthleteViewModel())
            .environmentObject(SportViewModel())
            .environmentObject(EventViewModel())
    }
}
