//
//  RoumingPackageDetailViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit
import BakcellUIKit

protocol RoumingPackageDetailDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: RoumingPackageDetail.Load.ViewModel)
    
    func displayPackageInfo(viewModel: RoumingPackageDetail.FetchPackageInfo.ViewModel)
}

final class RoumingPackageDetailViewController: UIViewController, ThemeableViewController {
    var theme: ThemeProvider = App.theme
    
    var mainView: RoumingPackageDetailView?
    var interactor: RoumingPackageDetailBusinessLogic?
    var router: (RoumingPackageDetailRoutingLogic & RoumingPackageDetailDataPassing)?
    
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.title = "Paketin təsviri"
        self.load()
    }

    // MARK: - Public Methods
    
    func load() {
        let request = RoumingPackageDetail.Load.Request()
        interactor?.load(request: request)
    }
    
    func loadPackageInfo() {
        let request = RoumingPackageDetail.FetchPackageInfo.Request()
        interactor?.loadPackageInfo(request: request)
    }
}

// MARK: - Display Logic

extension RoumingPackageDetailViewController: RoumingPackageDetailDisplayLogic {
    
    func displayLoad(viewModel: RoumingPackageDetail.Load.ViewModel) {
        self.loadPackageInfo()
    }
    
    func displayPackageInfo(viewModel: RoumingPackageDetail.FetchPackageInfo.ViewModel) {
        self.mainView?.data = viewModel.package
    }
}

// MARK: - View Delegate

extension RoumingPackageDetailViewController: RoumingPackageDetailViewDelegate {
    func onCheckCountryBtnTapped() {
        router?.routeToCountrySearch()
    }
}
