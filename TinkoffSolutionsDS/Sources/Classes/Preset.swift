//
//  File.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation

public enum Preset {
    case header
}

final class ViewFactory {
    static func makeView(preset: Preset) -> ViewContainable {
        switch preset {
        case .header:
            let label = Label()
            let rightAns = StarView()
            let v = AccessorsView(rightAccessor: rightAns, contentView: label)
            return v
        }
    }
}
