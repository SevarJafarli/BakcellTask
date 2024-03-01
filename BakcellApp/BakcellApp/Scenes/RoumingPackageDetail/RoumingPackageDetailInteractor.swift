//
//  RoumingPackageDetailInteractor.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

protocol RoumingPackageDetailBusinessLogic {
    
    func load(request: RoumingPackageDetail.Load.Request)
}

protocol RoumingPackageDetailDataStore {
    
    //var name: String { get set }
}

final class RoumingPackageDetailInteractor: RoumingPackageDetailBusinessLogic, RoumingPackageDetailDataStore {
    
    var presenter: RoumingPackageDetailPresentationLogic?
    lazy var worker: RoumingPackageDetailWorkingLogic = RoumingPackageDetailWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: RoumingPackageDetail.Load.Request) {
        let response = RoumingPackageDetail.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
