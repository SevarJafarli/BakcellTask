//
//  RoumingPackagesService.swift
//  BakcellNetworkKit
//
//  Created by Sevar Jafarli on 12.03.24.
//

import Foundation
import Moya

public protocol RoumingPackagesServiceProtocol: BaseServiceProtocol {
    
    func getRoumingPackages(completion: @escaping (Result<RoumingPackagesResponse, WrongResponse>) -> ())
}

public class RoumingPackagesService: BaseService, RoumingPackagesServiceProtocol {
    
    private var provider: MoyaProvider<RoumingPackagesAPI>!
    
    override init() {
        super.init()
        
        #if DEBUG
        self.provider = MoyaProvider<RoumingPackagesAPI>()
        #else
        self.provider = MoyaProvider<LoyaltyAPI>(plugins: [self.authPlugin, self.languagePlugin])
        #endif
    }
 
    public func getRoumingPackages(completion: @escaping (Result<RoumingPackagesResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .roumingPackages) { result in

            completion(result)
        }
    }
}
