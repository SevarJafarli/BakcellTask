//
//  Colors.swift
//  BakcellUIKit
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

public enum ColorStyle: String, CaseIterable {
    
    case redPrimary
    case blackHigh
    case blackMedium
    case blackLow
    case greyBg
    case greyInput
    case greyLight
    case greyLight1
    case greyText
    case appWhite
    case greyStrokeSoft
    case greyTextHelper
}

extension ColorStyle {
    func load() -> UIColor? {
        if #available(iOS 13.0, *) {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: .current)
        } else {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: nil)
        }
    }
}

