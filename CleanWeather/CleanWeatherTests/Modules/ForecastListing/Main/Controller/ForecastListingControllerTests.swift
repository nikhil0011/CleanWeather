//
//  ForecastListingControllerTests.swift
//  CleanWeatherTests
//
//  Created by Nikhil Nangia on 13/03/22.
//

import XCTest
@testable import CleanWeather

class ForecastListingControllerTests: XCTestCase {
    var viewControllerUnderTest: ForecastListingViewController  = ForecastListingViewController()
    override func setUp() {
        super.setUp()
        viewControllerUnderTest.loadViewIfNeeded()
    }
  
    func testHasAView() {
        XCTAssertNotNil(viewControllerUnderTest.listView)
    }
    func testHasACollectionView() {
        XCTAssertNotNil(viewControllerUnderTest.listView.collectionView)
    }
}
