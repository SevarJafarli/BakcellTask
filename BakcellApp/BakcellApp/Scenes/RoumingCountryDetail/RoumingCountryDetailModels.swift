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
}


enum PageCategoryModel: String, CaseIterable {
    case packages = "Paketlər"
    case operators = "Operatorlar"
    case priceComparison = "Qiymət müqayisəsi"
    
}


struct OperatorModel {
    let operatorName: String
//    let operatorCallService
}
