//
//  RoumingPackages.swift
//  BakcellNetworkKit
//
//  Created by Sevar Jafarli on 12.03.24.
//

import Foundation


// MARK: - Welcome
public struct RoumingPackagesResponse: Codable {
    public let title: String
    public let countries: [String: String]
    public let internetPackages: InternetPackagesResponse
    public let allPackages: AllPackagesResponse
    public let smsCallPackages: SMSCallPackagesResponse
}

// MARK: - AllPackages
public struct AllPackagesResponse: Codable {
    public let title: String
    public let items: [AllPackagesItemResponse]
}

// MARK: - AllPackagesItem
public struct AllPackagesItemResponse: Codable {
    public let title, period: String
    public let types: [TypeElementResponse]
}

// MARK: - TypeElement
public struct TypeElementResponse: Codable {
    public let name, units: String
}

// MARK: - InternetPackages
public struct InternetPackagesResponse: Codable {
    public let title: String
    public let items: [InternetPackagesItemResponse]
}

// MARK: - InternetPackagesItem
public struct InternetPackagesItemResponse: Codable {
    public let id: Int
    public let title, icon, desc, period: String
    public let type: String
}

// MARK: - SMSCallPackages
public struct SMSCallPackagesResponse: Codable {
    public let title: String
    public let items: [SMSCallPackagesItemResponse]
}

// MARK: - SMSCallPackagesItem
public struct SMSCallPackagesItemResponse: Codable {
    public let id: Int
    public let title, period, type: String
}
