//
//  ButtonEventView.swift
//  JO-PARIS-2024
//
//  Created by M on 06/07/2023.
//

import SwiftUI

struct ButtonEventView : View {
    
    @EnvironmentObject var eventVM : EventViewModel
    
    var color: Color = .blue
    
    var body: some View {
        
            HStack (alignment: .center){
                Text("Sélectionner un ou plusieurs sports ici")
                    .padding()
                    
            }.padding(.horizontal, 16)
                .padding(.trailing, 0)
                .padding(.vertical, 0)

                .frame(minHeight: 60, maxHeight: 60)
                .background(Color(red: 0.95, green: 0.95, blue: 0.94))

                .cornerRadius(10)
                .frame(width: 390)
                .onTapGesture {
                    eventVM.sportIsPresented.toggle()
                }
    }
}

struct ButtonEventView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonEventView()
            .environmentObject(EventViewModel())
    }
}
