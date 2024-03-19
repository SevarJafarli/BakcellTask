//
//  RoumingDetailPresenter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

protocol RoumingDetailPresentationLogic {
    
    func presentLoad(response: RoumingDetail.Load.Response)
  
    func presentRoumingPackages(response: RoumingDetail.FetchRoumingPackages.Response)
}

final class RoumingDetailPresenter: RoumingDetailPresentationLogic {
   
    weak var viewController: RoumingDetailDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: RoumingDetail.Load.Response) {
        let viewModel = RoumingDetail.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
    
    func presentRoumingPackages(response: RoumingDetail.FetchRoumingPackages.Response) {
        guard let responseModel = response.roumingPackagesResponse else { return }
        let viewModel = RoumingDetail.FetchRoumingPackages.ViewModel(model: responseModel.convertToModel())
        viewController?.displayRoumingPackages(viewModel: viewModel)
    }
    
}
