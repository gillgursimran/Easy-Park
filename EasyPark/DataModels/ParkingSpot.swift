//
//  ParkingSpot.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2024-03-05.
//

import Foundation

public struct ParkingSpot: Codable {
    var id: String?
    var name: String?
    var leadingIcon: String?
    var locationType: LocationType?
    var location: Coordinate?

    enum LocationType: String, Codable {
        case ParkingLot = "Parking Lot"
        case ParkingGarage = "Parking Garage"
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name = "name"
        case leadingIcon = "leading_icon"
        case locationType = "location_type"
        case location = "location"
    }
    
    init(
        id: String? = nil,
        name: String? = nil,
        leadingIcon: String? = nil,
        locationType: LocationType? = nil,
        location: Coordinate? = nil
    ) {
        self.id = id
        self.name = name
        self.leadingIcon = leadingIcon
        self.locationType = locationType
        self.location = location
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        leadingIcon = try values.decode(String.self, forKey: .leadingIcon)
        locationType = try values.decode(LocationType.self, forKey: .locationType)
        location = try values.decode(Coordinate.self, forKey: .location)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(leadingIcon, forKey: .leadingIcon)
        try container.encode(locationType, forKey: .locationType)
    }
}

public struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        latitude = try values.decode(Double.self, forKey: .latitude)
//        longitude = try values.decode(Double.self, forKey: .longitude)
//    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
}
