//
//  ArrayAthlete.swift
//  JO-PARIS-2024
//
//  Created by Clara on 21/06/2023.


import Foundation



// Structure des athlètes



struct Athlete: Identifiable, Codable {

    var id: String = ""

    var nameAthlete: String

    var photoAthlete: String

    var genre: String

    var country: String

    var sport: String

    var paralypiqueAthete: Bool = false

    var epreuve: String = ""

    var awards: String = ""

    

    

    

    enum CodingKeys: String, CodingKey {

        case nameAthlete

        case photoAthlete

        case genre

        case country

        case sport

//        case paralypiqueAthete

//        case epreuve

//        case awards

    }

    

    /*

     "nameAthlete": "Fred Kerley",

     "genre": "Homme",

     "country": "USA",

     "discipline": "Athletisme",

     "paralypiqueAthete": "False",

     "epreuve": "100 m hommes",

     "awards": ""

     */

    

}



let lorenzoMusetti = ( Athlete(nameAthlete: "Lorenzo Musetti", photoAthlete: "LorenzoMusetti", genre: "Homme", country: "Italie", sport: "Tennis", paralypiqueAthete: false, epreuve: "", awards: ""))







// athlete favoris.append

