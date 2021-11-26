//
//  APIConfiguration.swift
//  Notifire
//
//  Created by Mohamed Magdy on 10/18/21.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
