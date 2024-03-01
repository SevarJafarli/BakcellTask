//
//  RoumingPackageDetailRouter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

@objc protocol RoumingPackageDetailRoutingLogic {
    
    func routeToCountrySearch()
}

protocol RoumingPackageDetailDataPassing {
    var dataStore: RoumingPackageDetailDataStore? { get }
}

final class RoumingPackageDetailRouter: NSObject, RoumingPackageDetailRoutingLogic, RoumingPackageDetailDataPassing {
  
    
    weak var viewController: RoumingPackageDetailViewController?
    var dataStore: RoumingPackageDetailDataStore?
  
    
    // MARK: Routing
    
    func routeToCountrySearch() {
        let destinationVC = RoumingCountrySearchViewController()
        RoumingCountrySearchConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToCountrySearch(source: dataStore!, destination: &destinationDS)

        navigateToCountrySearch(source: viewController!, destination: destinationVC)
    }

    
    // MARK: Navigation

    func navigateToCountrySearch(source: RoumingPackageDetailViewController, destination: RoumingCountrySearchViewController) {
        source.show(destination, sender: nil)
    }

    
    // MARK: Passing data

    func passDataToCountrySearch(source: RoumingPackageDetailDataStore, destination: inout RoumingCountrySearchDataStore) {
    
    }
}
