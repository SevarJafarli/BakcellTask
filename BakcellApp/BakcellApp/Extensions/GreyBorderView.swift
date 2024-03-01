//
//  GreyBorderView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit
import BakcellUIKit

extension UIView: ThemeableView {
    var theme: ThemeProvider {
        App.theme
    }
    
    func applyGreyBorders() {
        self.layer.borderColor  = adaptiveColor(.greyLight1).cgColor
        self.layer.borderWidth = 2
    }
}
