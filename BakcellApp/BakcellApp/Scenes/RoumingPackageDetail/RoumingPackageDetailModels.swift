//
//  RoumingPackageDetailModels.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

enum RoumingPackageDetail {
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request {
        }
        
        struct Response {
        }
        
        struct ViewModel {
        }
    }
}

struct RoumingPackageDetailCardModel {
    let packageType: String
    let packageAmount: Int
    let packageAmountType: String
    let infoModels: [RoumingPackageDetailInfoModel]
    let moreInfos: [RoumingPackageMoreInfoModel]
}

struct RoumingPackageDetailInfoModel {
    let modelType: RoumingPackageDetailInfoModelType
    let amount: String
    let amountType: String?
    
    init(modelType: RoumingPackageDetailInfoModelType, amount: String, amountType: String?) {
        self.modelType = modelType
        self.amount = amount
        self.amountType = amountType
    }
}


enum RoumingPackageDetailInfoModelType {
    case internet
    case freeServices
    case duration
    case price
    
    var title: String {
        switch self {
        case .internet:
            "Internet"
        case .freeServices:
            "Whatsapp"
        case .duration:
            "Müddəti"
        case .price:
            "Qiyməti"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .internet:
            return UIImage(named: AppAssets.internet.rawValue)
        case .freeServices:
            return UIImage(named: AppAssets.whatsapp.rawValue)
        case .duration:
            return UIImage(named: AppAssets.duration.rawValue)
        case .price:
            return UIImage(named: AppAssets.price.rawValue)
        }
    }
}

struct RoumingPackageMoreInfoModel {
    let title: String
    let subtitle: [String]
    let subtitleColor: UIColor?
}
