//
//  KeychainOperations.swift
//  KeychainWrapper
//
//  Created by Miguel Mexicano Herrera on 08/10/20.
//

internal class KeychainOperations: NSObject {
    static func exist(account: String) throws -> Bool {
        let status = SecItemCopyMatching([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            kSecReturnData: false,
        ] as NSDictionary, nil)
        switch status {
        case errSecSuccess:
            return true
        case errSecItemNotFound:
            return false
        default:
            throw Errors.keychainCreatingError
        }
    }
    internal static func add(value: Data, account: String) throws {
        let status = SecItemAdd([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            // Allow background access:
            kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock,
            kSecValueData: value
        ] as NSDictionary, nil)
        guard status == errSecSuccess else {
            throw Errors.operationError
        }
    }
    internal static func update(value: Data, account: String) throws {
        let status = SecItemUpdate([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
        ] as NSDictionary, [
            kSecValueData: value
        ] as NSDictionary)
        guard status == errSecSuccess else {
            throw Errors.operationError
        }
    }
    internal static func retreive(account: String) throws -> Data? {
        var result: AnyObject?
        let status = SecItemCopyMatching([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            kSecReturnData: true
        ] as NSDictionary, &result)
        switch status {
        case errSecSuccess:
            return result as? Data
        case errSecItemNotFound:
            return nil
        default:
            throw Errors.operationError
        }
    }
    internal static func delete(account: String) throws {
        let status = SecItemDelete([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service
        ] as NSDictionary)
        guard status == errSecSuccess else {
            throw Errors.operationError
        }
    }
    internal static func deleteAll() throws {
        let status = SecItemDelete([
            kSecClass: kSecClassGenericPassword
        ] as NSDictionary)
        guard status == errSecSuccess else {
            throw Errors.operationError
        }
    }
}
