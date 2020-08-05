//
// PrimaryButton.swift
//
// Copyright (c) 2020 KarimEbrahem (https://www.kebrahem.dev)
//
// AllowX is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation
import UIKit

public class PrimaryButton: UIButton {
    // MARK: - Properties

    private let highlightedAlphValue: CGFloat = 0.8
    private let cornerRadius: CGFloat = 8.0

    public override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                AllowX.primaryColor.withAlphaComponent(highlightedAlphValue)
            } else {
                backgroundColor = AllowX.primaryColor
            }
        }
    }

    public override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = AllowX.primaryColor
            } else {
                backgroundColor = UIColor(red: 178.0 / 255, green: 178.0 / 255, blue: 178.0 / 255, alpha: 1.0)
            }
        }
    }

    // MARK: - Init

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupPrimaryButtonStyle()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupPrimaryButtonStyle()
    }

    // MARK: - Private Functions

    private func setupPrimaryButtonStyle() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        backgroundColor = AllowX.primaryColor
        layer.cornerRadius = cornerRadius
    }
}
