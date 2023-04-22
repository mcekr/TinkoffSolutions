//
//  ViewModel.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation

public protocol ViewModel {
    var isFlat: Bool { get }
}
public struct ViewModelImpl: ViewModel {
    public init(isFlat: Bool) {
        self.isFlat = isFlat
    }

    public var isFlat: Bool


}
