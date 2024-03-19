//
//  Service.swift
//  BakcellNetworkKit
//
//  Created by Sevar Jafarli on 15.02.24.
//

import Foundation
import Moya
//import Moya_ModelMapper
//import Mapper

public protocol ServiceDelegate: AnyObject {
    
}

public protocol ServiceDataSource: AnyObject {

}

public protocol ServiceProtocol {
    
    var delegate: ServiceDelegate? { get set }
    var dataSource: ServiceDataSource? { get set }
    
    var roumingPackages: RoumingPackagesServiceProtocol { get }
//    var hub: HubServiceProtocol { get }
//    var freeSMS: FreeSMSServiceProtocol { get }
//    var vas: VASServiceProtocol { get }
//    var story: StoryServiceProtocol { get }
    
    func cancelAll()
}

public class Service: ServiceProtocol {
    
    public enum Error: Swift.Error {
        case networkError
        case unauthorizedError
        case serializationError(internal: Swift.Error)
    }
    
    public weak var delegate: ServiceDelegate? {
        didSet {
            self.roumingPackages.delegate = self
//            self.hub.delegate = self
//            self.freeSMS.delegate = self
//            self.vas.delegate = self
//            self.story.delegate = self
        }
    }
    
    public weak var dataSource: ServiceDataSource? {
        didSet {
            self.roumingPackages.dataSource = self
//            self.hub.dataSource = self
//            self.freeSMS.dataSource = self
//            self.vas.dataSource = self
//            self.story.dataSource = self
        }
    }
    
    
    public var roumingPackages: RoumingPackagesServiceProtocol = RoumingPackagesService()
//
//   
//    public var hub: HubServiceProtocol = HubService()
//    
//    public var freeSMS: FreeSMSServiceProtocol = FreeSMSService()
//    public var vas: VASServiceProtocol = VASService()
//    public var story: StoryServiceProtocol = StoryService()
//    
    public init() { }
    
    public func cancelAll() {
        self.roumingPackages.cancelAll()
//        self.hub.cancelAll()
//        self.freeSMS.cancelAll()
//        self.vas.cancelAll()
//        self.story.cancelAll()
    }
}

// MARK: - BaseService Delegate and DataSource

extension Service: BaseServiceDelegate, BaseServiceDataSource {
    
}
