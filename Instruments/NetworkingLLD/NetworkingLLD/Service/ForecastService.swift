//
//  ForecastService.swift
//  NetworkingLLD
//
//  Created by seemakus on 7/9/26.
//

import Foundation

class ForecastService: ForecastServiceProtocol {
     
    private let apiClient : APIClient
    
    init(apiClient: APIClient){
        self.apiClient = apiClient
    }
    func fetchForecast(latitude: Double, longitude: Double) async throws -> ForecastDTO {
        let latStr = String(latitude)
        let longStr = String(longitude)
        let endPoint: ForecastEndpoint  = .forecast(latitude: latStr, longitude: longStr)
        let urlRequest = endPoint.request
        return try await apiClient.fetch(request: urlRequest)
    }

    
    
}
