//
//  WeatherRealmModel.swift
//  WeatherForecastingApp
//
//  Created by DB-MBP-017 on 20/09/24.
//

import Foundation
import RealmSwift

class WeatherRealmModel: Object {
    @objc dynamic var cityName: String = ""
    @objc dynamic var temperature: Double = 0.0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var windSpeed: Double = 0.0
    @objc dynamic var dateFetched: String = ""
    @objc dynamic var condition: String = ""
    
    override static func primaryKey() -> String? {
        return "cityName" // Use cityName as the primary key
    }
}
