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
    private let realm = try! Realm()
    private var currentCity: String?

    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }

    func fetchWeather(for city: String) {
        // Check if the city name has changed or if we don't have cached data
        if city == currentCity, weather != nil {
            // Use cached data
            return
        }

        // Store the current city for caching purposes
        currentCity = city
        
        // Check if weather data is available in the database
        if let cachedWeather = fetchWeatherFromDatabase(for: city) {
            self.weather = cachedWeather
            return
        }

        // Fetch weather data from API
        weatherService.getWeather(for: city) { [weak self] result in
            switch result {
            case .success(let response):
                // Update the weather object with data from the response
                self?.weather = response
                // Save the fetched weather data to Realm
                self?.saveWeatherToDatabase(response, for: city)
                
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }

    private func fetchWeatherFromDatabase(for city: String) -> Weather? {
        let results = realm.objects(WeatherRealmModel.self).filter("cityName == %@", city)

        if let entity = results.first {
            // Map your entity to the Weather model
            let weather = Weather(
                location: Location(name: entity.cityName, region: "", country: "", lat: 0.0, lon: 0.0, tz_id: "", localtime_epoch: 0, localtime: ""),
                current: Current(last_updated_epoch: 0, last_updated: "", temp_c: entity.temperature, temp_f: 0.0, is_day: 0, condition: Condition(text: entity.condition, icon: "", code: 0), wind_mph: 0.0, wind_kph: entity.windSpeed, wind_degree: 0, wind_dir: "", pressure_mb: 0.0, pressure_in: 0.0, precip_mm: 0.0, precip_in: 0.0, humidity: entity.humidity, cloud: 0, feelslike_c: 0.0, feelslike_f: 0.0, windchill_c: 0.0, windchill_f: 0.0, heatindex_c: 0.0, heatindex_f: 0.0, dewpoint_c: 0.0, dewpoint_f: 0.0, vis_km: 0.0, vis_miles: 0.0, uv: 0.0, gust_mph: 0.0, gust_kph: 0.0),
                forecast: Forecast(forecastday: [Forecastday(date: entity.dateFetched, date_epoch: 0, day: Day(maxtemp_c: 0.0, maxtemp_f: 0.0, mintemp_c: 0.0, mintemp_f: 0.0, avgtemp_c: 0.0, avgtemp_f: 0.0, maxwind_mph: 0.0, maxwind_kph: 0.0, totalprecip_mm: 0.0, totalprecip_in: 0.0, totalsnow_cm: 0.0, avgvis_km: 0.0, avgvis_miles: 0.0, avghumidity: 0, daily_will_it_rain: 0, daily_chance_of_rain: 0, daily_will_it_snow: 0, daily_chance_of_snow: 0, condition: Condition(text: entity.condition, icon: "", code: 0), uv: 0.0), astro: Astro(sunrise: "", sunset: "", moonrise: "", moonset: "", moon_phase: "", moon_illumination: 0, is_moon_up: 0, is_sun_up: 0), hour: [Hour(last_updated_epoch: 0, last_updated: "", temp_c: entity.temperature, temp_f: 0.0, is_day: 0, condition: Condition(text: entity.condition, icon: "", code: 0), wind_mph: 0.0, wind_kph: entity.windSpeed, wind_degree: 0, wind_dir: "", pressure_mb: 0.0, pressure_in: 0.0, precip_mm: 0.0, precip_in: 0.0, humidity: entity.humidity, cloud: 0, feelslike_c: 0.0, feelslike_f: 0.0, windchill_c: 0.0, windchill_f: 0.0, heatindex_c: 0.0, heatindex_f: 0.0, dewpoint_c: 0.0, dewpoint_f: 0.0, vis_km: 0.0, vis_miles: 0.0, uv: 0.0, gust_mph: 0.0, gust_kph: 0.0)])])
                    
            )
            return weather
        }

        return nil
    }

    private func saveWeatherToDatabase(_ weather: Weather, for city: String) {
        let weatherEntity = WeatherRealmModel()
        weatherEntity.cityName = city
        
        // Save current weather details
        if let current = weather.current {
            weatherEntity.temperature = current.temp_c ?? 0.0
            weatherEntity.humidity = current.humidity ?? 0
            weatherEntity.windSpeed = current.wind_kph ?? 0.0
        }

        // Save location details
        if let location = weather.location {
            weatherEntity.cityName = location.name ?? ""
        }

        do {
            try realm.write {
                realm.add(weatherEntity, update: .modified) // Update if the entity already exists
            }
        } catch {
            print("Failed to save weather: \(error.localizedDescription)")
        }
    }

}


