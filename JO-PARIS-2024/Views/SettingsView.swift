//
//  SettingsView.swift
//  JO-PARIS-2024
//
//  Created by M on 27/06/2023.
//


import SwiftUI

struct SettingsView: View {
    
    @Binding var isModaleShown : Bool
    @State private var notificationsToggle = false
    //    @State private var geolocationToggle = false
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .top) {
                
                Color("Zeus")
                
                VStack(alignment:.leading) {
                    
                    HStack {
                        Spacer()
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 250, height: 3)
                            .padding(10)
                        Spacer()
                    }
                    
                    Section{
                        Text("Paramètres")
                            .font(.title)
                        Toggle("Activer les notifications", isOn: $notificationsToggle)
                        //                Toggle("Activer la géolocalisation", isOn: $geolocationToggle)
                    }
                    .padding()
                    Divider()
                        .overlay(.white)
                    Section{
                        Text("Langues")
                    }
                    .padding()
                    Divider()
                        .overlay(.white)
                    Section{
                        Text("Informations personnelles")
                    }
                    .padding()
                    Divider()
                        .overlay(.white)
                    
                    NavigationLink {
                        AProposView()
                    } label: {
                        Section{
                            Text("À propos")
                        }
                    }
                    .padding()
                    Divider()
                        .overlay(.white)
                    
                    Section{
                        Text("Déconnexion")
                            .foregroundColor(.red)
                    }
                    .padding()
                }
            }
            
            //            .padding(.bottom, 40.0)
            .foregroundColor(.white)
            //            .fixedSize(horizontal: true, vertical: true)// adapter la taille de la modale à son contenu ???
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isModaleShown: .constant(true))
    }
}
