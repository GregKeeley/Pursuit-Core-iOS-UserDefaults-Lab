//
//  HoroscopeAPI.swift
//  UserDefaultsLab_Horoscopes
//
//  Created by Gregory Keeley on 1/14/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import Foundation

struct HoroscopeAPI {
    static func getHoroscopes(for horoscope: String, completion: @escaping (Result<Horoscope, AppError>) -> ()) {
        
        let endpointURL = "http://sandipbgt.com/theastrologer/api/horoscope/\(horoscope)/today"
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                let results = try JSONDecoder().decode(Horoscope.self, from: data)
                    completion(.success(results))
                } catch {
                    
                }
            }
        }
    }
    
}
