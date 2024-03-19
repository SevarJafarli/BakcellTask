//
//  RoumingPackagesAPI.swift
//  BakcellNetworkKit
//
//  Created by Sevar Jafarli on 12.03.24.
//

import Foundation
import Moya

public enum RoumingPackagesAPI {
    case roumingPackages
    
}

extension RoumingPackagesAPI: TargetType {
    public var sampleData: Data {
        return Data()
    }
    
    
    public var headers: [String : String]? {
        let dict = ["Content-Type": "application/json"]
        return dict
    }
    
    public var baseURL: URL {
        switch self {
        case .roumingPackages:
            return URL(string: "https://demo9468773.mockable.io/bakcell")!
            
        }
    }
    
    public var path: String {
        switch self {
        case .roumingPackages:
            return "/rouming"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .roumingPackages:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .roumingPackages:
            return .requestPlain
        }
    }
    
    public var validate: Bool {
        return true
    }
    
    public var validationType: ValidationType {
        return .customCodes([200, 201, 202, 204, 304, 400, 401, 403, 404, 406, 409])
    }
}

