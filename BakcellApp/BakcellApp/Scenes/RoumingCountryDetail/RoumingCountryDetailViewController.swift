//
//  RoumingCountryDetailViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit
import BakcellUIKit

protocol RoumingCountryDetailDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: RoumingCountryDetail.Load.ViewModel)
}

final class RoumingCountryDetailViewController: UIViewController, ThemeableViewController {
    var theme: ThemeProvider = App.theme
    
    var mainView: RoumingCountryDetailView?
    var interactor: RoumingCountryDetailBusinessLogic?
    var router: (RoumingCountryDetailRoutingLogic & RoumingCountryDetailDataPassing)?
    
    var selectedIndex = 0
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
        self.setSegmentedControl()
        self.mainView?.roamingSegmentedControl.delegate = self
        self.mainView?.filterSegmentedControl.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.title = router?.dataStore?.country
        
        self.load()
    }
    
    func setSegmentedControl() {
        let titleStrings = RoumingCountryDetail.categories
        let titles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] = [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.blackHigh)]
            var titles = [NSAttributedString]()
            for titleString in titleStrings {
                let title = NSAttributedString(string: titleString, attributes: attributes)
                titles.append(title)
            }
            return titles
        }()
        
        let selectedTitles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] =  [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.appWhite)]
            var selectedTitles = [NSAttributedString]()
            for titleString in titleStrings {
                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
                selectedTitles.append(selectedTitle)
            }
            return selectedTitles
        }()
        
        self.mainView?.filterSegmentedControl.setTitles(titles, selectedTitles: selectedTitles)
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

extension RoumingCountryDetailViewController: SegmentedControlDelegate {
    
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) {
        if segmentedControl == self.mainView?.roamingSegmentedControl {
            
        }
        else if segmentedControl == self.mainView?.filterSegmentedControl {
            self.selectedIndex = selectedIndex
            
            switch self.selectedIndex {
            case 0 :
                self.mainView?.contentTableView.isHidden = true
            case 1 :
                self.mainView?.contentTableView.isHidden = false
               
            case 2 :
                self.mainView?.contentTableView.isHidden = true
            default:
          
                self.mainView?.contentTableView.isHidden = true
               
            }
        }
    }
}
