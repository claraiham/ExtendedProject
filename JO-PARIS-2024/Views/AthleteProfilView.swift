//
//  AthleteProfilView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 22/06/2023.
//


import SwiftUI

struct AthleteProfilView: View {
    var image: String
    var nameAthlete:String
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: image) ){
                image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .padding()
            } placeholder: {
                Text("Chargement photo des Athlètes")
            }
            Text(nameAthlete)
                .padding(.top, -12)
        }// fin premier Athlète
//        .padding(30)
    }
}

struct AthleteProfilView_Previews: PreviewProvider {
    static var previews: some View {
        AthleteProfilView(image: "LorenzoMusetti", nameAthlete: "Lorenzo Musetti")
    }
}
