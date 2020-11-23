//
//  ImageAnnotationView.swift
//  GhostAnnotations
//
//  Created by Nick Singleton on 23/11/2020.
//

import UIKit
import MapKit

class ImageAnnotationView: MKAnnotationView {
	public static let viewReuseID: String = "image"
	
	/// Note: Having this `prepareForReuse` method or not doesn't make a difference.
	override func prepareForReuse() {
		super.prepareForReuse()

		print("[Image] prepareForReuse")
		self.image = nil
	}
	
	override func prepareForDisplay() {
		super.prepareForDisplay()
		
		if let imageAnnotation = annotation as? ImageAnnotation {
			print("[Image \"\(imageAnnotation.title!)\"] prepareForDisplay")
			
			self.image = UIImage(named: imageAnnotation.icon.rawValue)
			
			collisionMode = .circle
			canShowCallout = false
			displayPriority = .defaultLow
		}
	}
}
