//
//  AccountService.swift
//  BankApp
//
//  Created by Ezequiel Rasgido on 21/08/2022.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

class AccountService {
    
    private init() { }
    
    static let shared = AccountService()
    
    func getAllAccounts(
        completion: @escaping (Result<[Account]?,NetworkError>
        ) -> Void) {
        guard let url = URL.urlForAccounts() else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let accounts = try? JSONDecoder().decode(
                [Account].self, from: data
            )
            if accounts == nil {
                completion(.failure(.decodingError))
            } else {
                completion(.success(accounts))
                
            }
        }.resume()
    }
    
    func createAccount(
        createAccountRequest: CreateAccountRequest, completion: @escaping (Result<CreateAccountResponse,NetworkError>) -> Void
    ) {
        guard let url = URL.urlForCreateAccounts() else {
            return completion(.failure(.badUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        request.httpBody = try? JSONEncoder().encode(
            createAccountRequest
        )
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            let createAccountResponseData = try? JSONDecoder().decode(
                CreateAccountResponse.self,
                from: data
            )
            
            if let createAccountResponse = createAccountResponseData {
                completion(.success(createAccountResponse))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func transferFunds(
        transferFundRequest: TransferFundRequest,
        completion: @escaping (Result<TransferFundResponse,NetworkError>) -> Void
    ) {
        guard let url = URL.urlForTransferFunds() else {
            return completion(.failure(.badUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        request.httpBody = try? JSONEncoder().encode(
            transferFundRequest
        )
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let transferFundResponseData = try? JSONDecoder().decode(
                TransferFundResponse.self,
                from: data
            )
            
            if let transferFundResponse = transferFundResponseData {
                completion(.success(transferFundResponse))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
