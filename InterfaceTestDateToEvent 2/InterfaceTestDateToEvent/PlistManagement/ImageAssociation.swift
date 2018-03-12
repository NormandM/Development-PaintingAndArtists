//
//  ImageAssociation.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-03-09.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

enum Image: String {
    case AmericanCivilWar
    case WorldWarI
    case Napoleon
    case FrenchRevolution
    case GreatExplorers
    case AncientCivilisation
    case AmericanRevolution
    case SpacePioneers
    case LifeEvolution
    case WorldWarII
    case Diploma
    
    var nameIcone: String {
        switch self {
        case .AmericanCivilWar: return "sword.png"
        case .WorldWarI: return "sword.png"
        case .Napoleon: return "sword.png"
        case .FrenchRevolution: return "che-guevara.png"
        case .GreatExplorers: return "037-compass"
        case .AncientCivilisation: return "047-pillars.png"
        case .AmericanRevolution: return "che-guevara.png"
        case .SpacePioneers: return "037-compass.png"
        case .LifeEvolution: return "planet-earth.png"
        case .WorldWarII: return "sword.png"
        case .Diploma: return "mortarboard.png"
        }
    }

}
// usage
//Image.AmericanCivilWar
