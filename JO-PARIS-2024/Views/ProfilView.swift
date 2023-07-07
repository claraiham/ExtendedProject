//
//  ProfilView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 21/06/2023.
// --------  Ecran de profil de l'utilisateur  --------

import SwiftUI


struct ProfilView: View {
    
    @AppStorage("addingStuff") var addingStuff : Int = 0
    @State var isShown : Bool = false
    @EnvironmentObject var sportVM: SportViewModel
    @EnvironmentObject var athleteVM: AthleteViewModel
    @EnvironmentObject var countryVM: CountryViewModel
    @EnvironmentObject var userVM: UserViewModel
    @AppStorage("deleteStuff") var deleteStuff: Int = 1
    
    var body: some View {
        NavigationView() {
            ScrollView {
                
                if !userVM.users.isEmpty{
                    
                    VStack(alignment: .leading, spacing: 0){
                        
                        ZStack {
                            Color("Pearl Bush")
                            HStack{
                                VStack {
                                    AsyncImage(url: URL(string: userVM.users[0].userImage) ){
                                        image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .clipShape(Circle())
                                            .frame(width: 100, height: 100)
                                        //                                        .padding()
                                    } placeholder: {
                                        Text("chargement photo de profil")
                                    }
                                }
                                .padding(.leading, 24)
                                
                                
                                // image du profil
                                
                                VStack(alignment:.leading){
                                    Text(userVM.users[0].userFirstName) // prénom et nom de l'utilisateur
                                    //
                                        .fontWeight(.semibold)
                                    Text(userVM.users[0].userLastName)
                                        .foregroundColor(.gray)
                                }
                                .font(Font.custom("Paris2024-Variable", size: 24))
                                .padding(.leading, 16)
                                
                                Spacer()
                                
                                
                                Button {
                                    isShown.toggle()
                                } label: {
                                    Image(systemName:"gearshape")
                                }
                                .padding(.trailing, 32)
                                .tint(.black)// bouton réglages
                                .sheet(isPresented: $isShown) {
                                    SettingsView(isModaleShown: $isShown)
                                }
                            }
                            .padding(.vertical, 32)
                        } // fin de l'entête du profil
                        
                        Divider()
                        
                        VStack() {
                            Text("Pays")//titre cathégorie
                            //                            .font(.title3)
                                .fontWeight(.semibold)
                                .font(Font.custom("Paris2024-Variable", size: 24))
                                .padding(.top, 24)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 0){
                                    
                                    ForEach (userVM.users[0].favCountry) {
                                        country in
                                        CountryProfilView(flagCountry: country.flagCountry, country: country.country)
                                    }// pays
                                }
                            }//fin scrollView pays
                            NavigationLink {
                                AddCountryView()
                            } label: {
                                AddView()
                            }
                        }
                        
                        Divider()
//                            .padding()
                        
                        VStack {
                            Text("Sports")//titre cathégorie
                            //                            .font(.title3)
                                .font(Font.custom("Paris2024-Variable", size: 24))
                                .fontWeight(.semibold)
                                .padding(.vertical, 24)
                            
                            ScrollView(.horizontal) {
                                HStack{
                                    
                                    ForEach(userVM.users[0].favSport){
                                        sport in
                                        SportProfilView(image: sport.iconSport, nameSport: sport.sport)
                                    }//affiche les sports selectionnés
                                }
                            }//fin ScrollView sport
                            NavigationLink {
                                AddSportView()
                            } label: {
                                AddView()
                            }
                        }
                       
                        Divider()
                            .padding()

                        VStack {
                            Text("Athlètes")//titre cathégorie

                                .font(Font.custom("Paris2024-Variable", size: 24))
                                .fontWeight(.semibold)
                            ScrollView(.horizontal) {
                                HStack{
                                    ForEach(userVM.users[0].favAthlete){
                                        athlete in
                                        AthleteProfilView(image:athlete.photoAthlete, nameAthlete: athlete.nameAthlete )
                                    }
                                }
                            }//fin ScrollView athlete
                            NavigationLink {
                                AddAthleteView()
                            } label: {
                                AddView()
                            }
                        }
                    }
                }
            }// fin grande VStack
            .onAppear{
                Task{
                    await sportVM.fetchSport()
                    await athleteVM.fetchAthlete()
                    await countryVM.fetchCountry()
                    await userVM.fetchUser()
                    userVM.getCountries(countryVM.countries)
                    userVM.getSport(sportVM.sports)
                    userVM.getAthlete(athleteVM.athletes)
                }
            } // déplacé dans fichier JO paris 2024 pour charger les données au début de l'app
        }
        .onChange(of: addingStuff) { newValue in
            userVM.objectWillChange.send()
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
            .environmentObject(UserViewModel())
            .environmentObject(CountryViewModel())
            .environmentObject(AthleteViewModel())
            .environmentObject(SportViewModel())
    }
}
