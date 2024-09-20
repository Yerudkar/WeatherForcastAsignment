//
//  WeatherForecastingAppTests.swift
//  WeatherForecastingAppTests
//
//  Created by Madhuri Y on 20/09/24.
//

import XCTest
import RealmSwift

@testable import WeatherForecastingApp

class MockWeatherService: WeatherServiceProtocol {
    var weatherResult: Result<Weather, Error>?
    
    func getWeather(for city: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        if let result = weatherResult {
            completion(result)
        }
    }
}

class MockWeatherDatabase: WeatherDatabaseProtocol {
    var cachedWeather: Weather?
    var savedWeather: (Weather, String)?
    
    func fetchWeather(for city: String) -> Weather? {
        return cachedWeather
    }
    
    func saveWeather(_ weather: Weather, for city: String) {
        savedWeather = (weather, city)
    }
}

class WeatherViewModelTests: XCTestCase {
    
    var viewModel: WeatherViewModel!
    var mockWeatherService: MockWeatherService!
    var mockWeatherDatabase: MockWeatherDatabase!
    
    override func setUp() {
        super.setUp()
        mockWeatherService = MockWeatherService()
        mockWeatherDatabase = MockWeatherDatabase()
        viewModel = WeatherViewModel(weatherService: mockWeatherService, weatherDatabase: mockWeatherDatabase)
    }
    
    override func tearDown() {
        mockWeatherService = nil
        mockWeatherDatabase = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchWeatherFromDatabase() {
        let mockWeather = Weather(location: Location(name: "TestCity"), current: Current(temp_c: 20.0, condition: Condition(text: "Test", icon: "", code: 0), wind_mph: 1.0, wind_kph: 2.0, humidity: 6), forecast: nil)
        mockWeatherDatabase.cachedWeather = mockWeather
        
        viewModel.fetchWeather(for: "TestCity")
        
        XCTAssertEqual(viewModel.weather?.location?.name, "TestCity")
    }
    
    func testFetchWeatherFromAPI() {
        let mockWeather = Weather(location: Location(name: "TestCity"), current: Current(temp_c: 20.0, condition: Condition(text: "Test", icon: "", code: 0), wind_mph: 1.0, wind_kph: 2.0, humidity: 6), forecast: nil)
        mockWeatherService.weatherResult = .success(mockWeather)
        
        viewModel.fetchWeather(for: "TestCity")
        
        XCTAssertEqual(viewModel.weather?.location?.name, "TestCity")
        XCTAssertEqual(mockWeatherDatabase.savedWeather?.0.location?.name, "TestCity")
        XCTAssertEqual(mockWeatherDatabase.savedWeather?.1, "TestCity")
    }
    
    func testFetchWeatherAPIError() {
        let mockError = NSError(domain: "TestError", code: 404, userInfo: [NSLocalizedDescriptionKey: "City not found"])
        mockWeatherService.weatherResult = .failure(mockError)
        
        viewModel.fetchWeather(for: "UnknownCity")
        
        XCTAssertEqual(viewModel.errorMessage, "City not found")
    }
    
    func testFetchWeatherForSameCity() {
        let mockWeather = Weather(location: Location(name: "TestCity"), current: Current(temp_c: 20.0, condition: Condition(text: "Test", icon: "", code: 0), wind_mph: 1.0, wind_kph: 2.0, humidity: 6), forecast: nil)
        viewModel.weather = mockWeather
        
        viewModel.fetchWeather(for: "TestCity")
        
        XCTAssertEqual(viewModel.weather?.location?.name, "TestCity")
        XCTAssertNil(mockWeatherService.weatherResult)
    }
}

