//
//  RM_ForecastData.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 13/03/22.
//

import Foundation
import RealmSwift

extension RealmSwift.List: Decodable where Element: Decodable {
    public convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.singleValueContainer()
        let decodedElements = try container.decode([Element].self)
        self.append(objectsIn: decodedElements)
    }
}

extension RealmSwift.List: Encodable where Element: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.map { $0 })
    }
}
class RMForecastData: Object {
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var location: RMLocation? = RMLocation()
    @objc dynamic var current: RMCurrent? = RMCurrent()
    @objc dynamic var forecast: RMForecast? = RMForecast()

    override static func primaryKey() -> String? {
        return "id"
    }
    func makeItem() -> FORECAST_ITEM {
        FORECAST_ITEM(location: location!.makeItem(), current: current!.makeItem(), forecast: forecast!.makeItem())
    }
}
class RMLocation: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var region: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var lat: Double = 0.0
    @objc dynamic var long: Double = 0.0
    
    override static func primaryKey() -> String? {
        return "name"
    }
    func makeItem() -> Location {
        Location(name: name, region: region, country: country, lat: lat, lon: long)
    }
}
class RMCurrent: Object {
    @objc dynamic var lastUpdated: String = ""
    @objc dynamic var isDay: Int = 0
    @objc dynamic var tempC: Double = 0.0
    @objc dynamic var tempF: Double = 0.0
    @objc dynamic var feelslikeC: Double = 0.0
    @objc dynamic var feelslikeF: Double = 0.0
    
    override static func primaryKey() -> String? {
        return nil
    }
    func makeItem() -> Current {
        Current(lastUpdated: lastUpdated, tempC: tempC, tempF: tempF, isDay: isDay, feelslikeC: feelslikeC, feelslikeF: feelslikeF)
    }
}
class RMForecast: Object {
//    @objc dynamic
    var forecastDay: List<RMForecastday> = List<RMForecastday>()
    
    override static func primaryKey() -> String? {
        return nil
    }
    func makeItem() -> Forecast {
        var list = [Forecastday]()
        forecastDay.forEach {
            list.append($0.makeItem())
        }
        return Forecast(forecastday: list)
    }
}
class RMForecastday: Object {
    @objc dynamic var date: String = ""
    @objc dynamic var dateEpoch: Int = 0
    @objc dynamic var day: RMDay? = RMDay()
//    @objc dynamic
    var hour: List<RMHour> = List<RMHour>()
    
    override static func primaryKey() -> String? {
        return nil
    }
    func makeItem() -> Forecastday {
        var listOfHours = [Hour]()
        hour.forEach {
            listOfHours.append($0.makeItem())
        }
        return Forecastday(date: date, dateEpoch: dateEpoch, day: day!.makeItem(), hour: listOfHours)
    }
}
class RMHour: Object {
    @objc dynamic var time: String = ""
    @objc dynamic var humidity: Int = 0
    @objc dynamic var isDay: Int = 0
    @objc dynamic var cloud: Int = 0
    
    @objc dynamic var tempC: Double = 0.0
    @objc dynamic var tempF: Double = 0.0
    
    @objc dynamic var uv: Int = 0
    @objc dynamic var feelslikeC: Double = 0.0
    @objc dynamic var feelslikeF: Double = 0.0
    
    override static func primaryKey() -> String? {
        return nil
    }
    func makeItem() -> Hour {
        Hour(time: time, tempC: tempC, tempF: tempF, isDay: isDay, humidity: humidity, cloud: cloud, feelslikeC: feelslikeC, feelslikeF: feelslikeF, uv: uv)
    }
}
class RMDay: Object {
    @objc dynamic var dailyChanceOfSnow: Int = 0
    @objc dynamic var uv: Int = 0
    @objc dynamic var maxtempC: Double = 0.0
    @objc dynamic var maxtempF: Double = 0.0
    @objc dynamic var mintempC: Double = 0.0
    @objc dynamic var mintempF: Double = 0.0
    
    override static func primaryKey() -> String? {
        return nil
    }
    func makeItem() -> Day {
        Day(maxtempC: maxtempC, maxtempF: maxtempF, mintempC: mintempC, mintempF: mintempF, dailyChanceOfSnow: dailyChanceOfSnow, uv: uv)
    }
}
