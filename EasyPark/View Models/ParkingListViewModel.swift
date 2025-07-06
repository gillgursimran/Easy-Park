//
//  ParkingListViewModel.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2024-03-05.
//

import Foundation
import Core

class ParkingListViewModel: ObservableObject {
    @Published var parkingList: [ParkingSpot] = TestData.testList
    
    func getGroupedItems(_ locations: [ParkingSpot]) -> [GroupedItem] {
        var groupedItems: [GroupedItem] = []
        for location in locations {
            let item = GroupedItem(
                itemId: location.id ?? "NA",
                title: location.name ?? "NA",
                subtitle: (location.locationType ?? .ParkingGarage).rawValue,
                leadingIcon: Icon(location.leadingIcon ?? "", bundle: EasyParkMain.bundle),
                hasDetails: location.location != nil
            )
            groupedItems.append(item)
        }
        return groupedItems
    }
}

class TestData {
    public static let testList = [
        ParkingSpot(
            id: StringUtils.uuid(),
            name: "Precise Park Link",
            leadingIcon: "PrecisePark",
            locationType: .ParkingGarage,
            location: Coordinate(latitude: 43.2003, longitude: 71.3334)
        ),
        ParkingSpot(
            id: StringUtils.uuid(),
            name: "Innova Parking",
            leadingIcon: "InnovaPark",
            locationType: .ParkingLot,
            location: Coordinate(latitude: 43.4003, longitude: 72.3334)
        ),
        ParkingSpot(
            id: StringUtils.uuid(),
            name: "Safe Garage",
            leadingIcon: "SafeGarage",
            locationType: .ParkingGarage,
            location: Coordinate(latitude: 42.2003, longitude: 72.3334)
        ),
        ParkingSpot(
            id: StringUtils.uuid(),
            name: "Cater Parking",
            leadingIcon: "CaterPark",
            locationType: .ParkingLot,
            location: Coordinate(latitude: 44.2003, longitude: 73.3334)
        ),
        ParkingSpot(
            id: StringUtils.uuid(),
            name: "Ample Parking",
            leadingIcon: "AmplePark",
            locationType: .ParkingGarage,
            location: Coordinate(latitude: 45.2003, longitude: 71.3334)
        ),
        ParkingSpot(
            id: StringUtils.uuid(),
            name: "Gill Park",
            leadingIcon: "GillPark",
            locationType: .ParkingGarage,
            location: Coordinate(latitude: 43.2003, longitude: 70.3334)
        )
    ]
}
