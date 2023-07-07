//
//  AthleteViewModel.swift
//  JO-PARIS-2024
//
//  Created by Clara on 27/06/2023.
//

import Foundation

class AthleteViewModel: ObservableObject {

    @Published var athletes: [Athlete] = []

//    [lorenzoMusetti] //  tableau formé à partir de la struct Athlete


    func fetchAthlete() async {

        let apikey = "keyYoFImG0TYBYfYx"

        if let url = URL(string: "https://api.airtable.com/v0/appRXuEqQRTEFLrki/Athlete") {

            do {

                var request = URLRequest(url: url)

                request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")

                

                let (data, _) = try await URLSession.shared.data(for: request)

                

                if let JSonData = try JSONSerialization.jsonObject(with: data) as? [String: Any]{

                    

                    print(JSonData)

                    

                }

                

                if let decodedResponse = try? JSONDecoder().decode(AthleteResponse.self, from: data) {

                    

                    athletes = decodedResponse.athletes

                    

                }

            } catch {

                print("Invalid data")

            }

        }

    }

}
