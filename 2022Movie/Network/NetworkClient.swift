//
//  NetworkClient.swift
//  2022Movie
//
//  Created by THEIN PYAE PHYO on 2/8/22.
//  Copyright © 2022 THEIN PYAE PHYO. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkClient {
    private init() {}
    
    static let shared = NetworkClient()
    
    func getData(route: String,
                 parameters: Parameters,
                 httpHeaders: HTTPHeaders,
                 success: @escaping (Any) -> Void,
                 failure: @escaping (String) -> Void)  {
        AF.request(SharedConstants.baseUrl + route, method: .get, parameters: parameters, headers: httpHeaders).responseData { (response) in
            switch response.result {
            case let .success(value):
                let json = JSON(value)
                success(json)
                break
            case let .failure(err):
                print(err.localizedDescription)
                break
            }
        }
    }
}
