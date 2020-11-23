//
//  MyColorAnnotation.swift
//  GhostAnnotations
//
//  Created by Nick Singleton on 21/11/2020.
//

import MapKit

enum MyAnnotationType {
	case purple
	case orange
}

class MyColorAnnotation: NSObject, MKAnnotation {
	let title: String?
	
	let type: MyAnnotationType
	
	// This property must be key-value observable, which the `@objc dynamic` attributes provide.
	// @objc dynamic var coordinate = CLLocationCoordinate2D(latitude: 37.810_000, longitude: -122.477_450)
	var coordinate: CLLocationCoordinate2D
	
	init(title: String, type: MyAnnotationType, coordinate: CLLocationCoordinate2D) {
		self.title = title
		self.type = type
		self.coordinate = coordinate
	}
	
}
