//
//  RoumingCountryDetailModels.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

enum RoumingCountryDetail {
    
    static var categories: [String] {
        PageCategoryModel.allCases.map { $0.rawValue }
    }
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request {
        }
        
        struct Response {
        }
        
        struct ViewModel {
        }
    }
    
    enum FetchPackages {
        struct Request {
        }
        
        struct Response {
            let internetPackages: [InternetPackagesItemModel]
            let smsPackages: [SMSCallPackagesItemModel]
        }
        
        struct ViewModel {
            let internetPackages: [InternetPackagesItemModel]
            let smsPackages: [SMSCallPackagesItemModel]
        }
    }
    
    enum FetchOperators {
        struct Request {
        }
        
        struct Response {
            let operators: [OperatorModel]
        }
        
        struct ViewModel {
            let operators: [OperatorModel]
        }
    }
    
    enum FetchPriceComparison {
        struct Request {
        }
        
        struct Response {
            let services: [OperatorServicePriceModel]
        }
        
        struct ViewModel {
            let services: [OperatorServicePriceModel]
        }
    }
}



enum PageCategoryModel: String, CaseIterable {
    case packages = "Paketlər"
    case operators = "Operatorlar"
    case priceComparison = "Qiymət müqayisəsi"
    
}

enum PackageType {
    case sms
    case internet
    case call
    
    var title: String {
        switch self {
        case .sms:
            return "SMS"
        case .internet:
            return "Internet"
        case .call:
            return "Zənglər"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .sms:
            return UIImage(named: AppAssets.sms.rawValue)
        case .internet:
            return UIImage(named: AppAssets.internet.rawValue)
        case .call:
            return UIImage(named: AppAssets.phone.rawValue)
        }
    }
}


//MARK: OperatorModel

struct OperatorModel {
    let operatorName: String
    let services: RoumingOperatorServices
}

struct RoumingOperatorServices {
    let services: [RoumingOperatorServiceType]
}

struct RoumingOperatorServiceType {
    let packageType: PackageType
    let volumes: [RoumingOperatorVolume]
}

struct RoumingOperatorVolume {
    let title: String
    let volume: String
    let volumeType: String
}

struct OperatorServicePriceModel {
    let name: String
    let incomingCallFee: String
    let outgoingCallFee: String
    let incomingSMS: String
    let outgoingSMS: String
    let internetUsage: String
    let network: String

}
