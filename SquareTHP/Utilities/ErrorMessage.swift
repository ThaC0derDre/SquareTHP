//
//  ErrorMessage.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/6/22.
//

import Foundation

enum ErrorMessage: String, Error {
    case invaildURL      = "Bad URL. Please check link and try again"
    case noNetwork       = "Unable to complete request. Please check your internet connection"
    case invalidResponse = "Invalid response from server. Please try again"
    case invaildData     = "Invaild data from server. Please try again"
    case emptyList       = "No employees found!"
}
