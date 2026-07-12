//
//  WeatherEndpoint.swift
//  NetworkingLLD
//
//  Created by seemakus on 7/12/26.
//

import Foundation

enum WeatherEndpoint {
    
    case current(city: String)
    case forecast(latitude: String, longitude: String, current: String)
    
    var path : String {
        
        switch self {
            case .current:
                return "/current"
            
            case .forecast:
                return "/v1/forecast"
        }
    }
    
    var queryParameters: [URLQueryItem] {
        switch self {
            case .current(let city):
                return [URLQueryItem(name:"city", value: city)]
                
            case .forecast(let latitude,let longitude, let current):
                return [URLQueryItem(name:"latitude", value: latitude),
                        URLQueryItem(name:"longitude", value: longitude),
                        URLQueryItem(name:"current", value: current)]
        }
    }
    var httpMethod : String {
        switch self {
            case .current:
               return "GET"
            
            case .forecast:
                return "GET"
        }
    }
    
    var request: URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host =  "api.open-meteo.com"
        components.path = path
        components.queryItems = queryParameters
        
        let url = components.url!
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        return request
        
    }
}
