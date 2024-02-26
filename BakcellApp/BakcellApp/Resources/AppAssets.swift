//
//  AppAssets.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

public enum AppAssets: String, CaseIterable {
    
    case addIcon
    case map
    case search
    case whatsapp
    case back
    case internet
    case sms
    case phone
    
}

extension AppAssets {
    func load() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
