//
//  LabelViewModel.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation

public protocol LabelViewModel: ViewModel {
    var color: Color { get }
    var style: TextStyle { get }
    var text: String { get }
}

public struct LabelViewModelImpl: LabelViewModel {

    public let color: Color
    public let style: TextStyle
    public let text: String
    public let isFlat: Bool
    public init(color: Color, style: TextStyle, text: String, isFlat: Bool) {
        self.color = color
        self.style = style
        self.text = text
        self.isFlat = isFlat
    }
}
