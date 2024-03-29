//
//  RoumingCountryDetailRouter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

@objc protocol RoumingCountryDetailRoutingLogic {
    
    //func routeToSomewhere()
    func routeToPackageDetail()
}

protocol RoumingCountryDetailDataPassing {
    var dataStore: RoumingCountryDetailDataStore? { get }
}

final class RoumingCountryDetailRouter: NSObject, RoumingCountryDetailRoutingLogic, RoumingCountryDetailDataPassing {
    
    weak var viewController: RoumingCountryDetailViewController?
    var dataStore: RoumingCountryDetailDataStore?
  
    
    // MARK: Routing

    func routeToPackageDetail() {
        let destinationVC = RoumingPackageDetailViewController()
        RoumingPackageDetailConfigurator.configure(destinationVC)

        navigateToPackageDetail(source: viewController!, destination: destinationVC)
    }

    
    // MARK: Navigation

    func navigateToPackageDetail(source: RoumingCountryDetailViewController, destination: RoumingPackageDetailViewController) {
        source.show(destination, sender: nil)
    }

    
    // MARK: Passing data

//    func passDataToPackageDetail(source: RoumingCountryDetailDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
