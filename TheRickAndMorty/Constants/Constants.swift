//
//  Constants.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 07/09/24.
//

import Foundation
import SwiftUI

let APIURL = "https://rickandmortyapi.com/api/"
let columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 2)

extension Date {
    func getFormattedDate(date:String, format: String) -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = format
       let dateFromStr = dateFormatter.date(from: date)!
       return dateFromStr.formatted()
    }
    
    func formatDate(date: String, format: String = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'") -> String {
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = format

       let dateFormatter = DateFormatter()
       dateFormatter.dateStyle = .medium
       dateFormatter.timeStyle = .none
       //    dateFormatter.locale = Locale(identifier: "en_US") //uncomment if you don't want to get the system default format.

       let dateObj: Date? = dateFormatterGet.date(from: date)

       return dateFormatter.string(from: dateObj!)
    }
}
