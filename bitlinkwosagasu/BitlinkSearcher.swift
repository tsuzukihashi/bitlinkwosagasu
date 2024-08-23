//
//  BitlinkSearcher.swift
//  bitlinkwosagasu
//
//  Created by ryo.tsuzukihashi on 2024/08/23.
//

import CoreLocation
import Foundation

@Observable
final class BitlinkSearcher: NSObject {
    var locationManager: CLLocationManager?
    var lastDistance = CLProximity.unknown
    var lastAccurancy: CLLocationAccuracy?

    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    }

    func startScanning() {
        let constraint = CLBeaconIdentityConstraint(
            uuid: UUID(uuidString: "41462998-6CEB-4511-9D46-1F7E27AA6572")!,
            major: 18,
            minor: 5
        )
        locationManager?.startMonitoring(for: CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "bitlink"))
        locationManager?.startRangingBeacons(satisfying: constraint)
    }

    func update(distance: CLProximity){
        lastDistance = distance
    }
}

extension BitlinkSearcher: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first {
            lastDistance = beacon.proximity
            lastAccurancy = beacon.accuracy
        } else {
            lastDistance = .unknown
            lastAccurancy = nil
        }
    }
}
