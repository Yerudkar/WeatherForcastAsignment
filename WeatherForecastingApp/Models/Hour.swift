/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Hour : Codable {
    let last_updated_epoch: Int?
    let last_updated: String?
    let temp_c: Double?
    let temp_f: Double?
    let is_day: Int?
    let condition: Condition?
    let wind_mph: Double?
    let wind_kph: Double?
    let wind_degree: Int?
    let wind_dir: String?
    let pressure_mb: Double?
    let pressure_in: Double?
    let precip_mm: Double?
    let precip_in: Double?
    let humidity: Int?
    let cloud: Int?
    let feelslike_c: Double?
    let feelslike_f: Double?
    let windchill_c: Double?
    let windchill_f: Double?
    let heatindex_c: Double?
    let heatindex_f: Double?
    let dewpoint_c: Double?
    let dewpoint_f: Double?
    let vis_km: Double?
    let vis_miles: Double?
    let uv: Double?
    let gust_mph: Double?
    let gust_kph: Double?

    enum CodingKeys: String, CodingKey {
        case last_updated_epoch
        case last_updated
        case temp_c
        case temp_f
        case is_day
        case condition
        case wind_mph
        case wind_kph
        case wind_degree
        case wind_dir
        case pressure_mb
        case pressure_in
        case precip_mm
        case precip_in
        case humidity
        case cloud
        case feelslike_c
        case feelslike_f
        case windchill_c
        case windchill_f
        case heatindex_c
        case heatindex_f
        case dewpoint_c
        case dewpoint_f
        case vis_km
        case vis_miles
        case uv
        case gust_mph
        case gust_kph
    }

    // Decoder initializer
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        last_updated_epoch = try values.decodeIfPresent(Int.self, forKey: .last_updated_epoch)
        last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
        temp_c = try values.decodeIfPresent(Double.self, forKey: .temp_c)
        temp_f = try values.decodeIfPresent(Double.self, forKey: .temp_f)
        is_day = try values.decodeIfPresent(Int.self, forKey: .is_day)
        condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
        wind_mph = try values.decodeIfPresent(Double.self, forKey: .wind_mph)
        wind_kph = try values.decodeIfPresent(Double.self, forKey: .wind_kph)
        wind_degree = try values.decodeIfPresent(Int.self, forKey: .wind_degree)
        wind_dir = try values.decodeIfPresent(String.self, forKey: .wind_dir)
        pressure_mb = try values.decodeIfPresent(Double.self, forKey: .pressure_mb)
        pressure_in = try values.decodeIfPresent(Double.self, forKey: .pressure_in)
        precip_mm = try values.decodeIfPresent(Double.self, forKey: .precip_mm)
        precip_in = try values.decodeIfPresent(Double.self, forKey: .precip_in)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        cloud = try values.decodeIfPresent(Int.self, forKey: .cloud)
        feelslike_c = try values.decodeIfPresent(Double.self, forKey: .feelslike_c)
        feelslike_f = try values.decodeIfPresent(Double.self, forKey: .feelslike_f)
        windchill_c = try values.decodeIfPresent(Double.self, forKey: .windchill_c)
        windchill_f = try values.decodeIfPresent(Double.self, forKey: .windchill_f)
        heatindex_c = try values.decodeIfPresent(Double.self, forKey: .heatindex_c)
        heatindex_f = try values.decodeIfPresent(Double.self, forKey: .heatindex_f)
        dewpoint_c = try values.decodeIfPresent(Double.self, forKey: .dewpoint_c)
        dewpoint_f = try values.decodeIfPresent(Double.self, forKey: .dewpoint_f)
        vis_km = try values.decodeIfPresent(Double.self, forKey: .vis_km)
        vis_miles = try values.decodeIfPresent(Double.self, forKey: .vis_miles)
        uv = try values.decodeIfPresent(Double.self, forKey: .uv)
        gust_mph = try values.decodeIfPresent(Double.self, forKey: .gust_mph)
        gust_kph = try values.decodeIfPresent(Double.self, forKey: .gust_kph)
    }

    // Custom initializer
    init(
        last_updated_epoch: Int?,
        last_updated: String?,
        temp_c: Double?,
        temp_f: Double?,
        is_day: Int?,
        condition: Condition?,
        wind_mph: Double?,
        wind_kph: Double?,
        wind_degree: Int?,
        wind_dir: String?,
        pressure_mb: Double?,
        pressure_in: Double?,
        precip_mm: Double?,
        precip_in: Double?,
        humidity: Int?,
        cloud: Int?,
        feelslike_c: Double?,
        feelslike_f: Double?,
        windchill_c: Double?,
        windchill_f: Double?,
        heatindex_c: Double?,
        heatindex_f: Double?,
        dewpoint_c: Double?,
        dewpoint_f: Double?,
        vis_km: Double?,
        vis_miles: Double?,
        uv: Double?,
        gust_mph: Double?,
        gust_kph: Double?
    ) {
        self.last_updated_epoch = last_updated_epoch
        self.last_updated = last_updated
        self.temp_c = temp_c
        self.temp_f = temp_f
        self.is_day = is_day
        self.condition = condition
        self.wind_mph = wind_mph
        self.wind_kph = wind_kph
        self.wind_degree = wind_degree
        self.wind_dir = wind_dir
        self.pressure_mb = pressure_mb
        self.pressure_in = pressure_in
        self.precip_mm = precip_mm
        self.precip_in = precip_in
        self.humidity = humidity
        self.cloud = cloud
        self.feelslike_c = feelslike_c
        self.feelslike_f = feelslike_f
        self.windchill_c = windchill_c
        self.windchill_f = windchill_f
        self.heatindex_c = heatindex_c
        self.heatindex_f = heatindex_f
        self.dewpoint_c = dewpoint_c
        self.dewpoint_f = dewpoint_f
        self.vis_km = vis_km
        self.vis_miles = vis_miles
        self.uv = uv
        self.gust_mph = gust_mph
        self.gust_kph = gust_kph
    }
}
