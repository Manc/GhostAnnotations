//
//  MapViewController.swift
//  GhostAnnotations
//
//  Created by Nick Singleton on 21/11/2020.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
	@IBOutlet private weak var mapView: MKMapView!
	
	private enum DisplayMode {
		case onlyPurple
		case onlyOrange
		case onlyImage
		case all
		case none
	}
	
	private var displayMode: DisplayMode = .none {
		willSet {
			/// Note: It looks like it doesn't matter whether we remove all annotations or whether we filter out
			/// clusters. The clusters will have to go anyway. Not tested with `MKUserLocation` though.

			/// Remove *all* annotations.
			 let annotationsToRemove = mapView.annotations
			
			/// Remove all annotations from the map, except clusters and user location markers.
//			let annotationsToRemove = mapView.annotations.filter { annotation in
//				return !(annotation.isKind(of: MKClusterAnnotation.self) || annotation.isKind(of: MKUserLocation.self))
//			}
			
			mapView.removeAnnotations(annotationsToRemove)
			print("Setting displayMode to \(String(describing: newValue)); removed \(annotationsToRemove.count) annotations from map.")
		}
		
		didSet {
			/// Now add the appropriate annotations to the map.
			switch displayMode {
			case .onlyPurple:
				mapView.addAnnotations(allPurpleAnnotations)
			case .onlyOrange:
				mapView.addAnnotations(allOrangeAnnotations)
			case .onlyImage:
				mapView.addAnnotations(allImageAnnotations)
			case .all:
				mapView.addAnnotations(allPurpleAnnotations + allOrangeAnnotations + allImageAnnotations)
			case .none:
				/// Don't add anything.
				break
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		mapView.delegate = self
		
		registerMapAnnotationViews()

		centerMapOnSanFrancisco()
		
		/// Start without any annotations on the map.
		displayMode = .none
	}
	
	private func registerMapAnnotationViews() {
		/// For `MyColorAnnotation` annotations
		mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
		
		/// For `ImageAnnotation` annotations
		mapView.register(ImageAnnotationView.self, forAnnotationViewWithReuseIdentifier: ImageAnnotationView.viewReuseID)

		/// For cluster annotations
//		mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
	}
	
	private func centerMapOnSanFrancisco() {
		let span = MKCoordinateSpan(latitudeDelta: 0.011, longitudeDelta: 0.008)
		let center = CLLocationCoordinate2D(latitude: 37.8058, longitude: -122.4135)
		mapView.setRegion(MKCoordinateRegion(center: center, span: span), animated: false)
	}
	
	
	
	// MARK: Button actions
	
	@IBAction private func showPurple(_ sender: Any) {
		print("Show Purple")
		displayMode = .onlyPurple
	}
	
	@IBAction private func showOrange(_ sender: Any) {
		print("Show Orange")
		displayMode = .onlyOrange
	}
	
	@IBAction func showImage(_ sender: Any) {
		print("Show Image")
		displayMode = .onlyImage
	}
	
	@IBAction private func toggleAll(_ sender: Any) {
		print("Toggle All")
		if displayMode == .none {
			displayMode = .all
		} else {
			displayMode = .none
		}
	}
	
}



// MARK: - Map View Delegate

extension MapViewController: MKMapViewDelegate {
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//		print("Map is asking for view for annotation: \(String(describing: annotation))")
		
		if let colorAnnotation = annotation as? MyColorAnnotation {
			let view = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: colorAnnotation) as! MKMarkerAnnotationView
			if colorAnnotation.type == .purple {
				print("Map is asking for view for a purple annotation.")
				/// Purple annotations may be clustered.
				view.clusteringIdentifier = "purp"
				view.markerTintColor = .systemPurple
			} else {
				print("Map is asking for view for an orange annotation.")
				/// Orange
				view.markerTintColor = .systemOrange
			}
			return view
		}
		
		if let imageAnnotation = annotation as? ImageAnnotation {
			print("Map is asking for view for an image annotation.")
			let view = mapView.dequeueReusableAnnotationView(withIdentifier: ImageAnnotationView.viewReuseID, for: imageAnnotation) // as! ImageAnnotationView
			print("Dequeued this: \(view)")
			return view
		}
		
		if let clusterAnnotation = annotation as? MKClusterAnnotation {
			print("Map is asking for a cluster annotation.")
			let view = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier, for: clusterAnnotation) as! MKMarkerAnnotationView
			view.markerTintColor = .black
			return view
		}
		
		/// For all other kinds of annotations (`MKUserLocation`) we return `nil`.
		print("Map is asking for view for a different kind of annotation: \(String(describing: annotation))")
		return nil
	}
	
}
