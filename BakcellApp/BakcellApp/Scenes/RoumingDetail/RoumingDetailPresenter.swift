//
//  RoumingDetailPresenter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

protocol RoumingDetailPresentationLogic {
    
    func presentLoad(response: RoumingDetail.Load.Response)
    func presentAllIncludedPackages(response: RoumingDetail.FetchAllIncluded.Response)
    func presentInternetPackages(response: RoumingDetail.FetchInternetPackages.Response)
    func presentSMSPackages(response: RoumingDetail.FetchSMSPackages.Response)
}

final class RoumingDetailPresenter: RoumingDetailPresentationLogic {
   
    weak var viewController: RoumingDetailDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: RoumingDetail.Load.Response) {
        let viewModel = RoumingDetail.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
    
    func presentAllIncludedPackages(response: RoumingDetail.FetchAllIncluded.Response) {
        let viewModel = RoumingDetail.FetchAllIncluded.ViewModel(allIncludedPackageModels: response.allIncludedPackageModels)
        viewController?.displayAllIncludedPackages(viewModel: viewModel)
    }
    
    func presentInternetPackages(response: RoumingDetail.FetchInternetPackages.Response) {
        let viewModel = RoumingDetail.FetchInternetPackages.ViewModel(internetPackageModels: response.internetPackageModels)
        viewController?.displayInternetPackages(viewModel: viewModel)
    }
    
    func presentSMSPackages(response: RoumingDetail.FetchSMSPackages.Response) {
        let viewModel = RoumingDetail.FetchSMSPackages.ViewModel(smsPackageModels: response.smsPackageModels)
        viewController?.displaySMSPackages(viewModel: viewModel)
    }
    
}
