//
//  RoumingDetailInteractor.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

protocol RoumingDetailBusinessLogic {
    
    func load(request: RoumingDetail.Load.Request)
    
    func loadAllIncludedPackages(request: RoumingDetail.FetchAllIncluded.Request)
    
    func loadSMSPackages(request: RoumingDetail.FetchSMSPackages.Request)
    
    func loadInternetPackages(request: RoumingDetail.FetchInternetPackages.Request)
}

protocol RoumingDetailDataStore {
    
    //var name: String { get set }
}

final class RoumingDetailInteractor: RoumingDetailBusinessLogic, RoumingDetailDataStore {
   
    
    var presenter: RoumingDetailPresentationLogic?
    lazy var worker: RoumingDetailWorkingLogic = RoumingDetailWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: RoumingDetail.Load.Request) {
        let response = RoumingDetail.Load.Response()
        presenter?.presentLoad(response: response)
    }
    
    
    func loadAllIncludedPackages(request: RoumingDetail.FetchAllIncluded.Request) {
        worker.fetchAllIncludedPackages { [weak self] data in
            guard let self = self else { return }
            
            let response = RoumingDetail.FetchAllIncluded.Response(allIncludedPackageModels: data)
            self.presenter?.presentAllIncludedPackages(response: response)
        }
        
    }
    
    func loadInternetPackages(request: RoumingDetail.FetchInternetPackages.Request) {
        worker.fetchInternetPackages { [weak self] data in
            guard let self = self else { return }
            
            let response = RoumingDetail.FetchInternetPackages.Response(internetPackageModels: data)
            self.presenter?.presentInternetPackages(response: response)
        }
        
    }
    
    func loadSMSPackages(request: RoumingDetail.FetchSMSPackages.Request) {
        worker.fetchSMSPackages { [weak self] data in
            guard let self = self else { return }
            
            let response = RoumingDetail.FetchSMSPackages.Response(smsPackageModels: data)
            self.presenter?.presentSMSPackages(response: response)
        }
        
    }
    
}
