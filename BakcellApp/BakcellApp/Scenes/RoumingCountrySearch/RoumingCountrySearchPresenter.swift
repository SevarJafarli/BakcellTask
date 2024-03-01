//
//  RoumingCountrySearchPresenter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit

protocol RoumingCountrySearchPresentationLogic {
    
    func presentLoad(response: RoumingCountrySearch.Load.Response)
}

final class RoumingCountrySearchPresenter: RoumingCountrySearchPresentationLogic {
    
    weak var viewController: RoumingCountrySearchDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: RoumingCountrySearch.Load.Response) {
        let viewModel = RoumingCountrySearch.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
