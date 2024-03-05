//
//  RoamingCountryPackagesView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 05.03.24.
//

import UIKit

class RoamingCountryPackagesView: UIView {
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = adaptiveColor(.greyBg)
        
        tableView.register(InternetPackagesCollectionTableViewCell.self, forCellReuseIdentifier: InternetPackagesCollectionTableViewCell.reuseIdentifier)
        
        tableView.register(SMSPackagesCollectionTableViewCell.self, forCellReuseIdentifier: SMSPackagesCollectionTableViewCell.reuseIdentifier)
        
        return tableView
    }()

    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
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
