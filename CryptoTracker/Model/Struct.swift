//
//  File.swift
//  CryptoTracker
//
//  Created by harsh yadav on 18/05/21.
//

import Foundation

struct CryptoData : Decodable {
   
    var name : String! = ""
    var asset_id : String! = ""
    var price_usd : Float?
}
