//
//  ContentView.swift
//  detectLocation
//
//  Created by Rangga Biner on 17/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let status = locationManager.authorizationStatus {
                switch status {
                case .notDetermined:
                    Text("Requesting location access...")
                case .restricted, .denied:
                    Text("Location access denied.")
                case .authorizedAlways, .authorizedWhenInUse:
                    VStack {
                        Text("Province: \(locationManager.province)")
                        Text("City: \(locationManager.city)")
                    }
                default:
                    Text("Unexpected status")
                }
            } else {
                Text("Checking location authorization status...")
            }
        }
        .padding()
        .onAppear {
            locationManager.requestLocation()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
