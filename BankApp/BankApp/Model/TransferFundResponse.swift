//
//  TransferFundResponse.swift
//  BankApp
//
//  Created by Ezequiel Rasgido on 21/08/2022.
//

import Foundation

struct TransferFundResponse: Decodable {
    let success: Bool
    let error: String?
}
