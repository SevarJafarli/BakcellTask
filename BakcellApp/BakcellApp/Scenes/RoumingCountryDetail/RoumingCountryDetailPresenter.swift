//
//  RoumingCountryDetailPresenter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

protocol RoumingCountryDetailPresentationLogic {
    
    func presentLoad(response: RoumingCountryDetail.Load.Response)
    func presentPackages(response: RoumingCountryDetail.FetchPackages.Response)
    func presentOperators(response: RoumingCountryDetail.FetchOperators.Response)
    func presentPriceComparison(response: RoumingCountryDetail.FetchPriceComparison.Response)
}

final class RoumingCountryDetailPresenter: RoumingCountryDetailPresentationLogic {
    
    weak var viewController: RoumingCountryDetailDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: RoumingCountryDetail.Load.Response) {
        let viewModel = RoumingCountryDetail.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
    
    func presentPackages(response: RoumingCountryDetail.FetchPackages.Response) {
        let viewModel = RoumingCountryDetail.FetchPackages.ViewModel(internetPackages: response.internetPackages, smsPackages: response.smsPackages)
        viewController?.displayPackages(viewModel: viewModel)
    }
    
    func presentOperators(response: RoumingCountryDetail.FetchOperators.Response) {
        let viewModel = RoumingCountryDetail.FetchOperators.ViewModel(operators: response.operators)
        viewController?.displayOperators(viewModel: viewModel)
    }
    
    func presentPriceComparison(response: RoumingCountryDetail.FetchPriceComparison.Response) {
        let viewModel = RoumingCountryDetail.FetchPriceComparison.ViewModel(services: response.services)
        viewController?.displayPriceComparison(viewModel: viewModel)
    }
}
