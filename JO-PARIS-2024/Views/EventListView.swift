//
//  EventListView.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//

import SwiftUI

struct EventListView: View {
    
    @EnvironmentObject var eventVM: EventViewModel
    @EnvironmentObject var sportVM: SportViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach (eventVM.events){ event in
                    
                    ForEach (event.sportArray.filter({ s in
                        eventVM.selectedSport.contains(s) || eventVM.selectedSport.isEmpty
                    })) { sport in
                        HStack (alignment: .top) {
                            Image(sport.iconSport)
                                .resizable()
                                .frame(width: 20, height: 20)
                            VStack (alignment: .leading){
                                Text(sport.sport)
                                Text(event.epreuve)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text(event.formatedDate, format: .dateTime.day().month().weekday())
                                
                                Text(event.formatedDate.formatted(date: .omitted, time: .shortened))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                    }
                }
            }.scrollContentBackground(.hidden)
        }
        
    }
}



struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
            .environmentObject(SportViewModel())
            .environmentObject(EventViewModel())
    }
}

