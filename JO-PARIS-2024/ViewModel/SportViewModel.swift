//
//  SportViewModel.swift
//  JO-PARIS-2024
//
//  Created by Clara on 27/06/2023.
//

import Foundation

class SportViewModel: ObservableObject {
    
    @Published var sports : [Sport] = []
    
    //    [athetisme, climbing, boxing, archery, escrime, golf, handball] //  tableau formé à partir de la struct Sport
    
    
    func fetchSport() async {
        
        let apikey = "keyYoFImG0TYBYfYx"
        
        if let url = URL(string: "https://api.airtable.com/v0/appRXuEqQRTEFLrki/Sport") {
            
            do {
                
                var request = URLRequest(url: url)
                
                request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
                
                let (data, _) = try await URLSession.shared.data(for: request)
                
                if let JSonData = try JSONSerialization.jsonObject(with: data) as? [String: Any]{
                    
                    print(JSonData)
                }
                
                if let decodedResponse = try? JSONDecoder().decode(SportResponse.self, from: data) {
                    
                    sports = decodedResponse.sports
                }
                
            } catch {
                
                print("Invalid data")
                
            }
        }
    }
}
