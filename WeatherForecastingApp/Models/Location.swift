/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Location: Codable {
    let name: String?
    let region: String?
    let country: String?
    let lat: Double?
    let lon: Double?
    let tz_id: String?
    let localtime_epoch: Int?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
        case lat
        case lon
        case tz_id
        case localtime_epoch
        case localtime
    }
    
    // Custom initializer
    init(name: String?, region: String?, country: String?, lat: Double?, lon: Double?, tz_id: String?, localtime_epoch: Int?, localtime: String?) {
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.tz_id = tz_id
        self.localtime_epoch = localtime_epoch
        self.localtime = localtime
    }

    // Decoder initializer
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        tz_id = try values.decodeIfPresent(String.self, forKey: .tz_id)
        localtime_epoch = try values.decodeIfPresent(Int.self, forKey: .localtime_epoch)
        localtime = try values.decodeIfPresent(String.self, forKey: .localtime)
    }

    
}

