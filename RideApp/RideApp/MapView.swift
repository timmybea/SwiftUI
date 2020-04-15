//
//  MapView.swift
//  RideApp
//
//  Created by Tim Beals on 4/14/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

//import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var centerCoordinate: CLLocationCoordinate2D
    var mapAnnotations: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setCenter(CLLocationCoordinate2DMake(37.334728, -122.008715), animated: true)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MapView.UIViewType, context: UIViewRepresentableContext<MapView>) {
        
        if mapAnnotations.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
            uiView.addAnnotations(mapAnnotations)
        }
        
    }
    
    func makeCoordinator() -> MapView.Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var mapViewParent: MapView
        
        init(_ parent: MapView) {
            self.mapViewParent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            mapViewParent.centerCoordinate = mapView.centerCoordinate
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        return MapView(centerCoordinate: MKPointAnnotation.appleParkExample.coordinate, mapAnnotations: [MKPointAnnotation.appleParkExample])
    }
}

extension MKPointAnnotation {
    static var appleParkExample: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Apple Park"
        annotation.coordinate = CLLocationCoordinate2DMake(37.334728, -122.008715)
        return annotation
    }
}
