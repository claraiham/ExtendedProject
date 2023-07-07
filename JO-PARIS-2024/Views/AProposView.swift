//
//  AProposView.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//

import SwiftUI

struct AProposView: View {
    var body: some View {
            ZStack {

                Color("Zeus")
                    .ignoresSafeArea()

                LazyVStack(alignment:.leading) {
                    Section{

                        Text("Politique de confidentialité")
                            .font(.title3)
                            .bold()
                            .padding(.bottom)
                        Text("Aucune donnée n'est utilisée à titre commercial par l'application, ni par des applications tierces, ni par quelque organisme que ce soit.")
                            .padding(.bottom)
                        Text("Toutes les données enregistrées sur le téléphone (prénoms, aides, lieux) sont effacées lors de la désinstallation de l'application. Toutes les données enregistrées par l'application sur votre compte iCloud sont effacées lorsque vous supprimez l'ensemble de données.")
                            .padding(.bottom)
                    }

                    Section{
                        Text("Contrat de licence utilisateur final")
                            .font(.title3)
                            .padding(.bottom)
                        Text("Retrouvez toutes ces informations sur notre site www.olympixo.com")
                            .padding(.bottom)
                    }

                }
                .padding()
                .foregroundColor(.white)
            }
        }
    }


struct AProposView_Previews: PreviewProvider {
    static var previews: some View {
        AProposView()
    }
}
