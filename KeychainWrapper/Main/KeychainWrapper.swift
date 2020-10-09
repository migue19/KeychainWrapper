//
//  KeychainWrapper.swift
//  KeychainWrapper
//
//  Created by Miguel Mexicano Herrera on 08/10/20.
//

import Foundation
public class KeychainWrapper {
    public static func get(account: String) throws -> Data? {
        if try KeychainOperations.exist(account: account) {
            return try KeychainOperations.retreive(account: account)
        } else {
            throw Errors.operationError
        }
    }
    public static func set(value: Data, account: String) throws {
        if try KeychainOperations.exist(account: account) {
            try KeychainOperations.update(value: value, account: account)
        } else {
            try KeychainOperations.add(value: value, account: account)
        }
    }
    public static func delete(account: String) throws {
        if try KeychainOperations.exist(account: account) {
            return try KeychainOperations.delete(account: account)
        } else {
            throw Errors.operationError
        }
    }
    public static func deleteAll() throws {
        try KeychainOperations.deleteAll()
    }
}
