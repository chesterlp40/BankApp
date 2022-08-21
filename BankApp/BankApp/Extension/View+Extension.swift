//
//  View+Extension.swift
//  BankApp
//
//  Created by Ezequiel Rasgido on 21/08/2022.
//

import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
