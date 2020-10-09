//
//  KeychainConstants.swift
//  KeychainWrapper
//
//  Created by Miguel Mexicano Herrera on 08/10/20.
//

internal let service: String = "NutSecretService"

internal enum Errors: Error {
    case keychainCreatingError
    case operationError
}
