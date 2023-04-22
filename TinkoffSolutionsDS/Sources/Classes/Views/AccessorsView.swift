//
//  AccessorsView.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation

public protocol AccessorsViewContainable: ViewContainable {
    func setup(viewModel: AccessorsViewViewModel)
}


public final class AccessorsView: ViewContainer, AccessorsViewContainable {
    private var leftAccessor: ViewContainer?
    private var rightAccessor: ViewContainer?
    private let contentView: ViewContainer

    public init(leftAccessor: ViewContainer? = nil, rightAccessor: ViewContainer? = nil, contentView: ViewContainer) {
        self.leftAccessor = leftAccessor
        self.rightAccessor = rightAccessor
        self.contentView = contentView
        super.init(frame: .zero)
        if let leftAccessor {
            addSubview(leftAccessor)
        }
        if let rightAccessor {
            addSubview(rightAccessor)
        }
        addSubview(contentView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        if let leftAccessor {
            let size = leftAccessor.sizeThatFits(size)
            width += size.width + .horizontalOffset
            height = max(height, size.height)
        }
        let contentViewSize = contentView.sizeThatFits(size)
        width += contentViewSize.width
        height = max(height, contentViewSize.height)
        if let rightAccessor {
            let size = rightAccessor.sizeThatFits(size)
            width += size.width + .horizontalOffset
            height = max(height, size.height)
        }
        return CGSize(width: width, height: height)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        var contentViewX: CGFloat = 0
        if let leftAccessor {
            leftAccessor.sizeToFit()
            leftAccessor.frame.origin = CGPoint(x: 0, y: bounds.midY - leftAccessor.bounds.height / 2)
            contentViewX = leftAccessor.frame.maxX + .horizontalOffset
        }
        contentView.sizeToFit()
        contentView.frame.origin = CGPoint(x: contentViewX, y: bounds.midY - contentView.bounds.height / 2)

        if let rightAccessor {
            rightAccessor.sizeToFit()
            rightAccessor.frame.origin = CGPoint(x: contentView.bounds.maxX + .horizontalOffset, y: rightAccessor.bounds.height / 2)
        }
    }

    public func setup(viewModel: AccessorsViewViewModel) {
        if let leftVM = viewModel.leftAccessorViewModel {
            leftAccessor?.setup(viewModel: leftVM)
        }
        if let rightVM = viewModel.rightAccessorViewModel {
            rightAccessor?.setup(viewModel: rightVM)
        }
        contentView.setup(viewModel: viewModel.contentViewModel)
    }

    public override func setup(viewModel: ViewModel) {
        super.setup(viewModel: viewModel)
        guard let vm = viewModel as? AccessorsViewViewModel else {
            assertionFailure("wrong vm")
            return
        }
        setup(viewModel: vm)
    }
    
}

private extension CGFloat {
    static let horizontalOffset: CGFloat = 16
}
