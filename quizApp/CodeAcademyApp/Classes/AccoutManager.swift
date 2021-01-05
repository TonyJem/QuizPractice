//
//  AccoutManager.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

struct AccountManager {

    enum AccountManagerError: Error {
        case general
    }

    typealias UserInformationTuple = (username: String, password: String)

    static var loggedInAccount: Account? {
        willSet(newAccount) {
            print("Will set account. Old username: \(loggedInAccount?.username ?? "nil"), new username: \(newAccount?.username ?? "nil")")
        } didSet {
            print("Did set account. Old username: \(oldValue?.username ?? "nil"), new username: \(loggedInAccount?.username ?? "nil")")
        }
    }

    static func registerAccount(username: String?, password: String?) -> Bool {
        do {
            let userInformation = try unwrapUserInformation(username: username, password: password)
            let account = Account(
                username: userInformation.username,
                password: userInformation.password,
                accountType: LocalDataBase.accounts.isEmpty ? .admin : .normalUser
            )
            
            loggedInAccount = account
            
            LocalDataBase.accounts.append(account)
            
            return true
        } catch {
            return false
        }
    }

    static func login(username: String?, password: String?) -> Bool {
        do {
            let userInformation = try unwrapUserInformation(username: username, password: password)
            return loggedInAccount?.username == userInformation.username && loggedInAccount?.password == userInformation.password
        } catch {
            return false
        }
    }
}

// MARK: - Helpers

extension AccountManager {

    private static func unwrapUserInformation(
        username: String?,
        password: String?
    ) throws -> UserInformationTuple {
        guard
            let username = username,
            !username.isEmpty,
            let password = password,
            !password.isEmpty
        else {
            throw AccountManagerError.general
        }
        return (username: username, password: password)
    }
}

