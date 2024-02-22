//
//  RoumingDetailWorker.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

protocol RoumingDetailWorkingLogic {
    func fetchAllIncludedPackages(_ completion: @escaping ([AllIncludedPackageModel]) -> Void)
    
    func fetchInternetPackages(_ completion: @escaping ([InternetPackageModel]) -> Void)
    
    func fetchSMSPackages(_ completion: @escaping ([SMSPackageModel]) -> Void)
}

final class RoumingDetailWorker: RoumingDetailWorkingLogic {
    
    func fetchAllIncludedPackages(_ completion: @escaping ([AllIncludedPackageModel]) -> Void) {
        let models = [
            AllIncludedPackageModel(title: "Aylıq hamısı daxil", internetPackage: .init(packageAmount: 1000, amountType: "MB", packageType: "Internet"), callPackage: .init(packageAmount: 100, amountType: "dəq.",  packageType: "Zeng"), smsPackage: .init(packageAmount: 100, amountType: "",  packageType: "SMS"), packagePrice: 30.00, packageTimeRange: "Ay", packageModelType: .allIncluded),
            
            AllIncludedPackageModel(title: "Həftəlik hamısı daxil", internetPackage: .init(packageAmount: 500, amountType: "MB",  packageType: "Internet"), callPackage: .init(packageAmount: 50, amountType: "dəq.",  packageType: "Zeng"), smsPackage: .init(packageAmount: 50, amountType: "",  packageType: "SMS"), packagePrice: 20, packageTimeRange: "Hefte", packageModelType: .allIncluded),
            
            AllIncludedPackageModel(title: "Gündəlik hamısı daxil", internetPackage: .init(packageAmount: 100, amountType: "MB",  packageType: "Internet"), callPackage: .init(packageAmount: 10, amountType: "dəq.",  packageType: "Zeng"), smsPackage: .init(packageAmount: 10, amountType: "",  packageType: "SMS"), packagePrice: 5.00, packageTimeRange: "Gun", packageModelType: .allIncluded)
        ]
        
        completion(models)
    }
    
    func fetchInternetPackages(_ completion: @escaping ([InternetPackageModel]) -> Void) {
        let models = Array(repeating: InternetPackageModel(packagePrice: 3.00, packageTimeRange: "Gun", packageModelType: .internet, isWhatsappFree: true, package: .init(packageAmount: 100, amountType: "MB")), count: 3)
        
        completion(models)
    }
    
    func fetchSMSPackages(_ completion: @escaping ([SMSPackageModel]) -> Void) {
        let models = Array(repeating: SMSPackageModel(packagePrice: 40.00, packageTimeRange: "Ay", packageModelType: .smsAndCall, package: .init(packageAmount: 100, amountType: "dəq")), count: 3)
        
        completion(models)
    }
}
