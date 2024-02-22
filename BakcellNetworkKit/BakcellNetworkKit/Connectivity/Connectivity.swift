//
//  Connectivity.swift
//  BakcellNetworkKit
//
//  Created by Sevar Jafarli on 15.02.24.
//

import Foundation
import Alamofire

public final class Connectivity {
    public class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
