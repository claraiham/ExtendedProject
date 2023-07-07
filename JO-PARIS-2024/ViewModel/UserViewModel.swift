// By Clara

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    func fetchUser() async {
        
        let apikey = "keyYoFImG0TYBYfYx"
        
        if let url = URL(string: "https://api.airtable.com/v0/appRXuEqQRTEFLrki/tbl6Dqx2YJTZbgGlu") {
            
            do {
                
                var request = URLRequest(url: url)
                
                request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
                
                
                
                let (data, _) = try await URLSession.shared.data(for: request)
                
                
                
                if let JSonData = try JSONSerialization.jsonObject(with: data) as? [String: Any]{
                    
                    
                    
                    if let records = JSonData ["records"] as? [[String:Any]]{
                        
                        if let fields = records[0] ["fields"] as? [String:Any]{
                            
                            let fav = fields ["favoriteCountry"] as? [String]
                            
//                            print(fav)
                            
                        }
                        
                    }
                    
                    
                    
                    //                    print(JSonData)
                    
                    
                    
                }
                
                
                
                if let decodedResponse = try? JSONDecoder().decode(UserResponse.self, from: data) {
                    
                    
                    
                    users = decodedResponse.users
                    
                    print("user succes----------------")
                    
                    
                    
                }
                
            } catch {
                
                print("Invalid data")
                
            }
            
        }
        
    }
    
    
    
    func getCountries(_ countries:[Country]){
        
        for  (index, user) in users.enumerated() {
            
            var favs: [Country] = []
            
            for c in user.favoriteCountry{
                
                let fav = countries.first { country in
                    
                    country.id == c
                    
                }
                
                if let fav{
                    
                    favs.append(fav)
                    
                }
                
            }
            
            users[index].favCountry = favs
            
        }
        
    }
    
    
    
    func getSport(_ sports:[Sport]){
        
        for  (index, user) in users.enumerated() {
            
            var favs: [Sport] = []
            
            for c in user.favoriteSport{
                
                let fav = sports.first { sport in
                    
                    sport.id == c
                    
                }
                
                if let fav{
                    
                    favs.append(fav)
                    
                }
                
            }
            
            users[index].favSport = favs
            
        }
        
    }
    
    
    
    func getAthlete(_ athletes:[Athlete]){
        
        for  (index, user) in users.enumerated() {
            
            var favs: [Athlete] = []
            
            for c in user.favoriteAthlete{
                
                let fav = athletes.first { athlete in
                    
                    athlete.id == c
                    
                }
                
                if let fav{
                    
                    favs.append(fav)
                    
                }
                
            }
            
            users[index].favAthlete = favs
            
        }
        
    }
    
    
    
    func updateUser() async{
        
        let record = Record( fields: users[0])
        
        let apikey = "keyYoFImG0TYBYfYx"
        
        if let url = URL(string: "https://api.airtable.com/v0/appRXuEqQRTEFLrki/tbl6Dqx2YJTZbgGlu/\(users[0].id)") {
            
            do {
                
                var request = URLRequest(url: url)
                
                request.httpMethod = "PUT"
                
                request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
                
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                
                
                let userJson = try JSONEncoder().encode(record)
                
                print(record)
                
                request.httpBody = userJson
                
                //print(jsonPig)
                
                
                
                let (data, response) = try await URLSession.shared.data(for: request)
                
                if let JSonData = try JSONSerialization.jsonObject(with: data) as? [String: Any]{
                    
                    print(JSonData)
                    
                }
                
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    
                    print("All is ok")
                    
                    await fetchUser()
                    
                }
                
                
                
            } catch {
                
                print("Invalid data")
                
            }
            
        }
        
    }
    
    
    
    
    
    //    func getCountries(_ countries:[Country]){
    
    //        for  (index, user) in users.enumerated() {
    
    //            var favs: [Country] = []
    
    //            for c in user.favoriteCountry{
    
    //                let fav = countries.first { country in
    
    //                    country.id == c
    
    //                }
    
    //                if let fav{
    
    //                    favs.append(fav)
    
    //                }
    
    //            }
    
    //            users[index].favCountry = favs
    
    //        }
    
    //    }
    
    //
    
    //    func getCountries(_ countries:[Country]){
    
    //        for  (index, user) in users.enumerated() {
    
    //            var favs: [Country] = []
    
    //            for c in user.favoriteCountry{
    
    //                let fav = countries.first { country in
    
    //                    country.id == c
    
    //                }
    
    //                if let fav{
    
    //                    favs.append(fav)
    
    //                }
    
    //            }
    
    //            users[index].favCountry = favs
    
    //        }
    
    //    }
    
    
    
    //    [User (
    
    //        userFirstName: "Miles",
    
    //        userLastName: "Morales",
    
    //        userImage: "userImage",
    
    //        userEmail: "milesmorales@gmail.com",
    
    //        userPassword: "milesmorales",
    
    //        favoriteAthlete:[lorenzoMusetti],
    
    //        favoriteCountry:[italy, brazil],
    
    //        favoriteSport:[tennis])] // user formé à partir de la struct User
    
    
    
    func addCountry(addCountry: Country){
        
        if !users[0].favoriteCountry.contains(addCountry.id){
            
            users[0].favoriteCountry.append(addCountry.id)
            
        }
        
    }
    
    
    
    func addSport(addSport: Sport){
        if !users[0].favoriteSport.contains(addSport.id){
            users[0].favoriteSport.append(addSport.id)
            
        }
        
    }
    
    
    
    func addAthlete(addAthlete: Athlete){
        
        if !users[0].favoriteAthlete.contains(addAthlete.id){
            users[0].favoriteAthlete.append(addAthlete.id)
            
        }
        
    }
    
    func removeCountry(removeCountry: Country) {
                users[0].favoriteCountry.removeAll(where: { $0 == removeCountry.id })
            }
        func removeSport(removeSport: Sport) {
                users[0].favoriteSport.removeAll(where: { $0 == removeSport.id })
            }
        func removeAthlete(removeAthlete: Athlete) {
                users[0].favoriteAthlete.removeAll(where: { $0 == removeAthlete.id })
            }
}
