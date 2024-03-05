//
//  OperatorsViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 04.03.24.
//

import UIKit
import BakcellUIKit

class OperatorsViewController: UIViewController, ThemeableViewController {
    
    var theme: ThemeProvider = App.theme
    private lazy var mainView: OperatorsView = {
        let view = OperatorsView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }
}
