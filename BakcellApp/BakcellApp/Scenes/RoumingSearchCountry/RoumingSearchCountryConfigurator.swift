//
//  RoumingSearchCountryConfigurator.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

final class RoumingSearchCountryConfigurator {
    
    @discardableResult
    static func configure(_ viewController: RoumingSearchCountryViewController) -> RoumingSearchCountryViewController {
        let view = RoumingSearchCountryView()
        let interactor = RoumingSearchCountryInteractor()
        let presenter = RoumingSearchCountryPresenter()
        let router = RoumingSearchCountryRouter()
        
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
