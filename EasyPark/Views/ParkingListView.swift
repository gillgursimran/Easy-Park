//
//  ParkingListView.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2024-03-04.
//

import SwiftUI
import Core

struct ParkingListView: View {
    @StateObject private var viewModel = ParkingListViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: Dimens.spacingMedium) {
            if viewModel.parkingList.count > 0 {
                GroupedListView() {
                    GroupedListSection(
                        sectionTitle: Text("Available spots"),
                        listItems: viewModel.getGroupedItems(viewModel.parkingList),
                        emptyListlabel: Strings.noLocationFound
                    ) { selectedLocation in
                        //                            viewModel.selectedDvirInspections = viewModel.allDvirInspections
                        //                                .filter { $0.inspection.dvirID == selectedDvirId }
                        //                            showInspectionDetails.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ParkingListView()
}
