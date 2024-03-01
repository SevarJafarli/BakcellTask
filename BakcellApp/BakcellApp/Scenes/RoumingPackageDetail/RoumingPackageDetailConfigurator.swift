//
//  RoumingPackageDetailConfigurator.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

final class RoumingPackageDetailConfigurator {
    
    @discardableResult
    static func configure(_ viewController: RoumingPackageDetailViewController) -> RoumingPackageDetailViewController {
        let view = RoumingPackageDetailView()
        let interactor = RoumingPackageDetailInteractor()
        let presenter = RoumingPackageDetailPresenter()
        let router = RoumingPackageDetailRouter()
        
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
