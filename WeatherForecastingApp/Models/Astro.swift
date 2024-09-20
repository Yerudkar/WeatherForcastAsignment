/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Astro: Codable {
    let sunrise: String?
    let sunset: String?
    let moonrise: String?
    let moonset: String?
    let moon_phase: String?
    let moon_illumination: Int?
    let is_moon_up: Int?
    let is_sun_up: Int?

    enum CodingKeys: String, CodingKey {
        case sunrise = "sunrise"
        case sunset = "sunset"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case moon_phase = "moon_phase"
        case moon_illumination = "moon_illumination"
        case is_moon_up = "is_moon_up"
        case is_sun_up = "is_sun_up"
    }

    // Custom initializer
    init(sunrise: String?, sunset: String?, moonrise: String?, moonset: String?,
         moon_phase: String?, moon_illumination: Int?, is_moon_up: Int?, is_sun_up: Int?) {
        self.sunrise = sunrise
        self.sunset = sunset
        self.moonrise = moonrise
        self.moonset = moonset
        self.moon_phase = moon_phase
        self.moon_illumination = moon_illumination
        self.is_moon_up = is_moon_up
        self.is_sun_up = is_sun_up
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sunrise = try values.decodeIfPresent(String.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(String.self, forKey: .sunset)
        moonrise = try values.decodeIfPresent(String.self, forKey: .moonrise)
        moonset = try values.decodeIfPresent(String.self, forKey: .moonset)
        moon_phase = try values.decodeIfPresent(String.self, forKey: .moon_phase)
        moon_illumination = try values.decodeIfPresent(Int.self, forKey: .moon_illumination)
        is_moon_up = try values.decodeIfPresent(Int.self, forKey: .is_moon_up)
        is_sun_up = try values.decodeIfPresent(Int.self, forKey: .is_sun_up)
    }
}

