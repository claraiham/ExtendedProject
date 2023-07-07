//
//  Picker2View.swift
//  JO-PARIS-2024
//
//  Created by M on 23/06/2023.
//

import SwiftUI

// --------  Picker complexe  --------
// by Manu



struct Picker2View: View {
    @State private var selection: String = "Pays"
        let filterOptions: [String] = ["Pays", "Sports", "Athlètes"]
        
        init() {
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("Apache"))
            
            let attributes: [NSAttributedString.Key:Any] = [.foregroundColor : UIColor.black]
            UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        }
        
        var body: some View {
            ZStack {
                VStack {
                    Text("Mon grand titre")
                        .font(Font.custom("Paris2024-Variable", size: 24))
                        .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                        .padding(.horizontal, 15)
                    
                    Picker(
                        selection: $selection,
                        label: Text("Votre choix"),
                        content: {
                            ForEach(filterOptions.indices, id: \.self) { index in
                                Text(filterOptions[index])
                                    .tag(filterOptions[index])
                            }
                        })
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(4)
                        .background(Color("Pearl Bush"))
                        .padding(.vertical, 5)
                    
                    Spacer()

                    if selection == "Pays" {
                        Text("Vidéo du pays")
                    } else if selection == "Sports" {
                        Text("Vidéo par discipline")
                    } else {
                        Text("Focus sur les athlètes")
                    }

                    Spacer()
                }
            }
        }
    }

struct Picker2View_Previews: PreviewProvider {
    static var previews: some View {
        Picker2View()
    }
}
