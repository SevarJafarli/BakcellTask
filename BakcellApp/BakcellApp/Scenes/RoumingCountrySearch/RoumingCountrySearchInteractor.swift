//
//  RoumingCountrySearchInteractor.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit

protocol RoumingCountrySearchBusinessLogic {
    
    func load(request: RoumingCountrySearch.Load.Request)
}

protocol RoumingCountrySearchDataStore {
    
    //var name: String { get set }
}

final class RoumingCountrySearchInteractor: RoumingCountrySearchBusinessLogic, RoumingCountrySearchDataStore {
    
    var presenter: RoumingCountrySearchPresentationLogic?
    lazy var worker: RoumingCountrySearchWorkingLogic = RoumingCountrySearchWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: RoumingCountrySearch.Load.Request) {
        let response = RoumingCountrySearch.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
