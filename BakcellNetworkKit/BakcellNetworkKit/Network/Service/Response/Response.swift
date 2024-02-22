//
//  Response.swift
//  BakcellNetworkKit
//
//  Created by Sevar Jafarli on 15.02.24.
//

import Foundation

public struct ApiResponse: Decodable {
    public var code: String?
    public var message: String?
}

public struct NoResponse: Decodable {}

public struct WrongResponse: Decodable {
    public var code: String?
    public var message: String?
}
