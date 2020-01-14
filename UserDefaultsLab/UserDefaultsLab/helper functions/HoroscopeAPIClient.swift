//
//  HoroscopeAPIClient.swift
//  UserDefaultsLab
//
//  Created by Pursuit on 1/13/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

struct HoroscopeAPICLient {
    
    static func fetchHoroscopes(with string: String, completion: @escaping (Result <HoroscopesFromAPI , AppError>) -> () ){
        
        let horoscopeURLEndpoint = ""
        
        guard let url = URL(string: horoscopeURLEndpoint) else {
            completion(.failure(.badURL(horoscopeURLEndpoint)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request, completion: {
            result in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let horoscopeData = try JSONDecoder().decode(HoroscopesFromAPI.self, from: data)
                   // let horoResults = horoscopeData
                   // completion(.success(horoscopeData))
                    completion(.success(horoscopeData))
                } catch {
                    
                    completion(.failure(.decodingError(error)))
                }
            }
        })
        
    }
    
}
