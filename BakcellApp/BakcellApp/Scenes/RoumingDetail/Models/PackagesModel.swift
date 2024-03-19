//
//  PackagesModel.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 18.03.24.
//

import Foundation

// MARK: - AllPackagesModel
struct AllPackagesModel {
    let title: String
    let items: [AllPackagesItemModel]
}

// MARK: - AllPackagesItemModel
struct AllPackagesItemModel{
    let title, period: String
    let types: [TypeElementModel]
}

// MARK: - TypeElementModel
struct TypeElementModel {
    let name, units: String
}


//MARK: InternetPackagesModel
struct InternetPackagesModel {
    let title: String
    let items: [InternetPackagesItemModel]
}

//MARK: InternetPackagesItemModel
class InternetPackagesItemModel: BasePackagesItemModel {
    let desc: String
    let icon: String
    
    init(id: Int, title: String, period: String, type: String, desc: String, icon: String) {
        self.desc = desc
        self.icon = icon
        super.init(id: id, title: title, period: period, type: type)
       
    }
}

//MARK: SMSCallPackagesModel
struct SMSCallPackagesModel {
    let title: String
    let items: [SMSCallPackagesItemModel]
}

// MARK: - SMSCallPackagesItemModel
class SMSCallPackagesItemModel: BasePackagesItemModel {

}

class BasePackagesItemModel {
    let id: Int
    let title: String
    let period: String
    let type: String
    
    init(id: Int, title: String, period: String, type: String) {
        self.id = id
        self.title = title
        self.period = period
        self.type = type
    }
}
