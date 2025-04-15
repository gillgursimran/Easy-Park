//
//  BaseViewModel.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-08-29.
//

import Foundation
import Core

class BaseViewModel: ObservableObject {
    @Injected(\.dispatchQueue) private var dispatchQueue: DispatchQueueType
    @Published var showError = false
    var toastMsg = "" {
        didSet {
            if !toastMsg.isEmpty {
                displayToast()
            }
        }
    }

//    func handleServerError(fcError: FCError) -> String {
//        var arg = ""
//        if fcError.isGenericError {
//            arg = Strings.unknownError
//        } else if fcError.isNoNetworkError, fcError.errorCode == FCError.NO_NETWORK_CONNECTION {
//            arg = Strings.noNetworkMessage
//        } else if let gatewayError = fcError.gatewayError {
//            arg = String.localizedStringWithFormat(Strings.errorWithDetails, String(gatewayError.errorCode))
//        } else {
//            arg = Strings.unknownError
//        }
//
//        return String.localizedStringWithFormat(Strings.genericErrorWithDetails, arg)
//    }

    private func displayToast() {
        dispatchQueue.runOnMain { [weak self] in
            self?.showError = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [weak self] in
                self?.toastMsg = ""
                self?.showError = false
                NotificationCenter.default.post(
                    name: .clearFCError,
                    object: nil
                )
            })
        }
    }
}

extension Notification.Name {
    static let clearFCError = Notification.Name(rawValue: "clearFcError")
}
