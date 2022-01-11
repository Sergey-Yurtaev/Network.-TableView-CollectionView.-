//
//  ExchangeRates.swift
//  My money
//
//  Created by Sergey Yurtaev on 09.12.2021.
//

import Foundation

struct ExchangeRates: Decodable {
    let date: String?
    let timestamp: String?
    let valute: [String: DetailsRares]?
    
    enum CodingKeys: String, CodingKey {
        case valute = "Valute"
        case timestamp = "Timestamp"
        case date = "Data"
    }
}

struct DetailsRares: Decodable {
    let charCode: String?
    let nominal: Int?
    let name: String?
    let value: Double?
    let emoji: String?
    let previous: Double?
    
    enum CodingKeys: String, CodingKey {
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case emoji = "Emoji"
        case previous = "Previous"
    }
}

/*
     "Date": "2021-12-10T11:30:00+03:00",
     "PreviousDate": "2021-12-09T11:30:00+03:00",
     "PreviousURL": "\/\/www.cbr-xml-daily.ru\/archive\/2021\/12\/09\/daily_json.js",
     "Timestamp": "2021-12-09T18:00:00+03:00",
     "Valute": {
         "AUD": {
             "ID": "R01010",
             "NumCode": "036",
             "CharCode": "AUD",
             "Nominal": 1,
             "Name": "Австралийский доллар",
             "Value": 52.6975,
             "Previous": 52.6665
         },
 */



