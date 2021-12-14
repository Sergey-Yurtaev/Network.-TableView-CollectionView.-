//
//  NetworkManager.swift
//  My money
//
//  Created by Sergey Yurtaev on 11.12.2021.
//

import Foundation

enum URLExample: String {
    case imageURL = "https://media.idownloadblog.com/wp-content/uploads/2017/09/NASA-from-Unsplash-2.jpg"
    case currencyURL = "https://www.cbr-xml-daily.ru/daily_json.js"
}

class Networkmanager {
    
    static let shared = Networkmanager()
    
    private init() {}
    
    func fetchData(from urlString: String, with complition: @escaping (ExchangeRates) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase  - если снек_кейс
            do {
                let exchangeRates = try jsonDecoder.decode(ExchangeRates.self, from: data)
                DispatchQueue.main.async {
                    complition(exchangeRates)
                
                //тут или при вызове не забыть вызвать self.tableView.reloadData
                }
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
        }.resume()
    }
}

class ImageManager {
    static let shared =  ImageManager()
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}

