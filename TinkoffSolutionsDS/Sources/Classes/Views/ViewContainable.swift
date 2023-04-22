//
//  ViewContainable.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation
import UIKit

public protocol ViewContainable: UIView {
    func setup(viewModel: ViewModel)
}

public class ViewContainer: UIView, ViewContainable {
    public func setup(viewModel: ViewModel) {
        backgroundColor = viewModel.isFlat ? ColorToken.backgroundColorFlat.uiColor : ColorToken.backgroundColor.uiColor
    }
}

