//
//  MyVideosView.swift
//  JO-PARIS-2024
//
//  Created by Manu on 21/06/2023.
// --------  Ecran des vidéos favorites  --------

import SwiftUI

struct MyVideosView: View {

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: NewsView()) {
                    Button(action: {
                        print("Ajouter une vidéo")
                    }) {
                        Image(systemName: "video.badge.plus")
                            .resizable()
                            .frame(width:50,height:35)
                            .foregroundColor(Color("Apache"))
                            .padding(.bottom, 16)
                    }
                }
                
                Text("Aucune vidéo favorite pour le moment")
                    .foregroundColor(Color("Zeus").opacity(0.7))

            } // Fin de la VStack
        }
    }
}



/*
struct MyVideosView: View {

    var body: some View {
        VStack {
            Button(action: {
                // Ajoutez ici l'action à effectuer lors du clic sur le bouton
                
                print("Ajouter une vidéo")
            }) {
                Image(systemName: "video.badge.plus")
                    .resizable()
                    .frame(width:50,height:35)
                    .foregroundColor(Color("Apache"))
                    .padding(.bottom, 16)
            }
            
            Text("Aucune vidéo favorite pour le moment")
                .foregroundColor(Color("Zeus").opacity(0.7))

        } // Fin de la VStack
    }
}
*/


struct MyVideosView_Previews: PreviewProvider {
    static var previews: some View {
        MyVideosView()
    }
}
