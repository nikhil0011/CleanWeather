//
//  ForecastDataRepository.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 13/03/22.
//

import Foundation
import CoreData
import RealmSwift

protocol ForecastRepository {
    func create(_ forecast: FORECAST_ITEM)
    func getAll() -> [FORECAST_ITEM]?
    func get(by name: String) -> FORECAST_ITEM?
    func update(forecast: FORECAST_ITEM) -> Bool
    func delete(name: String) -> Bool
}

struct ForecastDataRepository : ForecastRepository {
    let realm = try! Realm()
    func create(_ forecast: FORECAST_ITEM) {
        try! realm.write {
            let object = RMForecastData()
            object.id = UUID()
            object.location?.name =  forecast.location.name
            object.location?.region =  forecast.location.region
            object.location?.country =  forecast.location.country
            object.location?.lat =  forecast.location.lat
            object.location?.long =  forecast.location.lon

            object.current?.feelslikeF = forecast.current.feelslikeF
            object.current?.feelslikeC = forecast.current.feelslikeC
            object.current?.isDay = forecast.current.isDay
            object.current?.tempF = forecast.current.tempF
            object.current?.tempC = forecast.current.tempC
            object.current?.lastUpdated = forecast.current.lastUpdated

            let rmForecastDays: List<RMForecastday> = List<RMForecastday>()

            forecast.forecast.forecastday.forEach {
                let rmForecastDay: RMForecastday = RMForecastday()
                rmForecastDay.dateEpoch = $0.dateEpoch
                rmForecastDay.date = $0.date
                // MARK: Setup Day object
                let day: RMDay = RMDay()
                day.uv = $0.day.uv
                day.mintempF = $0.day.mintempF
                day.mintempC = $0.day.mintempC
                day.maxtempC = $0.day.maxtempC
                day.maxtempF = $0.day.maxtempF
                day.dailyChanceOfSnow = $0.day.dailyChanceOfSnow
                rmForecastDay.day = day
                // MARK: Setup Hour Object
                let rmHours: List<RMHour> = List<RMHour>()
                $0.hour.forEach {
                    let rmHour = RMHour()
                    rmHour.uv = $0.uv
                    rmHour.tempF = $0.tempF
                    rmHour.tempC = $0.tempC
                    rmHour.isDay = $0.isDay
                    rmHour.feelslikeF = $0.feelslikeF
                    rmHour.feelslikeC = $0.feelslikeC
                    rmHour.time = $0.time
                    rmHour.humidity = $0.humidity
                    rmHour.cloud = $0.cloud
                    rmHours.append(rmHour)
                }
                rmForecastDay.hour = rmHours
                rmForecastDays.append(rmForecastDay)
            }
            object.forecast?.forecastDay = rmForecastDays

            realm.add(object, update: .all)
        }
    }
    
    func getAll() -> [FORECAST_ITEM]? {
        return realm.objects(RMForecastData.self).map { object in
            return object.makeItem()
        }
    }
    
    func get(by name: String) -> FORECAST_ITEM? {
        let item = getItem(by: name)
        guard item != nil else { return nil }
        return item?.makeItem()
     }
    
    func update(forecast: FORECAST_ITEM) -> Bool {
        let result = getItem(by: forecast.location.name)
        guard let object = result  else {
            return false
        }
        try! realm.write {
            object.location?.region =  forecast.location.region
            object.location?.country =  forecast.location.country
            object.location?.lat =  forecast.location.lat
            object.location?.long =  forecast.location.lon

            object.current?.feelslikeF = forecast.current.feelslikeF
            object.current?.feelslikeC = forecast.current.feelslikeC
            object.current?.isDay = forecast.current.isDay
            object.current?.tempF = forecast.current.tempF
            object.current?.tempC = forecast.current.tempC
            object.current?.lastUpdated = forecast.current.lastUpdated

            let rmForecastDays: List<RMForecastday> = List<RMForecastday>()

            forecast.forecast.forecastday.forEach {
                let rmForecastDay: RMForecastday = RMForecastday()
                rmForecastDay.dateEpoch = $0.dateEpoch
                rmForecastDay.date = $0.date
                // MARK: Setup Day object
                let day: RMDay = RMDay()
                day.uv = $0.day.uv
                day.mintempF = $0.day.mintempF
                day.mintempC = $0.day.mintempC
                day.maxtempC = $0.day.maxtempC
                day.maxtempF = $0.day.maxtempF
                day.dailyChanceOfSnow = $0.day.dailyChanceOfSnow
                rmForecastDay.day = day
                // MARK: Setup Hour Object
                let rmHours: List<RMHour> = List<RMHour>()
                $0.hour.forEach {
                    let rmHour = RMHour()
                    rmHour.uv = $0.uv
                    rmHour.tempF = $0.tempF
                    rmHour.tempC = $0.tempC
                    rmHour.isDay = $0.isDay
                    rmHour.feelslikeF = $0.feelslikeF
                    rmHour.feelslikeC = $0.feelslikeC
                    rmHour.time = $0.time
                    rmHour.humidity = $0.humidity
                    rmHour.cloud = $0.cloud
                    rmHours.append(rmHour)
                }
                rmForecastDay.hour = rmHours
                rmForecastDays.append(rmForecastDay)
            }
            object.forecast?.forecastDay = rmForecastDays
        }
        return true
    }
    func delete(name: String) -> Bool {
        let object = getItem(by: name)
        guard let data = object  else {
            return false
        }
        try! realm.write {
            // Delete the LocalOnlyQsTask.
            realm.delete(data)
        }
        return true
    }
    private func getItem(by name: String) -> RMForecastData? {
        let tasks = realm.objects(RMForecastData.self)
        let object = tasks.where {
            $0.location.name.contains(name)
        }
        return object.first
    }
}
