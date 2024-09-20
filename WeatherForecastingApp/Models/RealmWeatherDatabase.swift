//
//  RealmWeatherDatabase.swift
//  WeatherForecastingApp
//
//  Created by Madhuri Y on 20/09/24.
//

import Foundation
import RealmSwift

protocol WeatherDatabaseProtocol {
    func fetchWeather(for city: String) -> Weather?
    func saveWeather(_ weather: Weather, for city: String)
}

class RealmWeatherDatabase: WeatherDatabaseProtocol {
    private let realm = try! Realm()
    
    func fetchWeather(for city: String) -> Weather? {
        let results = realm.objects(WeatherRealmModel.self).filter("cityName == %@", city)
        
        if let entity = results.first {
            var currentCondition: Condition? = nil
            if let condition = entity.current?.condition {
                currentCondition = Condition(text: condition.text, icon: condition.icon, code: condition.code)
            }
            
            let currentWeather = Current(
                temp_c: entity.current?.temperatureC,
                condition: currentCondition,
                wind_mph: entity.current?.windMph,
                wind_kph: entity.current?.windKph,
                humidity: entity.current?.humidity
            )
            
            var forecastDays: [Forecastday] = []
            for forecastDay in entity.forecast?.forecastDays ?? List<ForecastDayRealmModel>() {
                var hours: [Current] = []
                for hour in forecastDay.hours {
                    let hourCondition = Condition(text: hour.condition?.text ?? "", icon: hour.condition?.icon ?? "", code: hour.condition?.code ?? 0)
                    let hourData = Current(
                        temp_c: hour.temperatureC,
                        condition: hourCondition,
                        wind_mph: hour.windMph,
                        wind_kph: hour.windKph,
                        humidity: hour.humidity
                    )
                    hours.append(hourData)
                }
                
                let forecastDayData = Forecastday(
                    date: forecastDay.date,
                    date_epoch: forecastDay.dateEpoch,
                    hour: hours
                )
                forecastDays.append(forecastDayData)
            }
            
            let forecast = Forecast(forecastday: forecastDays)
            
            let weather = Weather(
                location: Location(name: entity.cityName),
                current: currentWeather,
                forecast: forecast
            )
            
            return weather
        }
        return nil
    }
    
    func saveWeather(_ weather: Weather, for city: String) {
        let weatherEntity = WeatherRealmModel()
        weatherEntity.cityName = city
        weatherEntity.dateFetched = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        
        if let current = weather.current {
            let currentEntity = CurrentRealmModel()
            currentEntity.temperatureC = current.temp_c ?? 0.0
            currentEntity.humidity = current.humidity ?? 0
            currentEntity.windMph = current.wind_mph ?? 0.0
            currentEntity.windKph = current.wind_kph ?? 0.0
            
            if let condition = current.condition {
                let conditionEntity = ConditionRealmModel()
                conditionEntity.text = condition.text ?? ""
                conditionEntity.icon = condition.icon ?? ""
                conditionEntity.code = condition.code ?? 0
                
                currentEntity.condition = conditionEntity
            }
            
            weatherEntity.current = currentEntity
        }
        
        let forecastEntity = ForecastRealmModel()
        for forecastDay in weather.forecast?.forecastday ?? [] {
            let forecastDayEntity = ForecastDayRealmModel()
            forecastDayEntity.date = forecastDay.date ?? ""
            forecastDayEntity.dateEpoch = forecastDay.date_epoch ?? 0
            
            if let hours = forecastDay.hour {
                for hour in hours {
                    let hourEntity = CurrentRealmModel()
                    hourEntity.temperatureC = hour.temp_c ?? 0.0
                    hourEntity.humidity = hour.humidity ?? 0
                    hourEntity.windMph = hour.wind_mph ?? 0.0
                    hourEntity.windKph = hour.wind_kph ?? 0.0
                    
                    if let condition = hour.condition {
                        let hourConditionEntity = ConditionRealmModel()
                        hourConditionEntity.text = condition.text ?? ""
                        hourConditionEntity.icon = condition.icon ?? ""
                        hourConditionEntity.code = condition.code ?? 0
                        
                        hourEntity.condition = hourConditionEntity
                    }
                    
                    forecastDayEntity.hours.append(hourEntity)
                }
            }
            
            forecastEntity.forecastDays.append(forecastDayEntity)
        }
        
        weatherEntity.forecast = forecastEntity
        
        do {
            try realm.write {
                realm.add(weatherEntity, update: .modified)
            }
        } catch {
            print("Failed to save weather: \(error.localizedDescription)")
        }
    }
}
