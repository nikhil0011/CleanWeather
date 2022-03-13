//
//  ForecastListingDataSourceTests.swift
//  CleanWeatherTests
//
//  Created by Nikhil Nangia on 13/03/22.
//

import XCTest
@testable import CleanWeather

class ForecastListingDataSourceTests: XCTestCase {
    let viewModels = [[ForecastItemListingViewModel(day: Forecastday(date: "2020-12-01", dateEpoch: 5678, day: Day(maxtempC: 40.0, maxtempF: 40.0, mintempC: 24.0, mintempF: 78.0, dailyChanceOfSnow: 3, uv: 9), hour: [Hour(time: "2020-12-02 12:00", tempC: 30.0, tempF: 70.0, isDay: 0, humidity: 90, cloud: 90, feelslikeC: 80.0, feelslikeF: 90.0, uv: 2)]))]]
    let collection = ForecastListingView().collectionView
    lazy var dataSourceSpy =  ForecastListingDataSource(collectionView: collection, array: viewModels)
    func testNumberOfRows() {
        let items = dataSourceSpy.provider.numberOfItems(in: 0)
        XCTAssertEqual(items, viewModels[0].count)
    }
    func testNumberOfSection() {
        let items = dataSourceSpy.provider.numberOfSections()
        XCTAssertEqual(items, viewModels.count)
    }
    func testCollectionViewNotNil() {
        let cv = dataSourceSpy.collectionView
        XCTAssertNotNil(cv)
    }
    func testCollectionViewCellNotNil() {
        let cell = dataSourceSpy.collectionView(dataSourceSpy.collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as? ForecastListingItemCollectionViewCell
        XCTAssertNotNil(cell)
    }
    func testCollectionViewCellFrame() {
        if let cell = dataSourceSpy.collectionView(dataSourceSpy.collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as? ForecastListingItemCollectionViewCell {
            XCTAssertEqual(cell.frame, .zero)
        }
    }
    func testCollectionViewHasDelegate() {
        XCTAssertNotNil(dataSourceSpy.collectionView.delegate)
    }
    func testCollectionViewHasDataSource() {
        XCTAssertNotNil(dataSourceSpy.collectionView.dataSource)
    }

}
