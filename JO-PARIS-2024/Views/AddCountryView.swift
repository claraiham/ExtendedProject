////
//  AddCountryView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 27/06/2023.


import SwiftUI


struct AddCountryView: View {
    
    @AppStorage("addingStuff") var addingStuff : Int = 0
    @AppStorage("deleteStuff") var deleteStuff: Int = 1
    
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var countryVM: CountryViewModel
    
    
    var body: some View {
        
        VStack{
            
            List{
                
                ForEach(countryVM.countries){
                    
                    country in
                    
                    Button {
                        
                        if userVM.users[0].favoriteCountry.contains(country.id) {
                            userVM.removeCountry(removeCountry: country)
                        } else {
                            userVM.addCountry(addCountry: country)
                        }
                        Task {
                            await userVM.updateUser()
                        }
                        addingStuff += 1
                        deleteStuff -= 1
                        
                    } label: {
                        
                        HStack {
                            
                            Image(country.flagCountry)
                            
                                .resizable()
                            
                                .scaledToFill()
                            
                                .frame(width:80,height:80)
                            
                            Text(country.country)
                            Spacer()
                            if userVM.users[0].favoriteCountry.contains(country.id) {
                                                        Image(systemName: "checkmark")
                                    .foregroundColor(Color("Apache"))
                                    .padding(.trailing, 16)
                                                    }
                            
                        }
                        
                    }
                    .tint(Color("Zeus")) // Color list
                    
                    
                    
                    //                                        HStack {
                    
                    //                                            Image(country.flagCountry)
                    
                    //                                                .resizable()
                    
                    //                                                .scaledToFill()
                    
                    //                                            .frame(width:80,height:80)
                    
                    //                                            Text(country.country)
                    
                    //                                        }
                    
                    //                                        .onTapGesture {
                    
                    //                                            userVM.addCountry(currentUser: userVM.users[0], addCountry: country)
                    
                    //                                        }
                    
                }
                
            }
            
        }
        
        //        onAppear{
        
        //            Task{
        
        //                //                await sportVM.fetchSport()
        
        //                //                await athleteVM.fetchAthlete()
        
        //                await countryVM.fetchCountry()
        
        //                await userVM.fetchUser()
        
        //                userVM.getCountries(countryVM.countries)
        
        //            }
        
        //        }
        
    }
    
}



struct CountryListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AddCountryView()
        
            .environmentObject(UserViewModel())
        
            .environmentObject(CountryViewModel())
        
    }
    
}
