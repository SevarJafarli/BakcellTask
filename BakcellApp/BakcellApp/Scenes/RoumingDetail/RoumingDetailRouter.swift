//
//  RoumingDetailRouter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

@objc protocol RoumingDetailRoutingLogic {
    
    //func routeToSomewhere()
}

protocol RoumingDetailDataPassing {
    var dataStore: RoumingDetailDataStore? { get }
}

final class RoumingDetailRouter: NSObject, RoumingDetailRoutingLogic, RoumingDetailDataPassing {
    
    weak var viewController: RoumingDetailViewController?
    var dataStore: RoumingDetailDataStore?
  
    
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

//    func navigateToSomewhere(source: RoumingDetailViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: RoumingDetailDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
