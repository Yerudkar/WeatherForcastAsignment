//
//  WeatherViewModel.swift
//  WeatherForecastingApp
//
//  Created by Madhuri Y on 20/09/24.
//

import Foundation
import Combine
import RealmSwift

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var errorMessage: String?
    
    private var weatherService: WeatherServiceProtocol
    private var weatherDatabase: WeatherDatabaseProtocol
    private var currentCity: String?

    // Inject dependencies
    init(weatherService: WeatherServiceProtocol = WeatherService(),
         weatherDatabase: WeatherDatabaseProtocol = RealmWeatherDatabase()) {
        self.weatherService = weatherService
        self.weatherDatabase = weatherDatabase
    }
    
    func fetchWeather(for city: String) {
        if city == currentCity, weather != nil {
            return
        }
        
        currentCity = city
        
        if let cachedWeather = weatherDatabase.fetchWeather(for: city) {
            self.weather = cachedWeather
            return
        }
        
        weatherService.getWeather(for: city) { [weak self] result in
            switch result {
            case .success(let response):
                self?.weather = response
                self?.weatherDatabase.saveWeather(response, for: city)
                
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
}



