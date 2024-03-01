//
//  RoumingSearchCountryPresenter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

protocol RoumingSearchCountryPresentationLogic {
    
    func presentLoad(response: RoumingSearchCountry.Load.Response)
}

final class RoumingSearchCountryPresenter: RoumingSearchCountryPresentationLogic {
    
    weak var viewController: RoumingSearchCountryDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: RoumingSearchCountry.Load.Response) {
        let viewModel = RoumingSearchCountry.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
