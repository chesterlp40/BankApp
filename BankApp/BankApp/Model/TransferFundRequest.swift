//
//  TransferFundRequest.swift
//  BankApp
//
//  Created by Ezequiel Rasgido on 21/08/2022.
//

import Foundation

struct TransferFundRequest: Codable {
    let accountFromId: String
    let accountToId: String
    let amount: Double
}
