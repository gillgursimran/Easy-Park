//
//  DispatchQueue+Type.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-08-29.
//

import Foundation

public protocol DispatchQueueType {
    func async(execute work: @escaping () -> Void)
    func asyncAfterDelay(delay: Double, execute work: @escaping () -> Void)
    func asyncWorkItemAfter(delay: Double, execute work: DispatchWorkItem)
    func runOnMain(execute work: @escaping () -> Void)
    func createSubQueue(_ queueName: String, qos: DispatchQoS, execute work: @escaping () -> Void)
}

extension DispatchQueue: DispatchQueueType {
    public func createSubQueue(_ queueName: String, qos: DispatchQoS, execute work: @escaping () -> Void) {
        DispatchQueue(label: queueName, qos: qos).async(execute: work)
    }

    public func async(execute work: @escaping () -> Void) {
        async(group: nil, qos: .unspecified, flags: [], execute: work)
    }

    public func asyncAfterDelay(delay: Double, execute work: @escaping () -> Void) {
        asyncAfter(deadline: .now() + delay, qos: .unspecified, flags: [], execute: work)
    }

    public func asyncWorkItemAfter(delay: Double, execute work: DispatchWorkItem) {
        asyncAfter(deadline: .now() + delay, execute: work)
    }

    public func runOnMain(execute work: @escaping () -> Void) {
        DispatchQueue.main.async(execute: work)
    }
}
