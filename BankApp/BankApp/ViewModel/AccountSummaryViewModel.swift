//
//  AccountSummaryViewModel.swift
//  BankApp
//
//  Created by Ezequiel Rasgido on 21/08/2022.
//

import Foundation

class AccountSummaryViewModel: ObservableObject {
    
    private var accountModels = [Account]()
    
    @Published var accounts: [AccountViewModel] = [AccountViewModel]()
    
    var total: Double {
        accountModels.map { $0.balance }.reduce(0, +)
    }
    
    func getAllAccounts() {
        AccountService.shared.getAllAccounts { result in
            switch result {
                case .success(let accounts):
                    if let accounts = accounts {
                        self.accountModels = accounts
                        DispatchQueue.main.async {
                            self.accounts = accounts.map(AccountViewModel.init)
                        }
                    }
                   
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}

class AccountViewModel {
    
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    var name: String {
        account.name
    }
    
    var accountId: String {
        account.id.uuidString
    }
    
    var accountType: String {
        account.accountType.title
    }
    
    var balance: Double {
        account.balance
    }
}
