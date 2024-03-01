//
//  RoumingDetailRouter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

@objc protocol RoumingDetailRoutingLogic {
    
    func routeToRoumingCountryDetail()
    func routeToRoumingPackageDetail()
}

protocol RoumingDetailDataPassing {
    var dataStore: RoumingDetailDataStore? { get }
}

final class RoumingDetailRouter: NSObject, RoumingDetailRoutingLogic, RoumingDetailDataPassing {
    
    weak var viewController: RoumingDetailViewController?
    var dataStore: RoumingDetailDataStore?
  
    
    // MARK: Routing

    func routeToRoumingCountryDetail() {
        let destinationVC = RoumingCountryDetailViewController()
        RoumingCountryDetailConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToRoumingCountryDetail(source: dataStore!, destination: &destinationDS)

        navigateToRoumingCountryDetail(source: viewController!, destination: destinationVC)
    }

    func routeToRoumingPackageDetail() {
        let destinationVC = RoumingPackageDetailViewController()
        RoumingPackageDetailConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToRoumingPackageDetail(source: dataStore!, destination: &destinationDS)

        navigateToRoumingPackageDetail(source: viewController!, destination: destinationVC)
    }

    
    // MARK: Navigation

    func navigateToRoumingCountryDetail(source: RoumingDetailViewController, destination: RoumingCountryDetailViewController) {
        source.show(destination, sender: nil)
    }
    
    func navigateToRoumingPackageDetail(source: RoumingDetailViewController, destination: RoumingPackageDetailViewController) {
        source.show(destination, sender: nil)
    }

    
    // MARK: Passing data

    func passDataToRoumingCountryDetail(source: RoumingDetailDataStore, destination: inout RoumingCountryDetailDataStore) {
        destination.country = source.country
    }
    
    func passDataToRoumingPackageDetail(source: RoumingDetailDataStore, destination: inout RoumingPackageDetailDataStore) {
    
    }
}
