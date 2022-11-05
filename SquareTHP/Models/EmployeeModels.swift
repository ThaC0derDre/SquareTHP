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

struct Employee: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id     = "uuid"
        case name   = "full_name"
        case number = "phone_number"
        case email  = "email_address"
        case bio    = "biography"
        case photo  = "photo_url_small"
        case team
    }
    
    let id, name, number, email, bio, photo, team : String
}
