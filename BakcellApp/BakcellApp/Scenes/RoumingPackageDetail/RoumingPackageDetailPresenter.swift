//
//  RoumingPackageDetailPresenter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

protocol RoumingPackageDetailPresentationLogic {
    
    func presentLoad(response: RoumingPackageDetail.Load.Response)
}

final class RoumingPackageDetailPresenter: RoumingPackageDetailPresentationLogic {
    
    weak var viewController: RoumingPackageDetailDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: RoumingPackageDetail.Load.Response) {
        let viewModel = RoumingPackageDetail.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
