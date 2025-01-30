//
//  AppState.swift
//  LUNA
//
//  Created by Ivan Montes on 10/15/24.
//

import Foundation
import MapKit
import SwiftUI

class AppState: ObservableObject {
    @Published var modalOpen: Bool = false
    @Published var currentPin: PinData = PinData(
            id: 0,
            title: "",
            details: "",
            mediaUrls: [],
            coordinate: Coordinate(latitude: 0.0, longitude: 0.0),
            creationDate: Date(),
            userID: 0
        )
    
    /// map related states
    @Published var cameraPosition: MapCameraPosition = .region(.userRegion)
    @Published var centerCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D.userLocation
    @Published var selectedAnnotation : MKAnnotation?
    
}
