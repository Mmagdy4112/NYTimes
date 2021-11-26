//
//  ApiClient.swift
//  Notifire
//
//  Created by Mohamed Magdy on 10/18/21.
//

import Alamofire

class APIClient {
    
    @discardableResult
    private func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (DataResponse<T,AFError> )->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T,AFError>) in
                ApiConstants.writeResponseToFiles(response: response.data ?? Data())
                completion(response)
            }
    }
    
//    func products( completion:@escaping (DataResponse<ProductResponse,AFError>)->Void) {
//        let dictonary:[String:Any] = MainRequest().dictionary!
//        performRequest(route: APIRouter.products(params: dictonary), completion: completion)
//    }

}
