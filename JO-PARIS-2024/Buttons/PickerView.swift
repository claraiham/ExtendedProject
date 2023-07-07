//
//  PickerView.swift
//  JO-PARIS-2024
//
//  Created by M on 23/06/2023.
//

import SwiftUI

// --------  Picker simplifié  --------
// by Manu


struct PickerView: View {
    
    @State private var selectFilter = 0
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("Apache"))
    }
    var body: some View {
        ZStack {
            VStack {
                Text("Mon grand titre")
                    .font(Font.custom("Paris2024-Variable", size: 24))
                    .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                    .padding(.horizontal, 15)
                
                VStack {
                    Picker("Choix de la catégorie", selection: $selectFilter) {
                        Text("Pays").tag(0)
                        Text("Sport").tag(1)
                        Text("Athèltes").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding(4)
                    .background(Color("Pearl Bush"))
                    
                    Spacer()
                    
                    if selectFilter == 0 {
                        Text("Vidéo du pays")
                        
                    } else if selectFilter == 1 {
                        Text("Vidéo par discipline")
                        
                    } else {
                        Text("Focus sur les athlètes")
                    }
                    Spacer()
                }
            }
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
