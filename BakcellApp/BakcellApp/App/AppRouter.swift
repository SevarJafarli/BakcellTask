//
//  AppRouter.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

final class AppRouter {
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        self.main()

    }

    func main() {
        let viewController = RoumingDetailViewController()
        let view = MainNavigation(rootViewController: RoumingDetailConfigurator.configure(viewController))
    
        self.window.rootViewController = view
        self.window.makeKeyAndVisible()
    }
}
