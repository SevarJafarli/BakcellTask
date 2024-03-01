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
}

// MARK: - Display Logic

extension RoumingPackageDetailViewController: RoumingPackageDetailDisplayLogic {
    
    func displayLoad(viewModel: RoumingPackageDetail.Load.ViewModel) {
        //nameTextField.text = viewModel.name
        
        mainView?.data = .init(packageType: "Günlük", packageAmount: 100, packageAmountType: "MB", infoModels: [
            .init(modelType: .internet, amount: "100", amountType: "MB"),
            .init(modelType: .freeServices, amount: "Pulsuz", amountType: nil),
            .init(modelType: .duration, amount: "1", amountType: "gün"),
            .init(modelType: .price, amount: "3.00", amountType: "₼"),
            
        ],
        moreInfos: [
            .init(title: "Ətraflı məlumat", 
                  subtitle: [
                        "Pulsuz WhatsApp zəng və mesajlar üçündür.",
                         "Digər WhatsApp funksiyalarından istifadə edildikdə, xidmət haqqı paketsiz rouminq qiymətləri ilə hesablanacaq."
                                ], subtitleColor: nil),
                                .init(title: "Qeyd", subtitle: [
                                    "İnternetin tarifikasiyası – 100 KB.",
                                    "Paket hər gecə saat 00:00-da avtomatik olaraq yenilənir.",
                                   "Təqdim edilən paket bitdikdən sonra paketsiz rouminq qiymətləri tətbiq edilir və balansınızda olan vəsaitdən çıxılacaq.",
                                
                                ],  subtitleColor: adaptiveColor(.blackLow)),
                               ]
        )
    }
}

// MARK: - View Delegate

extension RoumingPackageDetailViewController: RoumingPackageDetailViewDelegate {
    func onCheckCountryBtnTapped() {
        router?.routeToCountrySearch()
    }
}
