//
//  RoumingCountrySearchRouter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit

@objc protocol RoumingCountrySearchRoutingLogic {
    
    //func routeToSomewhere()
}

protocol RoumingCountrySearchDataPassing {
    var dataStore: RoumingCountrySearchDataStore? { get }
}

final class RoumingCountrySearchRouter: NSObject, RoumingCountrySearchRoutingLogic, RoumingCountrySearchDataPassing {
    
    weak var viewController: RoumingCountrySearchViewController?
    var dataStore: RoumingCountrySearchDataStore?
  
    
    // MARK: Routing

//    func routeToSomewhere() {
//        let destinationVC = SomewhereViewController()
//        SomewhereConfigurator.configure(destinationVC)
//
//        var destinationDS = destinationVC.router!.dataStore!
//        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//
//        navigateToSomewhere(source: viewController!, destination: destinationVC)
//    }

    
    // MARK: Navigation

//    func navigateToSomewhere(source: RoumingCountrySearchViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: RoumingCountrySearchDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
