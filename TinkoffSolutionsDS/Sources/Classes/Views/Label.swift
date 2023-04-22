//
//  LabelContainable.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation
import UIKit

public protocol LabelContainable: ViewContainable {
    func setup(viewModel: LabelViewModel)
}

public final class Label: ViewContainer, LabelContainable {
    private let label = UILabel()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        label.sizeThatFits(size)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

    public func setup(viewModel: LabelViewModel) {
        label.text = viewModel.text
        label.textColor = viewModel.color.uiColor
        label.font = viewModel.style.font
        setNeedsLayout()
    }

    public override func setup(viewModel: ViewModel) {
        super.setup(viewModel: viewModel)
        guard let vm = viewModel as? LabelViewModel else {
            assertionFailure("wrong vm")
            return
        }
        setup(viewModel: vm)
    }

}
