//
//  SampleLocations.swift
//  GhostAnnotations
//
//  Created by Nick Singleton on 21/11/2020.
//

import Foundation
import MapKit


// - MARK: Purple

fileprivate let purpleCoordinates: [CLLocationCoordinate2D] = [
	CLLocationCoordinate2D(latitude: 37.80829400951030, longitude: -122.4152730627360),
	CLLocationCoordinate2D(latitude: 37.80825402868280, longitude: -122.4160176717640),
	CLLocationCoordinate2D(latitude: 37.80626024082920, longitude: -122.4136820075620),
	CLLocationCoordinate2D(latitude: 37.80668688680150, longitude: -122.4120873938080),
	CLLocationCoordinate2D(latitude: 37.80685265297260, longitude: -122.4120923188640),
	CLLocationCoordinate2D(latitude: 37.80609252256230, longitude: -122.4168797785580),
	CLLocationCoordinate2D(latitude: 37.80613287021740, longitude: -122.4167124518850),
	CLLocationCoordinate2D(latitude: 37.8060928979888, longitude: -122.4153193860300),
	CLLocationCoordinate2D(latitude: 37.80602361178840, longitude: -122.4153034416860),
	CLLocationCoordinate2D(latitude: 37.80470187183160, longitude: -122.4134558998210),
	CLLocationCoordinate2D(latitude: 37.80310850622720, longitude: -122.4113553868040),
	CLLocationCoordinate2D(latitude: 37.80503866359720, longitude: -122.4101089303210),
	CLLocationCoordinate2D(latitude: 37.80482926013210, longitude: -122.4118889730250),
	CLLocationCoordinate2D(latitude: 37.8073925107059, longitude: -122.4155474030220),
	CLLocationCoordinate2D(latitude: 37.80698680487830, longitude: -122.4137866436300),
	CLLocationCoordinate2D(latitude: 37.80754811904630, longitude: -122.4124392216800),
	CLLocationCoordinate2D(latitude: 37.80106817831780, longitude: -122.4125470891170),
	CLLocationCoordinate2D(latitude: 37.80082663475440, longitude: -122.4128312565950),
	CLLocationCoordinate2D(latitude: 37.80745028882100, longitude: -122.4148687173370),
	CLLocationCoordinate2D(latitude: 37.80645624092970, longitude: -122.413849503567),
]

let allPurpleAnnotations: [MyColorAnnotation] = purpleCoordinates.enumerated().map { (index, coordinate) -> MyColorAnnotation in
	MyColorAnnotation(title: "🍇 \(index + 1)", type: .purple, coordinate: coordinate)
}


// - MARK: Orange

fileprivate let orangeCoordinates: [CLLocationCoordinate2D] = [
	CLLocationCoordinate2D(latitude: 37.80647698772540, longitude: -122.4137676274490),
	CLLocationCoordinate2D(latitude: 37.8068837827166, longitude: -122.4121661951540),
	CLLocationCoordinate2D(latitude: 37.80624532854520, longitude: -122.4164984042040),
	CLLocationCoordinate2D(latitude: 37.80627052229000, longitude: -122.4153672191350),
	CLLocationCoordinate2D(latitude: 37.80540988172140, longitude: -122.4135836704420),
	CLLocationCoordinate2D(latitude: 37.80522432679650, longitude: -122.415147420265),
	CLLocationCoordinate2D(latitude: 37.80396298945190, longitude: -122.4115132336400),
	CLLocationCoordinate2D(latitude: 37.80500099625520, longitude: -122.4107857518510),
	CLLocationCoordinate2D(latitude: 37.80765928891680, longitude: -122.4138816245890),
	CLLocationCoordinate2D(latitude: 37.80716082504590, longitude: -122.4157349931120),
	CLLocationCoordinate2D(latitude: 37.80776617499160, longitude: -122.4122300695440),
	CLLocationCoordinate2D(latitude: 37.80323890432710, longitude: -122.4164340302210),
	CLLocationCoordinate2D(latitude: 37.80705914044300, longitude: -122.4106876644040),
	CLLocationCoordinate2D(latitude: 37.8074782174311, longitude: -122.414686733823),
	CLLocationCoordinate2D(latitude: 37.80627952093060, longitude: -122.4138251432940),
]

let allOrangeAnnotations: [MyColorAnnotation] = orangeCoordinates.enumerated().map { (index, coordinate) -> MyColorAnnotation in
	MyColorAnnotation(title: "🍊 \(index + 1)", type: .orange, coordinate: coordinate)
}


// - MARK: Image

let allImageAnnotations: [ImageAnnotation] = [
	ImageAnnotation(title: "Image 1", icon: .iconA, coordinate: CLLocationCoordinate2D(latitude: 37.8062178578145, longitude: -122.4168004613510)),
	ImageAnnotation(title: "Image 2", icon: .iconA, coordinate: CLLocationCoordinate2D(latitude: 37.80623760240690, longitude: -122.4166494327780)),
	ImageAnnotation(title: "Image 3", icon: .iconA, coordinate: CLLocationCoordinate2D(latitude: 37.80619983015060, longitude: -122.4168982496470)),
	ImageAnnotation(title: "Image 4", icon: .iconA, coordinate: CLLocationCoordinate2D(latitude: 37.80616785295730, longitude: -122.4153425053770)),
	ImageAnnotation(title: "Image 5", icon: .iconA, coordinate: CLLocationCoordinate2D(latitude: 37.80594865664470, longitude: -122.415284308444)),
]
