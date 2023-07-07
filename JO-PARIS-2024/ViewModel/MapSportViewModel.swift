//
//  MapSportViewModel.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//

// MapSportsViewModel.swift



import Foundation
import MapKit
import CoreLocation

class ReadData: ObservableObject {
    @Published var sportsDatas = [SportsDataModel]()
    @Published var selectedSports: [String] = []
    @Published var selectedDateSport: Date = Date()
    
    @Published var mapRegion = CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334)
   
    @Published var defaultRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334), span: MKCoordinateSpan(latitudeDelta: 11.0, longitudeDelta: 11.0))
    
    
    // Pour mettre à jour la région basée sur le sport sélectionné
    func updateRegion(for sport: SportsDataModel) {
            guard let coordinate = sport.coordinate else { return }
        defaultRegion.center = coordinate
        }
    
    init() {
        loadData()
    }

    func loadData() {
        guard let url = Bundle.main.url(forResource: "SportsData", withExtension: "json") else {
            print("Json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let sportsDatas = try JSONDecoder().decode([SportsDataModel].self, from: data)
            self.sportsDatas = sportsDatas
            
        } catch {
            print("Failed to load and decode file: \(error)")
        }
    }
 

    
    // Format date JJ MM AAAA
    func formatFrenchDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter.string(from: date)
    }

    /*
     // pour un affichage :  20 janv. 2017 à 22:29:51
     let french       = DateFormatter()
     french.dateStyle = .medium
     french.timeStyle = .medium
     french.locale    = Locale(identifier: "FR-fr")
     */
    
    // Fonction filtre par sports, pour la Map
    func filterSportsByType() {
        sportsDatas = sportsDatas.filter { sport in
            guard sport.isValidSport,
                  let startDate = sport.formattedStartDate,
                  let endDate = sport.formattedEndDate
            else {
                return false
            }
            return selectedSports.contains(sport.sports!) && startDate <= selectedDateSport && selectedDateSport <= endDate
        }
    }
} // Fin de la class ReadData

 

/* ------- TUTO  -------
 

 
 Convertir une date au format Fr
 https://developer.apple.com/documentation/foundation/dateformatter/
 
 https://support.apple.com/fr-fr/guide/shortcuts/apd8d9b19184/ios
 
 */
