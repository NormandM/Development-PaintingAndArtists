//
//  DarkSkyError.swift
//  FiveDaysWeatherForeCast
//
//  Created by Normand Martin on 17-06-24.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case invalidUrl
    case jsonParsingFailure
    case couldNotguetCoordinates
    
}
