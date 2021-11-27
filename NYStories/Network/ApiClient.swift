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
    
    func getItems( completion:@escaping (DataResponse<MainResponse,AFError>)->Void) {
        performRequest(route: APIRouter.stories, completion: completion)
    }

}
