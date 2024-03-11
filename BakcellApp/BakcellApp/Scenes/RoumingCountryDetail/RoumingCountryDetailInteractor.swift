//
//  RoumingCountryDetailInteractor.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

protocol RoumingCountryDetailBusinessLogic {
    
    func load(request: RoumingCountryDetail.Load.Request)
    func loadPackages(request: RoumingCountryDetail.FetchPackages.Request)
    func loadOperators(request: RoumingCountryDetail.FetchOperators.Request)
    func loadPriceComparison(request: RoumingCountryDetail.FetchPriceComparison.Request)
}

protocol RoumingCountryDetailDataStore {
    
    //var name: String { get set }
    var country: String { get set }
}

final class RoumingCountryDetailInteractor: RoumingCountryDetailBusinessLogic, RoumingCountryDetailDataStore {
    var country: String = ""
    
    
    var presenter: RoumingCountryDetailPresentationLogic?
    lazy var worker: RoumingCountryDetailWorkingLogic = RoumingCountryDetailWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: RoumingCountryDetail.Load.Request) {
        let response = RoumingCountryDetail.Load.Response()
        presenter?.presentLoad(response: response)
    }
    
    func loadPackages(request: RoumingCountryDetail.FetchPackages.Request) {
        worker.fetchPackages { internetPackages, smsPackages in
            let response = RoumingCountryDetail.FetchPackages.Response(internetPackages: internetPackages, smsPackages: smsPackages)
            presenter?.presentPackages(response: response)
        }
       
    }
    
    func loadOperators(request: RoumingCountryDetail.FetchOperators.Request) {
        worker.fetchOperators { operators in
            let response = RoumingCountryDetail.FetchOperators.Response(operators: operators)
            presenter?.presentOperators(response: response)
        }
       
    }
    
    func loadPriceComparison(request: RoumingCountryDetail.FetchPriceComparison.Request) {
        worker.fetchPriceComparison { services in
            let response = RoumingCountryDetail.FetchPriceComparison.Response(services: services)
            presenter?.presentPriceComparison(response: response)
        }
       
    }
}
