//
//  RoumingCountrySearchView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit

protocol RoumingCountrySearchViewDelegate: AnyObject {
    
}

final class RoumingCountrySearchView: UIView {
    
    weak var delegate: RoumingCountrySearchViewDelegate?
    
    lazy var countriesTableView: RoamingCountriesTableView = {
        let tableView = RoamingCountriesTableView()
        return tableView
    }()
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.countriesTableView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.countriesTableView)
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
}
