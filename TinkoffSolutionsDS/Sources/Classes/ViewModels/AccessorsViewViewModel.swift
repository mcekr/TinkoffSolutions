//
//  AccessorsViewViewModel.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation
import UIKit

public protocol AccessorsViewViewModel: ViewModel {
    var leftAccessorViewModel: ViewModel? { get}
    var rightAccessorViewModel: ViewModel? { get}
    var contentViewModel: ViewModel { get }
}

public struct AccessorsViewViewModelImpl: AccessorsViewViewModel {
    public let leftAccessorViewModel: ViewModel?
    public let rightAccessorViewModel: ViewModel?
    public let contentViewModel: ViewModel
    public let isFlat: Bool
    public init(leftAccessorViewModel: ViewModel? = nil, rightAccessorViewModel: ViewModel? = nil, contentViewModel: ViewModel, isFlat: Bool) {
        self.leftAccessorViewModel = leftAccessorViewModel
        self.rightAccessorViewModel = rightAccessorViewModel
        self.contentViewModel = contentViewModel
        self.isFlat = isFlat
    }

}
