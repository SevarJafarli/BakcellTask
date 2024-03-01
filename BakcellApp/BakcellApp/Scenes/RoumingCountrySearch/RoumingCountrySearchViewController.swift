//
//  RoumingCountrySearchViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit

protocol RoumingCountrySearchDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: RoumingCountrySearch.Load.ViewModel)
}

final class RoumingCountrySearchViewController: UIViewController {
    
    var mainView: RoumingCountrySearchView?
    var interactor: RoumingCountrySearchBusinessLogic?
    var router: (RoumingCountrySearchRoutingLogic & RoumingCountrySearchDataPassing)?
  
    var countries: [RoumingSearchCountryViewCellModel] = []
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
        mainView?.countriesTableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showBackButton = true
        self.title = "Dəstəklənən ölkələr"
        self.load()
    }
  
    
    // MARK: - Public Methods
  
    func load() {
        let request = RoumingCountrySearch.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension RoumingCountrySearchViewController: RoumingCountrySearchDisplayLogic {
    
    func displayLoad(viewModel: RoumingCountrySearch.Load.ViewModel) {
        
        self.countries = [
            .init(countryName: "Türkiyə", operators: ["Vodafone", "Türkcell", "Türkcell"], countryFlag: AppAssets.turkiye.load()),
            .init(countryName: "Rusiya", operators: ["Vodafone", "Türkcell", "Türkcell"], countryFlag: AppAssets.rusiya.load()),
            .init(countryName: "Rusiya", operators: ["Vodafone", "Türkcell", "Türkcell"], countryFlag: AppAssets.rusiya.load()),
            .init(countryName: "Rusiya", operators: ["Vodafone", "Türkcell", "Türkcell"], countryFlag: AppAssets.rusiya.load()),
            .init(countryName: "Rusiya", operators: ["Vodafone", "Türkcell", "Türkcell"], countryFlag: AppAssets.rusiya.load()),
            .init(countryName: "Gürcüstan", operators: ["Vodafone", "Beeline"], countryFlag: AppAssets.gurcustan.load()),
            .init(countryName: "Gürcüstan", operators: ["Vodafone", "Beeline"], countryFlag: AppAssets.gurcustan.load()),
            .init(countryName: "Gürcüstan", operators: ["Vodafone", "Beeline"], countryFlag: AppAssets.gurcustan.load()),
            .init(countryName: "Gürcüstan", operators: ["Vodafone", "Beeline"], countryFlag: AppAssets.gurcustan.load()),
            
        ]
    }
}

// MARK: - View Delegate

extension RoumingCountrySearchViewController: RoumingCountrySearchViewDelegate {
    
}


extension RoumingCountrySearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoumingSearchCountryViewCell.reuseIdentifier, for: indexPath) as? RoumingSearchCountryViewCell else {
            return UITableViewCell()
        }
        cell.data = self.countries[indexPath.row]
        return cell
    }
}
