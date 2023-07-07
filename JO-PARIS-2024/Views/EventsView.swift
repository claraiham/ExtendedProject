//
//  EventsView.swift
//  JO-PARIS-2024
//
//  Created by Seraphin on 21/06/2023.
// --------  Ecran des évènements avec calendrier (Date Picker)  --------

import SwiftUI



struct EventsView: View {
    
    @EnvironmentObject var eventVM: EventViewModel
    @EnvironmentObject var sportVM: SportViewModel
    
    
    var body: some View {
        VStack {
            HStack (){
                Text("Évenements")
                    .font(.custom("Paris2024", size: 24))
                    .foregroundColor(Color("RougeAmour"))
                    .padding()
            }
            
            Spacer(minLength: 16)
            
            HStack {
                
                ButtonEventView()
                
            }
            
            if eventVM.sportIsPresented {
                SportListView()
                
                Button("OK") {
                    eventVM.sportIsPresented.toggle()
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                Spacer()
                
            } else {
                EventListView()
                
                
            }
            
            Spacer()
            
            //            MapSportsView()
            /*
             MapSportsView()
             .tint(Color("Apache"))
             .padding(.horizontal, 24)
             .padding(.top, 40)
             */
            
        } //fin vstack
        .tint(Color("Apache"))
        
        
        .onAppear {
            Task {
                await eventVM.fetchEvents()
                eventVM.getSportEvent(sportVM.sports)
                
            }
        }
    }
}



struct SportListView: View {
    
    @EnvironmentObject var sportVM: SportViewModel
    @EnvironmentObject var eventVM: EventViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(sportVM.sports) { sport in
                    Button(action: {
                        if !eventVM.selectedSport.contains(sport) {
                            eventVM.selectedSport.append(sport)
                        } else {
                            eventVM.selectedSport.removeAll { s in
                                sport == s
                            }
                        }
                        
                    }, label: {
                        HStack {
                            Image(sport.iconSport)
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(sport.sport)
                        }
                        .foregroundColor(eventVM.selectedSport.contains(sport) ? Color("Zeus") : Color(.gray))
                        
                        //                            .bold(eventVM.selectedSport.contains(sport) ? true : false)
                        
                    })
                    
                }
            }
            
            //                    .listRowBackground(Color("Pearl Bush"))
            .listRowBackground(Color(red: 0.95, green: 0.95, blue: 0.94))
            .scrollContentBackground(.hidden)
        }
        .onAppear{
            Task{
                await sportVM.fetchSport()
            }
        }
    }
}



struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
            .environmentObject(SportViewModel())
            .environmentObject(EventViewModel())
    }
}



