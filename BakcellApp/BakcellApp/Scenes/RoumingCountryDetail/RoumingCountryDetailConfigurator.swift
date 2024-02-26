//
//  RoumingCountryDetailConfigurator.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

final class RoumingCountryDetailConfigurator {
    
    @discardableResult
    static func configure(_ viewController: RoumingCountryDetailViewController) -> RoumingCountryDetailViewController {
        let view = RoumingCountryDetailView()
        let interactor = RoumingCountryDetailInteractor()
        let presenter = RoumingCountryDetailPresenter()
        let router = RoumingCountryDetailRouter()
        
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
