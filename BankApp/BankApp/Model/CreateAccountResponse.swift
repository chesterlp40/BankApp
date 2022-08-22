//
//  CreateAccountResponse.swift
//  BankApp
//
//  Created by Ezequiel Rasgido on 21/08/2022.
//

import Foundation

struct CreateAccountResponse: Decodable {
    let success: Bool
    let error: String?
}
