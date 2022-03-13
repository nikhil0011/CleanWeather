//
//  NetworkTests.swift
//  CleanWeatherTests
//
//  Created by Nikhil Nangia on 13/03/22.
//

import XCTest
@testable import CleanWeather
class NetworkTests: XCTestCase {
    func test_performAlwaysSuccessRequest() {
        AlwaysSuccessOutputSpy.recipes(completion: { (results) in
            switch results {
            case .success(let data):
                XCTAssertEqual(data.region, "Americas")
                break
            case .failure(_):
                break
            }
        })
    }
    func test_performAlwaysFailedRequest() {
        AlwaysFailedOutputSpy.forecast(completion: { (results) in
            switch results {
            case .success(_):
                break
            case .failure(let error):
                XCTAssertEqual(error.success, false)
                break
            }
        })
    }
    private class AlwaysSuccessOutputSpy: NetworkClientProtocol {
        static func performRequest<T>(_ router: APIConfiguration?, completion: @escaping HTTPResponse<T>) where T : Decodable {
            let items = Location(name: "atlanta", region: "Americas", country: "USA", lat: 22.3, lon: 29.1)
            completion(.success(items as! T))
        }
        static func recipes(completion: @escaping HTTPResponse<Location>) {
            performRequest(nil, completion: completion)
        }
    }
    private class AlwaysFailedOutputSpy: NetworkClientProtocol {
        static func performRequest<T>(_ router: APIConfiguration?, completion: @escaping HTTPResponse<T>) where T : Decodable {
            let error = GenericResponse("API Failed")
            completion(.failure(error))

        }
        static func forecast(completion: @escaping HTTPResponse<Location>) {
            performRequest(nil, completion: completion)
        }
    }
}
