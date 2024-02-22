//
//  RoumingDetailConfigurator.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

final class RoumingDetailConfigurator {
    
    @discardableResult
    static func configure(_ viewController: RoumingDetailViewController) -> RoumingDetailViewController {
        let view = RoumingDetailView()
        let interactor = RoumingDetailInteractor()
        let presenter = RoumingDetailPresenter()
        let router = RoumingDetailRouter()
        
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
