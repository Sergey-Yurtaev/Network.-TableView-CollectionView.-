//
//  NetworkManager.swift
//  My money
//
//  Created by Sergey Yurtaev on 11.12.2021.
//

import Foundation
import Alamofire

enum UrlExample: String {
    case imageURL = "https://media.idownloadblog.com/wp-content/uploads/2017/09/NASA-from-Unsplash-2.jpg"
    case currencyURL = "https://www.cbr-xml-daily.ru/daily_json.js"
}

class NetworkManagerURLSession {
    
    static let shared = NetworkManagerURLSession()
    
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

class NetworkManagerImageURLSession {
    static let shared =  NetworkManagerImageURLSession()
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}

class NetworkManagerAlamofire {
    
    static let shared = NetworkManagerAlamofire()
    
    private init() {}
    
    func alamofireGet(from urlString: String, with complition: @escaping (ExchangeRates) -> Void) {
        AF.request(UrlExample.currencyURL.rawValue, method: .get)
            .validate()
            .responseDecodable(of: ExchangeRates.self) { dataResponse in
                switch dataResponse.result {
                case .success(let money):
                    complition(money)
                case .failure(let error):
                    print("ERROR: \(error)")
                }
            }
    }
}




