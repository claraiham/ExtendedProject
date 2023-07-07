//
//  MapSportsView.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//


import SwiftUI
import MapKit
import CoreLocation

struct MapSportsView: View {
    @ObservedObject var viewModel = ReadData()
    @State private var selectedSport: SportsDataModel?
    @State private var showingDetailView = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Choix du sport
                List {
                    Section(header: Text("Sélectionnez le sport à afficher sur la carte")) {
                        ForEach(viewModel.sportsDatas, id: \.id) { sport in
                            Button(action: {
                                if viewModel.selectedSports.contains(sport.sports!) {
                                    viewModel.selectedSports.removeAll(where: { $0 == sport.sports! })
                                } else {
                                    viewModel.selectedSports.append(sport.sports!)
                                    self.selectedSport = sport
                                    viewModel.updateRegion(for: sport)  // Appeler la méthode updateRegion lorsque le sport est sélectionné
                                    self.showingDetailView = true
                                }
                            }) {
                                HStack {
                                    Text(sport.sports ?? "")
                                    if viewModel.selectedSports.contains(sport.sports!) {
                                        Spacer()
                                        Image(systemName: "checkmark").foregroundColor(.blue)
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .fullScreenCover(isPresented: $showingDetailView) {
                    if let sport = self.selectedSport {
                        SportDetailView(sport: sport, isPresented: self.$showingDetailView)
                    }
                }
            }
        }
    }
}

struct MapSportsView_Previews: PreviewProvider {
    static var previews: some View {
        MapSportsView()
    }
}


