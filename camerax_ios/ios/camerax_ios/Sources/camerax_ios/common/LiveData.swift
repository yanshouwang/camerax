//
//  LiveData.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/18.
//

import Foundation

public class LiveData<T: Equatable>: NSObject {
    private var value: T?
    private var stubs: [ObserverStub]
    
    public init(value: T) {
        self.value = value
        self.stubs = []
    }
    
    public override init() {
        self.value = nil
        self.stubs = []
    }
    
    public func getValue() -> T? {
        return self.value
    }
    
    public func setValue(_ value: T) {
        guard self.value != value else { return }
        self.value = value
        for stub in self.stubs {
            stub.instance.onChanged(value)
        }
    }
    
    public func observeForever(_ observer: any Observer<T>) {
        guard !self.stubs.contains(where: { $0.instance === observer}) else { return }
        let stub = ObserverStub(observer)
        self.stubs.append(stub)
    }
    
    public func removeObserver(_ observer: any Observer<T>) {
        self.stubs.removeAll(where: { $0.instance === observer })
    }
    
    class ObserverStub: NSObject {
        let instance: any Observer<T>
        
        init(_ observer: any Observer<T>) {
            self.instance = observer
        }
    }
}
