//
//  RoumingDetailViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit
import BakcellUIKit

protocol RoumingDetailDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: RoumingDetail.Load.ViewModel)
    func displayRoumingPackages(viewModel: RoumingDetail.FetchRoumingPackages.ViewModel)
    
}

final class RoumingDetailViewController: UIViewController, ThemeableViewController {
    var theme: ThemeProvider = App.theme
    
    var mainView: RoumingDetailView?
    var interactor: RoumingDetailBusinessLogic?
    var router: (RoumingDetailRoutingLogic & RoumingDetailDataPassing)?
    
    
    var allIncludedPackages: AllPackagesModel? = nil
    var internetPackages: InternetPackagesModel? = nil
    var smsPackages: SMSCallPackagesModel? = nil
    var countries = [String: String]()
    
    private lazy var roumingHeaderView: RoumingCountryHeaderView = {
        let view = RoumingCountryHeaderView()
        view.delegate = self
        return view
    }()
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.title = "Rominq"
        self.mainView?.mainTableView.delegate = self
        self.mainView?.mainTableView.dataSource = self
        
        self.load()
    }
    
    
    // MARK: - Public Methods
    
    func load() {
        let request = RoumingDetail.Load.Request()
        interactor?.load(request: request)
    }
    func loadRoumingPackages() {
        self.mainView?.startLoading()
        let request = RoumingDetail.FetchRoumingPackages.Request()
        interactor?.loadRoumingPackages(request: request)
    }
}

// MARK: - Display Logic

extension RoumingDetailViewController: RoumingDetailDisplayLogic {
    func displayRoumingPackages(viewModel: RoumingDetail.FetchRoumingPackages.ViewModel) {
        self.countries = viewModel.model.countries
        self.roumingHeaderView.items = self.countries
        
        self.allIncludedPackages = viewModel.model.allPackages
        
        self.internetPackages = viewModel.model.internetPackages
        self.smsPackages = viewModel.model.smsCallPackages
        
        self.mainView?.mainTableView.reloadData()
        
        self.mainView?.stopLoading()
    }

    
    func displayLoad(viewModel: RoumingDetail.Load.ViewModel) {
        self.loadRoumingPackages()
    }
}

// MARK: - View Delegate

extension RoumingDetailViewController: RoumingDetailViewDelegate {
    
}


//MARK:  TableView

extension RoumingDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return RoumingDetail.sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = RoumingDetail.sections[section]
        switch sectionType {
        case .roumingCountryHeader:
            return 0
        case .internetPackages, .smsPackages:
            return 1
        case .allIncludedPackages:
            return self.allIncludedPackages?.items.count ?? 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = RoumingDetail.sections[indexPath.section]
        
        switch sectionType {
        case .roumingCountryHeader:
            return UITableViewCell.init()
            
        case .internetPackages:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InternetPackagesCollectionTableViewCell.reuseIdentifier, for: indexPath) as? InternetPackagesCollectionTableViewCell else {
                return UITableViewCell()
            }
           
            if let items = self.internetPackages?.items {
                cell.configure(with: items)
                cell.delegate = self
            }
       
            return cell
            
        case .allIncludedPackages:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AllIncludedPackageViewCell.reuseIdentifier, for: indexPath) as? AllIncludedPackageViewCell else {
                return UITableViewCell()
            }
            
            let model = self.allIncludedPackages?.items[indexPath.row]
            cell.data = model
        
            return cell
            
        case .smsPackages:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SMSPackagesCollectionTableViewCell.reuseIdentifier, for: indexPath) as? SMSPackagesCollectionTableViewCell else {
                return UITableViewCell()
            }
            if let items = self.smsPackages?.items {
                cell.configure(with: items)
            }
            
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = RoumingDetail.sections[section]
        
        switch sectionType {
        case .roumingCountryHeader:
            return self.roumingHeaderView
        default:
            return SectionHeaderView(title: RoumingDetail.sectionTitles[section])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

extension RoumingDetailViewController: RoumingCountryHeaderViewDelegate {
    func didSelectCountry(country: String) {
        interactor?.getSelectedCountry(country: country)
        router?.routeToRoumingCountryDetail()
    }
}


extension RoumingDetailViewController: InternetPackagesCollectionTableViewCellDelegate {
    
    func onPackageSelected() {
        router?.routeToRoumingPackageDetail()
    }
}
