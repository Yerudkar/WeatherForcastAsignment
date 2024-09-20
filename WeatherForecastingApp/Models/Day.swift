/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Day: Codable {
    let maxtemp_c: Double?
    let maxtemp_f: Double?
    let mintemp_c: Double?
    let mintemp_f: Double?
    let avgtemp_c: Double?
    let avgtemp_f: Double?
    let maxwind_mph: Double?
    let maxwind_kph: Double?
    let totalprecip_mm: Double?
    let totalprecip_in: Double?
    let totalsnow_cm: Double?
    let avgvis_km: Double?
    let avgvis_miles: Double?
    let avghumidity: Int?
    let daily_will_it_rain: Int?
    let daily_chance_of_rain: Int?
    let daily_will_it_snow: Int?
    let daily_chance_of_snow: Int?
    let condition: Condition?
    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case maxtemp_c = "maxtemp_c"
        case maxtemp_f = "maxtemp_f"
        case mintemp_c = "mintemp_c"
        case mintemp_f = "mintemp_f"
        case avgtemp_c = "avgtemp_c"
        case avgtemp_f = "avgtemp_f"
        case maxwind_mph = "maxwind_mph"
        case maxwind_kph = "maxwind_kph"
        case totalprecip_mm = "totalprecip_mm"
        case totalprecip_in = "totalprecip_in"
        case totalsnow_cm = "totalsnow_cm"
        case avgvis_km = "avgvis_km"
        case avgvis_miles = "avgvis_miles"
        case avghumidity = "avghumidity"
        case daily_will_it_rain = "daily_will_it_rain"
        case daily_chance_of_rain = "daily_chance_of_rain"
        case daily_will_it_snow = "daily_will_it_snow"
        case daily_chance_of_snow = "daily_chance_of_snow"
        case condition = "condition"
        case uv = "uv"
    }

    // Custom initializer
    init(maxtemp_c: Double?, maxtemp_f: Double?, mintemp_c: Double?, mintemp_f: Double?,
         avgtemp_c: Double?, avgtemp_f: Double?, maxwind_mph: Double?, maxwind_kph: Double?,
         totalprecip_mm: Double?, totalprecip_in: Double?, totalsnow_cm: Double?, avgvis_km: Double?,
         avgvis_miles: Double?, avghumidity: Int?, daily_will_it_rain: Int?, daily_chance_of_rain: Int?,
         daily_will_it_snow: Int?, daily_chance_of_snow: Int?, condition: Condition?, uv: Double?) {
        self.maxtemp_c = maxtemp_c
        self.maxtemp_f = maxtemp_f
        self.mintemp_c = mintemp_c
        self.mintemp_f = mintemp_f
        self.avgtemp_c = avgtemp_c
        self.avgtemp_f = avgtemp_f
        self.maxwind_mph = maxwind_mph
        self.maxwind_kph = maxwind_kph
        self.totalprecip_mm = totalprecip_mm
        self.totalprecip_in = totalprecip_in
        self.totalsnow_cm = totalsnow_cm
        self.avgvis_km = avgvis_km
        self.avgvis_miles = avgvis_miles
        self.avghumidity = avghumidity
        self.daily_will_it_rain = daily_will_it_rain
        self.daily_chance_of_rain = daily_chance_of_rain
        self.daily_will_it_snow = daily_will_it_snow
        self.daily_chance_of_snow = daily_chance_of_snow
        self.condition = condition
        self.uv = uv
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxtemp_c = try values.decodeIfPresent(Double.self, forKey: .maxtemp_c)
        maxtemp_f = try values.decodeIfPresent(Double.self, forKey: .maxtemp_f)
        mintemp_c = try values.decodeIfPresent(Double.self, forKey: .mintemp_c)
        mintemp_f = try values.decodeIfPresent(Double.self, forKey: .mintemp_f)
        avgtemp_c = try values.decodeIfPresent(Double.self, forKey: .avgtemp_c)
        avgtemp_f = try values.decodeIfPresent(Double.self, forKey: .avgtemp_f)
        maxwind_mph = try values.decodeIfPresent(Double.self, forKey: .maxwind_mph)
        maxwind_kph = try values.decodeIfPresent(Double.self, forKey: .maxwind_kph)
        totalprecip_mm = try values.decodeIfPresent(Double.self, forKey: .totalprecip_mm)
        totalprecip_in = try values.decodeIfPresent(Double.self, forKey: .totalprecip_in)
        totalsnow_cm = try values.decodeIfPresent(Double.self, forKey: .totalsnow_cm)
        avgvis_km = try values.decodeIfPresent(Double.self, forKey: .avgvis_km)
        avgvis_miles = try values.decodeIfPresent(Double.self, forKey: .avgvis_miles)
        avghumidity = try values.decodeIfPresent(Int.self, forKey: .avghumidity)
        daily_will_it_rain = try values.decodeIfPresent(Int.self, forKey: .daily_will_it_rain)
        daily_chance_of_rain = try values.decodeIfPresent(Int.self, forKey: .daily_chance_of_rain)
        daily_will_it_snow = try values.decodeIfPresent(Int.self, forKey: .daily_will_it_snow)
        daily_chance_of_snow = try values.decodeIfPresent(Int.self, forKey: .daily_chance_of_snow)
        condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
        uv = try values.decodeIfPresent(Double.self, forKey: .uv)
    }
}

