//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(_ error: Error)
    func didUpdateCoinRate(_ coinManager: CoinManager, _ coinModel: CoinModel)
}

struct CoinManager {
//MARK: - Properties
    
    let stringJSON = """
    {
      "time": "2025-08-01T06:05:12.0369393Z",
      "asset_id_base": "BTC",
      "asset_id_quote": "RUB",
      "rate": 10000
    }
"""
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "228a7a5e-6def-47ab-9b89-5fe3488f1b0f"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var delegate: CoinManagerDelegate?
    
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)/?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with url: String) {
        let url = URL(string: url)
        let session = URLSession(configuration: .default)
        if let url = url {
            let task = session.dataTask(with: url) { data, responce, error in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                } else {
                    if let saveData = data {
                        guard let coinData = parseJSON(with: saveData) else { return }
                        delegate?.didUpdateCoinRate(self, coinData)

                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(with data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: stringJSON.data(using: .utf8)!)
            let rate = decodedData.rate
            let coinName = decodedData.asset_id_quote
            
            return CoinModel(rate: rate, coinName: coinName)
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
