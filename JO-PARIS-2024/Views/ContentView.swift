//
//  ContentView.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import SwiftUI

// --------  Old - Ecran de lancement  --------
// by


struct ContentView: View {
    

    var body: some View {
        TabBarView()
    }
}


struct ContentView_Previews:  PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(UserViewModel())
            .environmentObject(CountryViewModel())
            .environmentObject(SportViewModel())
            .environmentObject(AthleteViewModel())
            .environmentObject(EventViewModel())
    }
}


/* --------  Tuto  --------
 
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views
 
 */
