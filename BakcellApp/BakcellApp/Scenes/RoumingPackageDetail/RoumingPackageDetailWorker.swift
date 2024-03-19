//
//  RoumingPackageDetailWorker.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit

protocol RoumingPackageDetailWorkingLogic {
    func fetchPackageInfo(_ completion: (RoumingPackageDetailCardModel) -> Void)
}

final class RoumingPackageDetailWorker: RoumingPackageDetailWorkingLogic {
    
    // MARK: - Private Properties
    
    //    private let service: ServiceProtocol = App.service
    
    
    // MARK: - Working Logic
    
    func fetchPackageInfo(_ completion: (RoumingPackageDetailCardModel) -> Void) {
        let packageInfo = RoumingPackageDetailCardModel(packageType: "Günlük", packageAmount: 100, packageAmountType: "MB", infoModels: [
            .init(modelType: .internet, amount: "100", amountType: "MB"),
            .init(modelType: .freeServices, amount: "Pulsuz", amountType: nil),
            .init(modelType: .duration, amount: "1", amountType: "gün"),
            .init(modelType: .price, amount: "3.00", amountType: "₼"),
            
        ],
        moreInfos: [
            .init(title: "Ətraflı məlumat",
                  subtitle: [
                    "Pulsuz WhatsApp zəng və mesajlar üçündür.",
                    "Digər WhatsApp funksiyalarından istifadə edildikdə, xidmət haqqı paketsiz rouminq qiymətləri ilə hesablanacaq."
                  ], subtitleColor: nil),
                .init(title: "Qeyd", subtitle: [
                    "İnternetin tarifikasiyası – 100 KB.",
                    "Paket hər gecə saat 00:00-da avtomatik olaraq yenilənir.",
                    "Təqdim edilən paket bitdikdən sonra paketsiz rouminq qiymətləri tətbiq edilir və balansınızda olan vəsaitdən çıxılacaq.",
                ], subtitleColor: nil), //TODO:  change to adaptive color black low
        ])
        completion(packageInfo)
    }
    
}
