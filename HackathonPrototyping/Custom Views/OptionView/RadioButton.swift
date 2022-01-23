//
//  RadioButton.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit

class RadioButton: UIButton {

    // Images
    let checkedImage = UIImage(systemName: "circle.inset.filled")
    let uncheckedImage = UIImage(systemName: "circle")
//    var didChecked: ((Bool)->()) = { bool in }

    // Bool property
    var isChecked: Bool = false {
        didSet {
            let image = isChecked ? checkedImage : uncheckedImage
            setImage(image, for: UIControl.State.normal)
//            didChecked(isChecked)
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 30, height: 30)
    }

    override init(frame: CGRect) {
        defer {
            self.isChecked = false
        }
        super.init(frame: frame)
//        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.tintColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    @objc func buttonClicked(sender: UIButton) {
//            isChecked = !isChecked
//    }

}
