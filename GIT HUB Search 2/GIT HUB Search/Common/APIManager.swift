//
//  APIManager.swift
//  GIT HUB Search
//
//  Created by Adwaith V V on 28/05/23.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared: APIManager = APIManager()
    
    private init() { }
    
    func commonNetworkCall(_ url: String, params: Parameters, method: HTTPMethod, completion: @escaping(Bool, Data?, String)->Void) {
        AF.request(url, method: method, parameters: params)
            .response { responseObject in
                switch responseObject.result {
                case .success(let data):
//                    print(data)
                    completion(true, data, "API call completed successfully")
                case .failure(let err):
                    print(err)
                    completion(false, nil, "Something went wrong")
                }
            }
    }
}
