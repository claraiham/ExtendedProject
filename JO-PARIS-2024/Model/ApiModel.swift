//
//  ApiModel.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//

import Foundation

struct UserResponse: Codable {
    let records: [Record]

    var users: [User] {
        return records.map { rec in
            var user = rec.fields
            user.id = rec.id ?? "EF12030JF320"
            return user
        }
    }

    enum CodingKeys: String, CodingKey {
        case records
    }
}

// MARK: - Record
struct Record: Codable {
    var id: String?
    let fields: User
}


struct CountryResponse: Codable {
    let records: [CountryRecord]

    var countries: [Country] {
        return records.map { rec in
            var country = rec.fields
            country.id = rec.id ?? "EF12030JF320"
            return country
        }
    }

    enum CodingKeys: String, CodingKey {
        case records
    }
}

// MARK: - Record
struct CountryRecord: Codable {
    var id: String?
    let fields: Country
}


struct AthleteResponse: Codable {
    let records: [AthleteRecord]

    var athletes: [Athlete] {
        return records.map { rec in
            var athlete = rec.fields
            athlete.id = rec.id ?? "EF12030JF320"
            return athlete
        }
    }

    enum CodingKeys: String, CodingKey {
        case records
    }
}

// MARK: - Record
struct AthleteRecord: Codable {
    var id: String?
    let fields: Athlete
}


struct SportResponse: Codable {
    let records: [SportRecord]

    var sports: [Sport] {
        return records.map { rec in
            var sport = rec.fields
            sport.id = rec.id ?? "EF12030JF320"
            return sport
        }
    }

    enum CodingKeys: String, CodingKey {
        case records
    }
}

// MARK: - Record
struct SportRecord: Codable {
    var id: String?
    let fields: Sport
}

struct EventResponse: Codable {
    let records: [EventRecord]

    var events: [Event] {
        return records.map { rec in
            var event = rec.fields
            event.id = rec.id ?? "EF12030JF320"
            return event
        }
    }

    enum CodingKeys: String, CodingKey {
        case records
    }
}

// MARK: - Record
struct EventRecord: Codable {
    var id: String?
    let fields: Event
}

