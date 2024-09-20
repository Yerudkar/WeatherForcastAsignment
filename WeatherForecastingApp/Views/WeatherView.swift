//
//  WeatherView.swift
//  WeatherForecastingApp
//
//  Created by Madhuri Y on 20/09/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var cityName: String = ""

    var body: some View {
        VStack {
            cityInputField
            weatherButton
            weatherInfo
            errorMessage
            Spacer()
        }
    }

    private var cityInputField: some View {
        TextField("Enter city name", text: $cityName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }

    private var weatherButton: some View {
        Button("Get Weather") {
            viewModel.fetchWeather(for: cityName)
        }
        .padding()
    }

    private var weatherInfo: some View {
        Group {
            if !cityName.isEmpty, let weather = viewModel.weather {
                VStack(alignment: .leading) {
                    weatherDetails(for: weather)
                    forecastDetails(for: weather.forecast?.forecastday ?? [])
                }
                .padding()
            }
        }
    }

    private func weatherDetails(for weather: Weather) -> some View {
        VStack(alignment: .leading) {
            Text("Current Weather in \(weather.location?.name ?? "Unknown")")
                .font(.headline)

            if let current = weather.current {
                Text("Temperature: \(current.temp_c ?? 0.0)°C")
                Text("Humidity: \(current.humidity ?? 0)%")
                Text("Wind Speed: \(current.wind_kph ?? 0.0) m/s")
            }
        }
    }

    private func forecastDetails(for forecastDays: [Forecastday]) -> some View {
        VStack(alignment: .leading) {
            Text("5-Day Forecast")
                .font(.headline)
                .padding(.top)

            ForEach(forecastDays, id: \.date) { day in
                VStack(alignment: .leading) {
                    Text(day.date ?? "")
                    Text("Temp: \(day.hour?.first?.temp_c ?? 0.0)°C")
                    Text("Description: \(day.hour?.first?.condition?.text ?? "")")
                        .padding(.bottom)
                }
            }
        }
    }

    private var errorMessage: some View {
        Group {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}



struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
