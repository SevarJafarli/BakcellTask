//
//  RoumingDetailWorker.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit
import BakcellNetworkKit

protocol RoumingDetailWorkingLogic {
    
    func fetchRoumingPackages(_ completion: @escaping (RoumingPackagesResponse?) -> Void)
}


final class RoumingDetailWorker: RoumingDetailWorkingLogic {
    
    //MARK: Private
    
    private let service = App.service
    
    func fetchRoumingPackages(_ completion: @escaping (RoumingPackagesResponse?) -> Void) {
        service.roumingPackages.getRoumingPackages { result in
            switch result {
            case .success(let data):
                completion(data)
            default:
                completion(nil)
            }
        }
    }
}
