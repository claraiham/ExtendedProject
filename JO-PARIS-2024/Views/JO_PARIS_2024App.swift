//
//  JO_PARIS_2024App.swift
//  JO-PARIS-2024
//
//  Created by Manu on 21/06/2023.
//


import SwiftUI

@main

struct JO_PARIS_2024App: App {
    
    // ENVIRONMENT OBJECT
    // @StateObject var apiData = ApiData()
    // @StateObject var userPrefs = UserPrefs()
    
    @StateObject var userVM: UserViewModel = UserViewModel()// création de la boîte globale du user et ses préferences
    @StateObject var countryVM: CountryViewModel = CountryViewModel()
    @StateObject var sportVM: SportViewModel = SportViewModel()
    @StateObject var athleteVM: AthleteViewModel = AthleteViewModel()
    @StateObject var eventVM: EventViewModel = EventViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userVM)
                .environmentObject(countryVM)
                .environmentObject(sportVM)
                .environmentObject(athleteVM)
                .environmentObject(eventVM)
                .onAppear{
                    Task{
                        await sportVM.fetchSport()
                        await athleteVM.fetchAthlete()
                        await countryVM.fetchCountry()
                        await userVM.fetchUser()
                        await eventVM.fetchEvents()
                        userVM.getCountries(countryVM.countries)
                        userVM.getSport(sportVM.sports)
                        userVM.getAthlete(athleteVM.athletes)
                        eventVM.getSportEvent(sportVM.sports)
                    }
                }
            
        }
    }
}
