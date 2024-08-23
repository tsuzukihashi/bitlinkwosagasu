//
//  CLProximityExt.swift
//  bitlinkwosagasu
//
//  Created by ryo.tsuzukihashi on 2024/08/23.
//

import CoreLocation
import Foundation

extension CLProximity {
    var displayName: String {
        switch self {
        case .unknown:
            "わからない😔"
        case .immediate:
            "とても近い☺️"
        case .near:
            "近い😃"
        case .far:
            "遠い😭"
        @unknown default:
            fatalError()
        }
    }
}
