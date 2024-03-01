//
//  RoumingCountrySearchConfigurator.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit

final class RoumingCountrySearchConfigurator {
    
    @discardableResult
    static func configure(_ viewController: RoumingCountrySearchViewController) -> RoumingCountrySearchViewController {
        let view = RoumingCountrySearchView()
        let interactor = RoumingCountrySearchInteractor()
        let presenter = RoumingCountrySearchPresenter()
        let router = RoumingCountrySearchRouter()
        
        viewController.mainView = view
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
