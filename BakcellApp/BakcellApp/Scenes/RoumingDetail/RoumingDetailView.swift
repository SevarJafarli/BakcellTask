//
//  RoumingDetailView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit
import BakcellUIKit
import SnapKit

protocol RoumingDetailViewDelegate: AnyObject {
    
}

final class RoumingDetailView: UIView {
    
    weak var delegate: RoumingDetailViewDelegate?
    
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = adaptiveColor(.greyBg)
        
        tableView.register(InternetPackagesCollectionTableViewCell.self, forCellReuseIdentifier: InternetPackagesCollectionTableViewCell.reuseIdentifier)
        
        tableView.register(AllIncludedPackageViewCell.self, forCellReuseIdentifier: AllIncludedPackageViewCell.reuseIdentifier)
        
        tableView.register(SMSPackagesCollectionTableViewCell.self, forCellReuseIdentifier: SMSPackagesCollectionTableViewCell.reuseIdentifier)
        
        return tableView
    }()

    private lazy var loadingIndicator: LoadingActivityIndicator = {
        let indicator = LoadingActivityIndicator()
        return indicator
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.mainTableView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.loadingIndicator.snp.updateConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.mainTableView)
        self.addSubview(self.loadingIndicator)
        self.updateConstraints()
    }
    
    public func startLoading() {
        self.loadingIndicator.startLoading()
    }
    public func stopLoading() {
        self.loadingIndicator.stopLoading {
            self.mainTableView.isHidden = false
            self.loadingIndicator.removeFromSuperview()
        }
      
    }
}
