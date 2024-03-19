//
//  AppContainer.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import BakcellUIKit
import BakcellNetworkKit

let App = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let theme = AppTheme()
    let service = Service()
}
