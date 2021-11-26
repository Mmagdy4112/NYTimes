//
//  APIRouter.swift
//  Notifire
//
//  Created by Mohamed Magdy on 10/18/21.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    case stories

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .stories:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .stories:
            return "home.json"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .stories:
            return ["api-key":ApiConstants.ProductionServer.key]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try ApiConstants.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        switch method {
            
        case .post:
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            
        case .get:
            if let parameters = parameters {
                let queryParams = parameters.map { pair  in
                    return URLQueryItem(name: pair.key, value: "\(pair.value)")
                }
                var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                components?.queryItems = queryParams
                urlRequest.url = components?.url
            }
             
        default:
            print("")
        }
        return urlRequest
    }
}

