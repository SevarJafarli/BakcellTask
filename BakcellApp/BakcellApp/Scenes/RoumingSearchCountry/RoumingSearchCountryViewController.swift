//
//  RoumingSearchCountryViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

protocol RoumingSearchCountryDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: RoumingSearchCountry.Load.ViewModel)
}

final class RoumingSearchCountryViewController: UIViewController {
    
    var mainView: RoumingSearchCountryView?
    var interactor: RoumingSearchCountryBusinessLogic?
    var router: (RoumingSearchCountryRoutingLogic & RoumingSearchCountryDataPassing)?
  
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.load()
    }
  
    
    // MARK: - Public Methods
  
    func load() {
        let request = RoumingSearchCountry.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension RoumingSearchCountryViewController: RoumingSearchCountryDisplayLogic {
    
    func displayLoad(viewModel: RoumingSearchCountry.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension RoumingSearchCountryViewController: RoumingSearchCountryViewDelegate {
    
}
