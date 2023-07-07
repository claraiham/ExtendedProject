//
//  ArrayUsers.swift
//  JO-PARIS-2024
//
//  Created by Clara on 21/06/2023.

import Foundation



// Structure des utilisateurs, avec les mots de passe



struct User: Identifiable, Codable {

    //    internal init(id: UUID = UUID(), userFirstName: String, userLastName: String, userImage: String, userEmail: String, userPassword: String, favoriteAthlete: [Athlete] = [], favoriteCountry: [Country] = [], favoriteSport: [Sport] = []) {

    //        self.id = id

    //        self.userFirstName = userFirstName

    //        self.userLastName = userLastName

    //        self.userImage = userImage

    //        self.userEmail = userEmail

    //        self.userPassword = userPassword

    //        self.favoriteAthlete = favoriteAthlete

    //        self.favoriteCountry = favoriteCountry

    //        self.favoriteSport = favoriteSport

    //    }

    

    var id: String = ""

    var userFirstName: String

    var userLastName: String

    var userImage: String

    

    var userEmail : String = ""

    var userPassword: String = ""

    

    var favAthlete: [Athlete] = [] // reprise des énumérations

    var favCountry: [Country] = []  // reprise des énumérations des 190 pays ?

    var favSport: [Sport] = []  // reprise des énumérations des 46 sports

    

    var favoriteAthlete: [String]

    var favoriteSport: [String]

    var favoriteCountry: [String]

    

    enum CodingKeys: String, CodingKey{

        

        case userFirstName

        case userLastName

        case userImage

        //        case userEmail

        //        case userPassword

        case favoriteAthlete

        case favoriteSport

        case favoriteCountry

    }

}


/* --------  To Do  --------
 
 Gestion des favoris
 
 */
