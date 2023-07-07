//
//  SportProfilView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 22/06/2023.
//

import SwiftUI

struct SportProfilView: View {
    var image: String
    var nameSport: String
    @EnvironmentObject var sportVM: SportViewModel
    @EnvironmentObject var userVM: UserViewModel
    var body: some View {
        VStack(alignment: .center){

                Image("\(image)")
                .resizable()
                .scaledToFill()
                .frame(width:40,height:40)

                Text(nameSport)
        }
        .padding(.horizontal, 24)
    }
}

struct SportProfilView_Previews: PreviewProvider {
    static var previews: some View {
        SportProfilView(image: boxing.iconSport, nameSport: tennis.sport)
    }
}
