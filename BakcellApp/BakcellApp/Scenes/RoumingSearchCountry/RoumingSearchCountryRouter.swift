//
//  RoumingSearchCountryRouter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

@objc protocol RoumingSearchCountryRoutingLogic {
    
    //func routeToSomewhere()
}

protocol RoumingSearchCountryDataPassing {
    var dataStore: RoumingSearchCountryDataStore? { get }
}

final class RoumingSearchCountryRouter: NSObject, RoumingSearchCountryRoutingLogic, RoumingSearchCountryDataPassing {
    
    weak var viewController: RoumingSearchCountryViewController?
    var dataStore: RoumingSearchCountryDataStore?
  
    
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

//    func navigateToSomewhere(source: RoumingSearchCountryViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: RoumingSearchCountryDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
