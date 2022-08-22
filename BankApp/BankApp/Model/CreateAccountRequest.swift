//
//  CreateAccountRequest.swift
//  BankApp
//
//  Created by Ezequiel Rasgido on 21/08/2022.
//

import Foundation

struct CreateAccountRequest: Codable {
    let name: String
    let accountType: String
    let balance: Double
}
