//
//  homeView.swift
//  LUNA
//
//  Created by Ivan Montes on 10/12/24.
//

import Foundation
import SwiftUI
import MapKit

struct homeView : View {
    @EnvironmentObject var  appState : AppState
    
    var body : some View {
        VStack {
            Map(position: $appState.cameraPosition) {
                Annotation("", coordinate: .userLocation) {
                    ZStack {
                        Circle()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(Color.blue)
                    }
                }
            }
            /// map styling
            .mapStyle(
                .standard(
                    elevation: .flat,
                    pointsOfInterest: .excludingAll,
                    showsTraffic: false
                    
                )
                
                
            )
            
            /// updating the center coordinates whenever map moves
            .onMapCameraChange {
                MapCameraUpdateContext in
                appState.centerCoordinate = CLLocationCoordinate2D(latitude: MapCameraUpdateContext.camera.centerCoordinate.latitude,
                                                                   longitude: MapCameraUpdateContext.camera.centerCoordinate.longitude)
                appState.cameraPosition = .region(MapCameraUpdateContext.region)
            }
            
            /// Center cursor
            .overlay(alignment: .center) {
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color.gray)
            }
            
            ///
            
            
        }
    }
}

/// Map related extensions

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 40.77229781434351, longitude: -73.97422193577815)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation,
                     latitudinalMeters: 500,
                     longitudinalMeters: 500
        )
    }
}

#Preview {
    homeView()
}
