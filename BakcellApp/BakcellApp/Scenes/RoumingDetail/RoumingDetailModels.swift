//
//  RoumingDetailModels.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

enum RoumingDetail {
    static var sections: [RoumingDetailViewModel] {
        return RoumingDetailViewModel.allCases
    }
    static var sectionCount: Int {
        return sections.count
    }
    static var sectionTitles: [String] {
        return RoumingDetailViewModel.allCases.map { $0.rawValue }
    }
    
    
    // MARK: Use cases
    
    enum Load {
        
        struct Request { }
        
        struct Response { }
        
        struct ViewModel { }
    }
    enum FetchAllIncluded {
        struct Request { }
        
        struct Response {
            let allIncludedPackageModels: [AllIncludedPackageModel]
        }
        
        struct ViewModel {
            let allIncludedPackageModels: [AllIncludedPackageModel]
        }
    }
    
    enum FetchInternetPackages {
        struct Request { }
        
        struct Response {
            let internetPackageModels: [InternetPackageModel]
        }
        
        struct ViewModel {
            let internetPackageModels: [InternetPackageModel]
        }
    }
    enum FetchSMSPackages {
        struct Request { }
        
        struct Response {
            let smsPackageModels: [SMSPackageModel]
        }
        
        struct ViewModel {
            let smsPackageModels: [SMSPackageModel]
        }
    }
}

enum RoumingDetailViewModel: String, CaseIterable {
    case internetPackages = "İnternet paketləri"
    case allIncludedPackages = "Hamısı daxil paketləri"
    case smsPackages = "SMS və zəng paketləri"
    
}
enum RoumingPackageType {
    case internet
    case smsAndCall
    case allIncluded
    
    var title: String? {
        switch self {
        case .internet:
            return "İnternet"
        case .smsAndCall:
            return "Zəng"
        default:
            return nil
        }
    }
}


class PackageModel {
    let packagePrice: Double
    let packageTimeRange: String
    let packageModelType: RoumingPackageType
    
    init(packagePrice: Double, packageTimeRange: String, packageModelType: RoumingPackageType) {
        self.packagePrice = packagePrice
        self.packageTimeRange = packageTimeRange
        self.packageModelType = packageModelType
    }
}
class InternetPackageModel: PackageModel {
    
    let isWhatsappFree: Bool
    let package: Package
    
    init(packagePrice: Double, packageTimeRange: String, packageModelType: RoumingPackageType, isWhatsappFree: Bool, package: Package) {
        self.isWhatsappFree = isWhatsappFree
        self.package = package
        
        super.init(packagePrice: packagePrice, packageTimeRange: packageTimeRange, packageModelType: packageModelType)
    }
}

class SMSPackageModel: PackageModel {
    let package: Package
    
    init(packagePrice: Double, packageTimeRange: String, packageModelType: RoumingPackageType, package: Package) {
        self.package = package
        
        super.init(packagePrice: packagePrice, packageTimeRange: packageTimeRange, packageModelType: packageModelType)
    }
}

class AllIncludedPackageModel: PackageModel {
    let title: String
    let internetPackage: Package
    let callPackage: Package
    let smsPackage: Package
    
    
    init(title: String, internetPackage: Package, callPackage: Package, smsPackage: Package, packagePrice: Double, packageTimeRange: String, packageModelType: RoumingPackageType) {
        self.title = title
        self.internetPackage = internetPackage
        self.callPackage = callPackage
        self.smsPackage = smsPackage
        super.init(packagePrice: packagePrice, packageTimeRange: packageTimeRange, packageModelType: packageModelType)
    }
}

class Package {
    let packageAmount: Int
    let amountType: String
    let packageType: String?
    
    init(packageAmount: Int, amountType: String, packageType: String? = nil) {
        self.packageAmount = packageAmount
        self.amountType = amountType
        self.packageType = packageType
    }
}




