//
//  RoumingCountrySearchModels.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit

enum RoumingCountrySearch {
    
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


struct RoumingSearchCountryViewCellModel {
    let countryName: String
    let operators: [String]
    let countryFlag: UIImage?
}
