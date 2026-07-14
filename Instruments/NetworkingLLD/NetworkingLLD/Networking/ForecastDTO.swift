//
//  ForecastDTO.swift
//  NetworkingLLD
//
//  Created by seemakus on 7/12/26.
//

import Foundation

struct ForecastDTO : Codable {
    let latitude: Double
    let longitude: Double
    let current: CurrentDTO
    let currentUnits : CurrentUnitsDTO
    
    enum CodingKeys: String,CodingKey {
        case latitude, longitude, current
        case currentUnits = "current_units"
    }
}
struct CurrentDTO: Codable {
    let temperature : Double
    let relativeHumidity: Double
    let windSpeed: Double
    
    enum CodingKeys: String, CodingKey {
       case relativeHumidity = "relative_humidity_2m"
       case temperature = "temperature_2m"
       case windSpeed  =  "wind_speed_10m"
        
    }
}

struct CurrentUnitsDTO : Codable {
    let temperatureUnit : String
    let relativeHumidityUnit : String
    let windSpeedUnit : String
    
    enum CodingKeys : String, CodingKey {
        case temperatureUnit = "temperature_2m"
        case relativeHumidityUnit = "relative_humidity_2m"
        case windSpeedUnit = "wind_speed_10m"
        
    }
}
