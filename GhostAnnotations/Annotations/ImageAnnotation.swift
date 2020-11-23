//
//  ImageAnnotation.swift
//  GhostAnnotations
//
//  Created by Nick Singleton on 23/11/2020.
//

import MapKit

class ImageAnnotation: NSObject, MKAnnotation {
	
	enum AnnotationIcon: String {
		case iconA
	}
	
	let title: String?
	
	let icon: AnnotationIcon
	
	// This property must be key-value observable, which the `@objc dynamic` attributes provide.
//	@objc dynamic var coordinate = CLLocationCoordinate2D(latitude: 37.810_000, longitude: -122.477_450)
//	@objc dynamic var coordinate: CLLocationCoordinate2D
	var coordinate: CLLocationCoordinate2D
	
	init(title: String, icon: AnnotationIcon, coordinate: CLLocationCoordinate2D) {
		self.title = title
		self.icon = icon
		self.coordinate = coordinate
	}
	
}
