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
    func displayAllIncludedPackages(viewModel: RoumingDetail.FetchAllIncluded.ViewModel)
    func displayInternetPackages(viewModel: RoumingDetail.FetchInternetPackages.ViewModel)
    func displaySMSPackages(viewModel: RoumingDetail.FetchSMSPackages.ViewModel)
}

final class RoumingDetailViewController: UIViewController, ThemeableViewController {
    var theme: ThemeProvider = App.theme
    
    
    var mainView: RoumingDetailView?
    var interactor: RoumingDetailBusinessLogic?
    var router: (RoumingDetailRoutingLogic & RoumingDetailDataPassing)?
    
    
    var allIncludedPackages = [AllIncludedPackageModel]()
    var internetPackages = [InternetPackageModel]()
    var smsPackages = [SMSPackageModel]()
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
    func loadAllIncludedPackages() {
        let request = RoumingDetail.FetchAllIncluded.Request()
        interactor?.loadAllIncludedPackages(request: request)
    }
    func loadInternetPackages() {
        let request = RoumingDetail.FetchInternetPackages.Request()
        interactor?.loadInternetPackages(request: request)
    }
    func loadSMSPackages() {
        let request = RoumingDetail.FetchSMSPackages.Request()
        interactor?.loadSMSPackages(request: request)
    }
}

// MARK: - Display Logic

extension RoumingDetailViewController: RoumingDetailDisplayLogic {
    func displayInternetPackages(viewModel: RoumingDetail.FetchInternetPackages.ViewModel) {
        self.internetPackages = viewModel.internetPackageModels
    }
    
    func displaySMSPackages(viewModel: RoumingDetail.FetchSMSPackages.ViewModel) {
        self.smsPackages = viewModel.smsPackageModels
      
    }
    
    func displayAllIncludedPackages(viewModel: RoumingDetail.FetchAllIncluded.ViewModel) {
        self.allIncludedPackages = viewModel.allIncludedPackageModels
       
    }
    
    func displayLoad(viewModel: RoumingDetail.Load.ViewModel) {
        self.loadInternetPackages()
        self.loadAllIncludedPackages()
        self.loadSMSPackages()
        
//        self.mainView?.mainTableView.reloadData()
    }
    
//    override func viewDidLayoutSubviews() {
//        
//        super.viewDidLayoutSubviews()
//        
//        if let thv = self.mainView?.mainTableView.tableHeaderView {
//            
//            var f = thv.frame
//            
//            let targetSize = CGSize(
//                width: self.mainView!.mainTableView.contentSize.width,
//                height: UIView.layoutFittingCompressedSize.height)
//            let fittingSize = thv.systemLayoutSizeFitting(
//                targetSize,
//                withHorizontalFittingPriority: .required,
//                verticalFittingPriority: .fittingSizeLevel)
//            f.size = fittingSize
//            
//            thv.frame = f
//            self.mainView!.mainTableView.tableHeaderView = thv
//        }
//    }
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
        case .internetPackages, .smsPackages:
            return 1
        case .allIncludedPackages:
            return self.allIncludedPackages.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = RoumingDetail.sections[indexPath.section]
        switch sectionType {
            
        case .internetPackages:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InternetPackagesCollectionTableViewCell.reuseIdentifier, for: indexPath) as? InternetPackagesCollectionTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: self.internetPackages)
            return cell
            
        case .allIncludedPackages:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AllIncludedPackageViewCell.reuseIdentifier, for: indexPath) as? AllIncludedPackageViewCell else {
                return UITableViewCell()
            }
            
            let model =  self.allIncludedPackages[ indexPath.row]
            cell.configure(with: model)
           
            return cell
            
        case .smsPackages:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SMSPackagesCollectionTableViewCell.reuseIdentifier, for: indexPath) as? SMSPackagesCollectionTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: self.smsPackages)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = adaptiveColor(.greyBg)
        let sectionLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        sectionLabel.font = AppFonts.SFBoldHeadline.fontStyle
        sectionLabel.textColor = adaptiveColor(.blackHigh)
        sectionLabel.text = RoumingDetail.sectionTitles[section]
        sectionLabel.sizeToFit()
        headerView.addSubview(sectionLabel)
        
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = RoumingDetail.sections[indexPath.section]
        
        switch sectionType {
        case .internetPackages:
            return 168
        case .allIncludedPackages:
            return 144
        case .smsPackages:
            return 136
        }
    }
}
