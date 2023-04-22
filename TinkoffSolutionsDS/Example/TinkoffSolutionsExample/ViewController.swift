//
//  ViewController.swift
//  tfs
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import UIKit
import TinkoffSolutionsDS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let labelVM = LabelViewModelImpl(color: ColorToken.primary, style: .h1, text: "Header", isFlat: false)
        let accVM = AccessorsViewViewModelImpl(leftAccessorViewModel: nil, rightAccessorViewModel: ViewModelImpl(isFlat: false), contentViewModel: labelVM, isFlat: false)
        let header = CardViewCell(preset: .header, containerViewModel: accVM)
        header.sizeToFit()
        view.addSubview(header)

    }


}

