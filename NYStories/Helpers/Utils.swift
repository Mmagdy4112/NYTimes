//
//  Utils.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/27/21.
//

import Foundation

class Utils{
    static let shared = Utils()
    
    func getFormattedDate(_ string: String? ) -> String{
        guard let s = string ,!s.isEmpty else{
            return ""
        }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy 'at' hh:mm:ss"

        let date: Date? = dateFormatterGet.date(from: string!)
        return dateFormatterPrint.string(from: date!);
    }
}

