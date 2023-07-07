//
//  EventViewModel.swift
//  JO-PARIS-2024
//
//  Created by Seraphin on 26/06/2023.
//

import Foundation

class EventViewModel : ObservableObject {
    
    @Published var events : [Event] = []
    
    func fetchEvents() async {
        
        let apikey = "keyYoFImG0TYBYfYx"
        
        if let url = URL(string: "https://api.airtable.com/v0/appRXuEqQRTEFLrki/Events") {
            
            do {
                var request = URLRequest(url: url)
                request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
                
                let (data, _) = try await URLSession.shared.data(for: request)
                
                if let JSonData = try JSONSerialization.jsonObject(with: data) as? [String: Any]{
                    print(JSonData)
                }
                
                if let decodedResponse = try? JSONDecoder().decode(EventResponse.self, from: data) {
                    events = decodedResponse.events
                    print("event succes----------------")
                }
                
            } catch {
                print("Invalid data")
            }
        }
    }
    
    func getSportEvent(_ sports:[Sport]){
        
        for  (index, event) in events.enumerated() {
            
            var sportEvent: [Sport] = []
            
            for c in event.sport{
                
                let sport = sports.first { sport in
                    sport.id == c
                }
                
                if let sport{
                    sportEvent.append(sport)
                }
            }
            
            events[index].sportArray = sportEvent
        }
    }
    
    @Published var selectedSport : [Sport] = []
    @Published var sportIsPresented: Bool = false // sert à afficher le filtre des sports
}


