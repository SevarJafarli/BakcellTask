//
//  RoamingCountriesTableView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit

class RoamingCountriesTableView: UITableView {

    //MARK: Init
    
    init() {
        super.init(frame: .zero, style: .plain)
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.register(RoumingSearchCountryViewCell.self, forCellReuseIdentifier: RoumingSearchCountryViewCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
