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

final class RoumingDetailView: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    weak var delegate: RoumingDetailViewDelegate?
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = adaptiveColor(.greyBg)
        tableView.tableHeaderView = tableViewHeader

        tableView.register(InternetPackagesCollectionTableViewCell.self, forCellReuseIdentifier: InternetPackagesCollectionTableViewCell.reuseIdentifier)
        
        tableView.register(AllIncludedPackageViewCell.self, forCellReuseIdentifier: AllIncludedPackageViewCell.reuseIdentifier)
        
        tableView.register(SMSPackagesCollectionTableViewCell.self, forCellReuseIdentifier: SMSPackagesCollectionTableViewCell.reuseIdentifier)
        
        return tableView
    }()
    
  
    lazy var tableViewHeader: RoamingTableViewHeader = {
        let view = RoamingTableViewHeader(frame: .init(x: 0, y: 0, width: self.frame.width, height: 260))
        return view
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
    }
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.mainTableView)
        
        self.updateConstraints()
    }
}
