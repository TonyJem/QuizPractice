//
//  Account.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

class Account {
    
    enum AccountType {
        case admin
        case normalUser
    }
    
    let username: String
    let password: String
    let accountType: AccountType
    
    init(username: String, password: String, accountType: AccountType) {
        self.username = username
        self.password = password
        self.accountType = accountType
    }
}
