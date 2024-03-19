//
//  RoumingCountryDetailViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit
import BakcellUIKit
import SnapKit

protocol RoumingCountryDetailDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: RoumingCountryDetail.Load.ViewModel)
    func displayPackages(viewModel: RoumingCountryDetail.FetchPackages.ViewModel)
    func displayOperators(viewModel: RoumingCountryDetail.FetchOperators.ViewModel)
    func displayPriceComparison(viewModel: RoumingCountryDetail.FetchPriceComparison.ViewModel)
    
    func sendDataToInternetPackages(internetPackages: [InternetPackagesItemModel])
    func sendDataToSMSPackages(smsPackages: [SMSCallPackagesItemModel])
    func sendDataToOperators(operators: [OperatorModel])
    func sendDataToPriceComparison(services: [OperatorServicePriceModel])
}

final class RoumingCountryDetailViewController: UIViewController, ThemeableViewController {
    
    var theme: ThemeProvider = App.theme
    
    var mainView: RoumingCountryDetailView?
    var interactor: RoumingCountryDetailBusinessLogic?
    var router: (RoumingCountryDetailRoutingLogic & RoumingCountryDetailDataPassing)?
    
    var selectedFilterIndex = 0
    
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        mainView?.delegate = self
        
        self.setupPageViewController()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.title = router?.dataStore?.country
        self.load()
    }
    
    
    // MARK: - Public Methods
    
    func load() {
        let request = RoumingCountryDetail.Load.Request()
        interactor?.load(request: request)
    }
    
    func loadPackages() {
        let request = RoumingCountryDetail.FetchPackages.Request()
        interactor?.loadPackages(request: request)
        
    }
    
    func loadOperators() {
        let request = RoumingCountryDetail.FetchOperators.Request()
        interactor?.loadOperators(request: request)
        
    }
    
    func loadPriceComparison() {
        let request = RoumingCountryDetail.FetchPriceComparison.Request()
        interactor?.loadPriceComparison(request: request)
        
    }
    
    private func setupPageViewController() {
        self.addChild(self.mainView!.pageViewController)
        
        self.mainView!.pageViewController.didMove(toParent: self)
    }
    
}

// MARK: - Display Logic

extension RoumingCountryDetailViewController: RoumingCountryDetailDisplayLogic {
    
    func sendDataToInternetPackages(internetPackages: [InternetPackagesItemModel]) {
        if let vc = self.mainView?.packagesViewController {
            vc.receiveInternetPackages(data: internetPackages)
        }
    }
    
    func sendDataToSMSPackages(smsPackages: [SMSCallPackagesItemModel]) {
        if let vc = self.mainView?.packagesViewController {
            vc.receiveSMSPackages(data: smsPackages)
        }
    }
    func sendDataToOperators(operators: [OperatorModel]) {
        if let vc = self.mainView?.operatorsViewController {
            vc.receiveOperators(data: operators)
        }
    }
    
    func sendDataToPriceComparison(services: [OperatorServicePriceModel]) {
        if let vc = self.mainView?.priceComparisonViewController {
            vc.receivePriceComparison(data: services)
        }
    }
    
    func displayPackages(viewModel: RoumingCountryDetail.FetchPackages.ViewModel) {
        self.sendDataToInternetPackages(internetPackages: viewModel.internetPackages)
        self.sendDataToSMSPackages(smsPackages: viewModel.smsPackages)
    }
    
    func displayOperators(viewModel: RoumingCountryDetail.FetchOperators.ViewModel) {
        self.sendDataToOperators(operators: viewModel.operators)
    }
    
    func displayPriceComparison(viewModel: RoumingCountryDetail.FetchPriceComparison.ViewModel) {
        self.sendDataToPriceComparison(services: viewModel.services)
    }
    
    
    func displayLoad(viewModel: RoumingCountryDetail.Load.ViewModel) {
        self.loadPackages()
        self.loadOperators()
        self.loadPriceComparison()
    }
}

// MARK: - View Delegate

extension RoumingCountryDetailViewController: RoumingCountryDetailViewDelegate {
    
    func onPackageSelected() {
        router?.routeToPackageDetail()
    }
}
