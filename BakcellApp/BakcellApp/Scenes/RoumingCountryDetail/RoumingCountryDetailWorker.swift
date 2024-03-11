//
//  RoumingCountryDetailWorker.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

protocol RoumingCountryDetailWorkingLogic {
    func fetchPackages(_ completion: ((internetPackages: [InternetPackageModel], smsPackages: [SMSPackageModel])) -> Void)
    
    func fetchOperators(_ completion: ([OperatorModel]) -> Void)
    
    func fetchPriceComparison(_ completion: ([OperatorServicePriceModel]) -> Void)
}

final class RoumingCountryDetailWorker: RoumingCountryDetailWorkingLogic {
    // MARK: - Private Properties
    
    //    private let service: ServiceProtocol = App.service
    
    
    // MARK: - Working Logic
    
    func fetchPackages(_ completion: ((internetPackages: [InternetPackageModel], smsPackages: [SMSPackageModel])) -> Void) {
        let internetPackages = Array(repeating: InternetPackageModel(packagePrice: 3.00, packageTimeRange: "Gun", packageModelType: .internet, isWhatsappFree: true, package: .init(packageAmount: 100, amountType: "MB")), count: 3)
        
        let smsPackages = Array(repeating: SMSPackageModel(packagePrice: 40.00, packageTimeRange: "Ay", packageModelType: .smsAndCall, package: .init(packageAmount: 100, amountType: "dəq")), count: 3)
        
        completion((internetPackages, smsPackages))
    }
    
    func fetchOperators(_ completion: ([OperatorModel]) -> Void) {
        let operators: [OperatorModel] =  [
            .init(operatorName: "TT MobileB", services: .init(services: [
                .init(packageType: .call, volumes: [
                    .init(title: "Daxil olan", volume: "0.39 ₼", volumeType: "deq"),
                    .init(title: "Çıxan", volume: "0.99 ₼", volumeType: "deq")
                ]),
                .init(packageType: .sms, volumes: [
                    .init(title: "Daxil olan", volume: "Pulsuz", volumeType: ""),
                    .init(title: "Çıxan", volume: "0.19 ₼", volumeType: "sms")
                ]),
                .init(packageType: .internet, volumes: [
                    .init(title: "Sərfiyyat", volume: "-", volumeType: ""),
                    .init(title: "Şəbəkə", volume: "2G, 3G, 4G", volumeType: "")
                ]),
                ])),
            .init(operatorName: "Turkcell", services: .init(services: [
                .init(packageType: .call, volumes: [
                    .init(title: "Daxil olan", volume: "0.39 ₼", volumeType: "deq"),
                    .init(title: "Çıxan", volume: "0.99 ₼", volumeType: "deq")
                ]),
                .init(packageType: .sms, volumes: [
                    .init(title: "Daxil olan", volume: "Pulsuz", volumeType: ""),
                    .init(title: "Çıxan", volume: "0.19 ₼", volumeType: "sms")
                ]),
                .init(packageType: .internet, volumes: [
                    .init(title: "Sərfiyyat", volume: "-", volumeType: ""),
                    .init(title: "Şəbəkə", volume: "2G, 3G, 4G", volumeType: "")
                ]),
                ])),
            .init(operatorName: "TT MobileB", services: .init(services: [
                .init(packageType: .call, volumes: [
                    .init(title: "Daxil olan", volume: "0.39 ₼", volumeType: "deq"),
                    .init(title: "Çıxan", volume: "0.99 ₼", volumeType: "deq")
                ]),
                .init(packageType: .sms, volumes: [
                    .init(title: "Daxil olan", volume: "Pulsuz", volumeType: ""),
                    .init(title: "Çıxan", volume: "0.19 ₼", volumeType: "sms")
                ]),
                .init(packageType: .internet, volumes: [
                    .init(title: "Sərfiyyat", volume: "-", volumeType: ""),
                    .init(title: "Şəbəkə", volume: "2G, 3G, 4G", volumeType: "")
                ]),
                ])
                ),]
        
            completion(operators)
    }
    
    func fetchPriceComparison(_ completion: ([OperatorServicePriceModel]) -> Void) {
        let services: [OperatorServicePriceModel] = [
            .init(name: "TT Mobile", incomingCallFee: "0.39 ₼ / dəq", outgoingCallFee: "0.99 ₼ / dəq", incomingSMS: "Pulsuz", outgoingSMS: "0.19 ₼ / sms", internetUsage: "-", network: "2G, 3G, 4G"),
            .init(name: "TT Mobile", incomingCallFee: "0.59 ₼ / dəq", outgoingCallFee: "0.79 ₼ / dəq", incomingSMS: "Pulsuz", outgoingSMS: "0.19 ₼ / sms", internetUsage: "-", network: "2G, 3G, 4G, 5G"),
        ]
        
        completion(services)
    }
    
    
}

