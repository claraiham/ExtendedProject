//
//  AddView.swift
//  JO-PARIS-2024
//
//  Created by M on 22/06/2023.
//

import SwiftUI

struct AddView: View {
    var body: some View {
            VStack{
                ZStack {
                    Circle()
                        .foregroundColor(Color("Pearl Bush"))
                        .frame(width:44,height:44)
                    Image(systemName:"plus")
                        .resizable()
                    .frame(width:20,height:20)
                    .foregroundColor(Color(.gray))
                }

                Text("Ajouter")
                    .foregroundColor(Color(.gray))

                    // .font(Font.custom("Paris2024-Variable", size: 24))
            }// Ajouter
            .padding(30)

        }
    }

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
