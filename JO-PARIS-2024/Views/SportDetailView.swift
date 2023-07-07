//
//  SportDetailView.swift
//  JO-PARIS-2024
//
//  Created by Manu on 02/07/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    var mapType: MKMapType
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = mapType
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}

struct SportDetailView: View {
//    var sport: Sports2DataModel // pour la 2ème version JSON
//    var adressEvent : Detail2DataModel // pour la 2ème version JSON
    
    var sport: SportsDataModel  // pour la 1ère version JSON
    
    // Ajoutez la variable d'état pour le type de carte
    @State private var mapType: MKMapType = .standard
    // Formatage de la date en utilisant la fonction dans MapSportsViewModel
    @ObservedObject var viewModel = ReadData()
    //
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        Button(action: {
                            self.isPresented = false
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .padding(.leading, 16)
                                Spacer ()
                                
                                // Title du sport
                                HStack {
                                    Text(sport.sports!)
                                    //                                        .font(.title2)
                                        .font(Font.custom("Paris2024-Variable", size: 24))
                                        .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                                        .padding(.leading, -32)
                                }
                                Spacer ()
                            }
                            .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 32)
                    }
                    
                    VStack{
                        Text("Du \(viewModel.formatFrenchDate(date: sport.formattedStartDate!)) au \(viewModel.formatFrenchDate(date: sport.formattedEndDate!))")
                            .foregroundColor(Color("Zeus"))
                            .fontWeight(.semibold)
                        Text("\n\(sport.awards ?? "")")
                            .foregroundColor(Color("Zeus").opacity(0.7))
                            .padding(.bottom, 24)
                    }
                    .padding(.horizontal, 16)
                    
                }
                
                // Carte avec le sport sélectionné
                Map(coordinateRegion: $viewModel.defaultRegion, showsUserLocation: true, annotationItems: viewModel.sportsDatas.filter { $0.sports! == sport.sports }) { place in
                    MapAnnotation(coordinate: place.coordinate!) {
                        VStack {
                            //                            Image(systemName: "mappin")
                            Image("pin2")
                                .foregroundColor(Color("RougeAmour"))
                            //                            Text("📍")
                            //                                .font(.title)
                            //                                .foregroundColor(Color("RougeAmour"))
                            
                            
                            
                            Text("\(place.localisation!)")
                                .tint(.white)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .padding(6)
                                .padding(.horizontal, 2)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("Pearl Bush"), lineWidth: 1))  // Ajout de la bordure de couleur personnalisée
//                                .background(Color.white.opacity(0.6))
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    let sports = viewModel.sportsDatas.filter { $0.sports! == sport.sports }
                    
                    if sports.count == 1 {
                        viewModel.defaultRegion.span = MKCoordinateSpan(latitudeDelta: 1.1, longitudeDelta: 1.1)
                        viewModel.defaultRegion.center = sport.coordinate!
                    }
                    
                    else if sports.count == 2 || sports.count == 3 {
                        // Calculer les moyennes de latitude et de longitude
                        let sumLatitude = sports.compactMap({ $0.latitude }).reduce(0, +)
                        let sumLongitude = sports.compactMap({ $0.longitude }).reduce(0, +)
                        let meanLatitude = sumLatitude / Double(sports.count)
                        let meanLongitude = sumLongitude / Double(sports.count)
                        
                        // Calculer les écarts entre les latitudes et les longitudes
                        let maxLatitude = sports.compactMap({ $0.latitude }).max() ?? meanLatitude
                        let minLatitude = sports.compactMap({ $0.latitude }).min() ?? meanLatitude
                        let maxLongitude = sports.compactMap({ $0.longitude }).max() ?? meanLongitude
                        let minLongitude = sports.compactMap({ $0.longitude }).min() ?? meanLongitude
                        let latitudeDelta = (maxLatitude - minLatitude) + 0.4
                        let longitudeDelta = (maxLongitude - minLongitude) + 0.4
                        
                        // Définir le centre de la carte à ces moyennes
                        viewModel.defaultRegion.center = CLLocationCoordinate2D(latitude: meanLatitude, longitude: meanLongitude)
                        
                        // Ajuster le niveau de zoom en fonction des écarts de coordonnées
                        viewModel.defaultRegion.span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
                    }
                    
                    else {
                        viewModel.defaultRegion.span = MKCoordinateSpan(latitudeDelta: 12.50, longitudeDelta: 12.50)
                        viewModel.defaultRegion.center = CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334)
                    }
                }
            }
        }.onAppear {
            viewModel.loadData()
        }
    }
}


/*
 struct SportDetailView_Previews: PreviewProvider {
 static var previews: some View {
     SportDetailView(sport: XXXX, isPresented: .constant(true))
 }
 }
 */
