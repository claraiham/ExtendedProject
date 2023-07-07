//
//  AddAthleteView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 27/06/2023.


import SwiftUI


struct AddAthleteView: View {
    
    @AppStorage("addingStuff") var addingStuff : Int = 0
    @AppStorage("deleteStuff") var deleteStuff: Int = 1
    
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var athleteVM: AthleteViewModel
    
    
    
    var body: some View {
        
        VStack{
            
            List{
                
                ForEach(athleteVM.athletes){
                    
                    athlete in
                    
                    
                    
                    Button {
                        
                        //                        print("add Athlete: (athlete.id)")
                        if userVM.users[0].favoriteAthlete.contains(athlete.id) {
                            userVM.removeAthlete(removeAthlete: athlete)
                        } else {
                            userVM.addAthlete(addAthlete: athlete)
                        }
                        Task {
                            await userVM.updateUser()
                        }
                        addingStuff += 1
                        deleteStuff -= 1
                        
                    } label: {
                        
                        HStack {
                            
                            AsyncImage(url: URL(string: athlete.photoAthlete) ){
                                image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 80, height: 80)
                                //                                        .padding()
                            } placeholder: {
                                Text("chargement photo d'Athlete")
                            }
                            Text(athlete.nameAthlete)
                            
                            Spacer()
                            if userVM.users[0].favoriteAthlete.contains(athlete.id) {
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



struct AddAthleteView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AddAthleteView()
        
            .environmentObject(AthleteViewModel())
            .environmentObject(UserViewModel())
    }
}
