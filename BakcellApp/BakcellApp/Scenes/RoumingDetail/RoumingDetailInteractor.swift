//
//  RoumingDetailInteractor.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

protocol RoumingDetailBusinessLogic {
    
    func load(request: RoumingDetail.Load.Request)
    
    func getSelectedCountry(country: String)
    
    func loadRoumingPackages(request: RoumingDetail.FetchRoumingPackages.Request)
}

protocol RoumingDetailDataStore {
    
    //var name: String { get set }
    
    var country: String { get set }
}

final class RoumingDetailInteractor: RoumingDetailBusinessLogic, RoumingDetailDataStore {
    var country: String = ""
    
   
    
    var presenter: RoumingDetailPresentationLogic?
    lazy var worker: RoumingDetailWorkingLogic = RoumingDetailWorker()
  
    
    // MARK: Business Logic
  
    func load(request: RoumingDetail.Load.Request) {
        let response = RoumingDetail.Load.Response()
        presenter?.presentLoad(response: response)
    }
    
    
    func loadRoumingPackages(request: RoumingDetail.FetchRoumingPackages.Request) {
        worker.fetchRoumingPackages { [weak self] data in
            guard let self = self else { return }
            
            worker.fetchRoumingPackages { data in
                let response = RoumingDetail.FetchRoumingPackages.Response(roumingPackagesResponse: data)
                self.presenter?.presentRoumingPackages(response: response)
            }
          
        }
        
    }

    
    func getSelectedCountry(country: String) {
        self.country = country
    }
    
}
