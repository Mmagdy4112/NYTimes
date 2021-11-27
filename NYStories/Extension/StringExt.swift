//
//  StringExt.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/26/21.
//

import Foundation
extension String{
    func localized() -> String{
        let path = Bundle.main.path(forResource: "en", ofType: "lproj")
       let bundle = Bundle(path: path!)
       return NSLocalizedString(self, tableName: nil, bundle: bundle!,      value: "", comment: "")
      }
}
