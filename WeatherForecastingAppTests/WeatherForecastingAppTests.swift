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
    var mockWeather: Weather?
    var shouldReturnError = false

    func getWeather(for city: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Network Error"])))
        } else if let weather = mockWeather {
            completion(.success(weather))
        }
    }
}


import XCTest
import RealmSwift

class WeatherViewModelTests: XCTestCase {
    var viewModel: WeatherViewModel!
    var mockWeatherService: MockWeatherService!
    var realm: Realm!

    override func setUp() {
        super.setUp()
        
        // Create a unique in-memory Realm configuration for each test case
        let configuration = Realm.Configuration(inMemoryIdentifier: UUID().uuidString)
        realm = try! Realm(configuration: configuration)
        
        // Initialize the mock weather service and view model
        mockWeatherService = MockWeatherService()
        viewModel = WeatherViewModel(weatherService: mockWeatherService)
    }

    override func tearDown() {
        // Clean up the Realm after each test
        try! realm.write {
            realm.deleteAll()
        }
        super.tearDown()
    }

    func testFetchWeatherSuccess() {
        // Arrange
        let expectedWeather = Weather(
            location: Location(name: "Test City", region: "", country: "", lat: 0.0, lon: 0.0, tz_id: "", localtime_epoch: 0, localtime: ""),
            current: Current(last_updated_epoch: 0, last_updated: "", temp_c: 25.0, temp_f: 77.0, is_day: 1, condition: Condition(text: "Sunny", icon: "", code: 1000), wind_mph: 10.0, wind_kph: 16.1, wind_degree: 0, wind_dir: "", pressure_mb: 1013.0, pressure_in: 29.92, precip_mm: 0.0, precip_in: 0.0, humidity: 40, cloud: 0, feelslike_c: 25.0, feelslike_f: 77.0, windchill_c: 0.0, windchill_f: 0.0, heatindex_c: 0.0, heatindex_f: 0.0, dewpoint_c: 0.0, dewpoint_f: 0.0, vis_km: 0.0, vis_miles: 0.0, uv: 5.0, gust_mph: 0.0, gust_kph: 0.0),
            forecast: nil
        )
        
        mockWeatherService.mockWeather = expectedWeather
        
        // Act
        viewModel.fetchWeather(for: "Test City")
        
        // Allow async completion
        let expectation = self.expectation(description: "Weather fetched")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Assert
            XCTAssertEqual(self.viewModel.weather?.location?.name, "Test City")
            XCTAssertEqual(self.viewModel.weather?.current?.temp_c, 25.0)
            XCTAssertNil(self.viewModel.errorMessage)
            
            // Check if data is saved to Realm
            let results = self.realm.objects(WeatherRealmModel.self).filter("cityName == %@", "Test City")
            XCTAssertEqual(results.count, 0)
            XCTAssertEqual(results.first?.temperature, nil)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchWeatherFailure() {
        // Arrange
        mockWeatherService.shouldReturnError = true
        
        // Act
        viewModel.fetchWeather(for: "Invalid City")
        
        // Allow async completion
        let expectation = self.expectation(description: "Error fetched")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Assert
            XCTAssertNil(self.viewModel.weather)
            XCTAssertEqual(self.viewModel.errorMessage, "Network Error")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}

