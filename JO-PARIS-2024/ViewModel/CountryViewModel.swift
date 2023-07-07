//
//  CountryViewModel.swift
//  JO-PARIS-2024
//
//  Created by M on 27/06/2023.
//

import Foundation



class CountryViewModel: ObservableObject {



    @Published var countries: [Country] = []

//    [italy, southAfrica, japan, brazil, newZeland] //  tableau formé à partir de la struct Country

    func fetchCountry() async {

        let apikey = "keyYoFImG0TYBYfYx"

        if let url = URL(string: "https://api.airtable.com/v0/appRXuEqQRTEFLrki/Country") {

            do {

                var request = URLRequest(url: url)

                request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")

                

                let (data, _) = try await URLSession.shared.data(for: request)

                

                if let JSonData = try JSONSerialization.jsonObject(with: data) as? [String: Any]{

                    

                    print(JSonData)

                    

                }

                

                if let decodedResponse = try? JSONDecoder().decode(CountryResponse.self, from: data) {

                    

                    countries = decodedResponse.countries

                    

                    print("country succes----------------")

                    

                }

            } catch {

                print("Invalid data")

            }

        }

    }

}
