//
//  RoumingSearchCountryInteractor.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

protocol RoumingSearchCountryBusinessLogic {
    
    func load(request: RoumingSearchCountry.Load.Request)
}

protocol RoumingSearchCountryDataStore {
    
    //var name: String { get set }
}

final class RoumingSearchCountryInteractor: RoumingSearchCountryBusinessLogic, RoumingSearchCountryDataStore {
    
    var presenter: RoumingSearchCountryPresentationLogic?
    lazy var worker: RoumingSearchCountryWorkingLogic = RoumingSearchCountryWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: RoumingSearchCountry.Load.Request) {
        let response = RoumingSearchCountry.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
