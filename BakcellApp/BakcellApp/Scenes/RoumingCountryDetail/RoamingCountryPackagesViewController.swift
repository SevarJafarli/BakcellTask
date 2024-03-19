//
//  RoamingCountryPackagesViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 05.03.24.
//

import UIKit
protocol RoamingCountryPackagesViewControllerDelegate: AnyObject {
    func onPackageSelected()
}

enum  RoamingCountryPackages: CaseIterable {
    case internetPackages
    case smsPackages
    
    var title: String {
        switch self {
        case .internetPackages:
            "Internet paketleri"
        case .smsPackages:
            "SMS ve zeng paketleri"
        }
    }
}

class RoamingCountryPackagesViewController: UIViewController {

    var internetPackages: [InternetPackagesItemModel]?
    var smsPackages: [SMSCallPackagesItemModel]?
    
//    var smsPackages = Array(repeating: SMSPackageModel(packagePrice: 40.00, packageTimeRange: "Ay", packageModelType: .smsAndCall, package: .init(packageAmount: 100, amountType: "dəq")), count: 3)
//    
    
    weak var delegate: RoamingCountryPackagesViewControllerDelegate?
    
    private lazy var mainView: RoamingCountryPackagesView = {
        let view = RoamingCountryPackagesView()
        
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        mainView.mainTableView.delegate = self
        mainView.mainTableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func receiveInternetPackages(data: [InternetPackagesItemModel]) {
        self.internetPackages = data
    }
    func receiveSMSPackages(data: [SMSCallPackagesItemModel]) {
        self.smsPackages = data
    }
}

extension RoamingCountryPackagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return RoamingCountryPackages.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = RoamingCountryPackages.allCases[indexPath.section]
        switch section {
        case .internetPackages:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InternetPackagesCollectionTableViewCell.reuseIdentifier, for: indexPath) as? InternetPackagesCollectionTableViewCell else {
                return UITableViewCell()
            }
            
            guard let internetPackages = self.internetPackages else {  return UITableViewCell() }
            cell.configure(with: internetPackages)
            cell.delegate = self
            return cell
            
            
        case .smsPackages:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SMSPackagesCollectionTableViewCell.reuseIdentifier, for: indexPath) as? SMSPackagesCollectionTableViewCell else {
                return UITableViewCell()
            }
            guard let smsPackages = self.smsPackages else {  return UITableViewCell() }
            cell.configure(with: smsPackages)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = RoamingCountryPackages.allCases[section]
        return  SectionHeaderView(title:sectionType.title)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension RoamingCountryPackagesViewController: InternetPackagesCollectionTableViewCellDelegate {
    func onPackageSelected() {
        delegate?.onPackageSelected()
    }
}
