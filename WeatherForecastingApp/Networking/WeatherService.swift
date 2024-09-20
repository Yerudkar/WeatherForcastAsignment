//
//  WeatherService.swift
//  WeatherForecastingApp
//
//  Created by Madhuri Y on 20/09/24.
//

import Foundation
import Alamofire

protocol WeatherServiceProtocol {
    func getWeather(for city: String, completion: @escaping (Result<Weather, Error>) -> Void)
}

class WeatherService: WeatherServiceProtocol {
    private let apiKey = "e2356aef9c244fc68ad84515242009"

    func getWeather(for city: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        let url = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(city)&days=5"
        
        AF.request(url).validate().responseDecodable(of: Weather.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
