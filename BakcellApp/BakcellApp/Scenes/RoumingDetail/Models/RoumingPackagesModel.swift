//
//  RoumingPackagesModel.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 18.03.24.
//

import Foundation
import BakcellNetworkKit


struct RoumingPackagesModel {
    let title: String
    let countries: [String: String]
    let internetPackages: InternetPackagesModel
    let allPackages: AllPackagesModel
    let smsCallPackages: SMSCallPackagesModel
}


extension RoumingPackagesResponse {
    func convertToModel() -> RoumingPackagesModel {
        let allPackagesModel = AllPackagesModel(title: allPackages.title, items: allPackages.items.map { item in
            AllPackagesItemModel(title: item.title, period: item.period, types: item.types.map { type in
                TypeElementModel(name: type.name, units: type.units)
            })
        })
        
        let internetPackagesModel = InternetPackagesModel(title: internetPackages.title, items: internetPackages.items.map { item in
            InternetPackagesItemModel(id: item.id, title: item.title, period: item.period, type: item.type, desc: item.desc, icon: item.icon)
        })
        
        let smsCallPackagesModel = SMSCallPackagesModel(title: smsCallPackages.title, items: smsCallPackages.items.map { item in
            SMSCallPackagesItemModel(id: item.id, title: item.title, period: item.period, type: item.type)
        })
        
        return RoumingPackagesModel(title: title, countries: countries, internetPackages: internetPackagesModel, allPackages: allPackagesModel, smsCallPackages: smsCallPackagesModel)
    }
}
