//
//  ApiConstants.swift
//  Notifire
//
//  Created by Mohamed Magdy on 10/18/21.
//

import Foundation
import Alamofire
struct ApiConstants{
    struct ProductionServer {
        static var baseURL = "https://api.nytimes.com/svc/topstories/v2/"
        static let key = "q0CyvEtoMfHty5yHIbMReZr761Zr499y"
    }

    static func writeResponseToFiles(response:Data){
        let file = "file.txt" //this is the file. we will write to and read from it
        
        let text = String(data: response, encoding: .utf8)!//just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            print(fileURL.path)
            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case accept = "accept"

}

enum ContentType: String {
    case json = "application/json"
}

