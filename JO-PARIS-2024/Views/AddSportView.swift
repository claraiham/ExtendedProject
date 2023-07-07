//
//  AddSportView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 27/06/2023.


import SwiftUI


struct AddSportView: View {
    
    @AppStorage("addingStuff") var addingStuff : Int = 0
    @AppStorage("deleteStuff") var deleteStuff: Int = 1
    
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var sportVM: SportViewModel
    
    
    
    var body: some View {
        
        VStack{
            
            List{
                
                ForEach(sportVM.sports){
                    
                    sport in
                    
                    Button {
                        
                        if userVM.users[0].favoriteSport.contains(sport.id) {
                            userVM.removeSport(removeSport: sport)
                            
                        } else {
                            userVM.addSport(addSport: sport)
                        }
                        Task {
                            await userVM.updateUser()
                        }
                        addingStuff += 1
                        deleteStuff -= 1
                        
                    } label: {
                        
                        HStack {
                            
                            Image(sport.iconSport)
                            
                                .resizable()
                            
                                .scaledToFill()
                            
                                .frame(width:80,height:80)
                            
                            Text(sport.sport)
                            Spacer()
                            if userVM.users[0].favoriteSport.contains(sport.id) {
                                                        Image(systemName: "checkmark")
                                    .foregroundColor(Color("Apache"))
                                    .padding(.trailing, 16)
                                                    }
                            
                        }
                        
                    }
                    .tint(Color("Zeus")) // Color list
                }
                
            }
            
        }
        
    }
}



struct AddSportView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AddSportView()
        
            .environmentObject(SportViewModel())
        
            .environmentObject(UserViewModel())
        
    }
    
}
