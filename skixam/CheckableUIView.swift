//
//  CheckableUIView.swift
//  skixam
//
//  Created by Usman Ramzan on 23/08/2023.
//

import UIKit

class CheckableUIView: UIView {
    private var isChecked: Bool = false
    private var checkmarkImageView: UIImageView?

    func toggleCheckmark() {
        isChecked.toggle()
        updateCheckmark()
    }

    private func updateCheckmark() {
        if isChecked {
            addCheckmark()
        } else {
            removeCheckmark()
        }
    }

    private func addCheckmark() {
        let checkmarkImage = UIImage(named: "checkmark_checked")
        checkmarkImageView = UIImageView(image: checkmarkImage)
        checkmarkImageView?.contentMode = .scaleAspectFit
        checkmarkImageView?.frame = CGRect(x: bounds.width - 30, y: 0, width: 30, height: 30)
        addSubview(checkmarkImageView!)
    }

    private func removeCheckmark() {
        checkmarkImageView?.removeFromSuperview()
    }


}
