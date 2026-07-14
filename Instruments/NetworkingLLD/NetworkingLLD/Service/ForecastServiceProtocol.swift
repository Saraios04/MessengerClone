//
//  ForecastServiceProtocol.swift
//  NetworkingLLD
//
//  Created by seemakus on 7/13/26.
//

import Foundation

protocol ForecastServiceProtocol {
    func fetchForecast(latitude: Double, longitude: Double) async throws -> ForecastDTO
}
