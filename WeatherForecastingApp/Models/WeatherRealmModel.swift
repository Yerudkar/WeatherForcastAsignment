//
//  WeatherRealmModel.swift
//  WeatherForecastingApp
//
//  Created by Madhuri Y on 20/09/24.
//

import Foundation
import RealmSwift

class WeatherRealmModel: Object {
    @objc dynamic var cityName: String = ""
    @objc dynamic var dateFetched: String = ""
    @objc dynamic var current: CurrentRealmModel? // Embed CurrentRealmModel
    @objc dynamic var forecast: ForecastRealmModel?
    
    override static func primaryKey() -> String? {
        return "cityName" // Use cityName as the primary key
    }
}

class CurrentRealmModel: Object {
    @objc dynamic var temperatureC: Double = 0.0
    @objc dynamic var windMph: Double = 0.0
    @objc dynamic var windKph: Double = 0.0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var condition: ConditionRealmModel? // Embed ConditionRealmModel
}

class ConditionRealmModel: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var icon: String = ""
    @objc dynamic var code: Int = 0
    
    override static func primaryKey() -> String? {
        return "code" // You can choose a suitable primary key
    }
}

// Forecast Realm Model
class ForecastRealmModel: Object {
    let forecastDays = List<ForecastDayRealmModel>() // List of forecast days
}

// Forecast Day Realm Model
class ForecastDayRealmModel: Object {
    @objc dynamic var date: String = ""
    @objc dynamic var dateEpoch: Int = 0
    let hours = List<CurrentRealmModel>() // List of hours with current weather data

    override static func primaryKey() -> String? {
        return "date" // Use date as the primary key (or another suitable identifier)
    }
}
