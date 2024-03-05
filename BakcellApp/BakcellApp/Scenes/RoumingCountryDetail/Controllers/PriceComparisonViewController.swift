//
//  PriceComparisonViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 04.03.24.
//

import UIKit
import BakcellUIKit

class PriceComparisonViewController: UIViewController, ThemeableViewController {
    
    var theme: ThemeProvider = App.theme
    
    private lazy var mainView: PriceComparisonView = {
        let view = PriceComparisonView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        
    }
}
