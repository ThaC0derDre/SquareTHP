//
//  EmployeeModel.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import Foundation

struct Staff: Codable {
    let employees: [Employee]
}

struct Employee: Codable, Identifiable, Comparable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id     = "uuid"
        case name   = "full_name"
        case number = "phone_number"
        case email  = "email_address"
        case bio    = "biography"
        case photo  = "photo_url_small"
        case team
    }
    
    let id, name, email, team: String
    let number, bio, photo: String?
    
    static func <(lhs: Employee, rhs: Employee) -> Bool {
        if lhs.team == rhs.team {
            return lhs.name < rhs.name
        }
        return lhs.team < rhs.team
    }
    
    static let sampleEmployee = Employee(id: UUID().uuidString, name: "Andres Gutierrez", email: "c0dingw.dre@gmail.com", team: "iOS Dev", number: "7603385384", bio: "Self-taught Dev who immediately began creating apps for companies withing the security industry. Goes by Dre", photo: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg")
}
