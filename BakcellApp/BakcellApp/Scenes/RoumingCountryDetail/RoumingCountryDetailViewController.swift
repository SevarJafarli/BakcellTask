//
//  RoumingCountryDetailViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

protocol RoumingCountryDetailDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: RoumingCountryDetail.Load.ViewModel)
}

final class RoumingCountryDetailViewController: UIViewController {
    
    var mainView: RoumingCountryDetailView?
    var interactor: RoumingCountryDetailBusinessLogic?
    var router: (RoumingCountryDetailRoutingLogic & RoumingCountryDetailDataPassing)?
  
    var selectedCategoryIndex = 0
    // MARK: - Lifecycle Methods
    let contentViews: [UIView] = [
        UIView(),
        OperatorsView(),
        UIView()
    ]
   
    
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.title = router?.dataStore?.country
        
        self.mainView?.categoriesCollectionView.delegate = self
        self.mainView?.categoriesCollectionView.dataSource = self

        self.load()
    }
   

    // MARK: - Public Methods
  
    func load() {
        let request = RoumingCountryDetail.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension RoumingCountryDetailViewController: RoumingCountryDetailDisplayLogic {
    
    func displayLoad(viewModel: RoumingCountryDetail.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension RoumingCountryDetailViewController: RoumingCountryDetailViewDelegate {
    
}


//MARK: UICollectionView

extension RoumingCountryDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RoumingCountryDetail.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let title = RoumingCountryDetail.categories[indexPath.row]
        cell.data = title
        cell.isCategorySelected = (indexPath.item == self.selectedCategoryIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(self.selectedCategoryIndex)
        if self.selectedCategoryIndex != indexPath.item {
            self.selectedCategoryIndex = indexPath.item
            
            collectionView.reloadData()
        }
        print(self.selectedCategoryIndex)
    }
}
