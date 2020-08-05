//
// LinkButton.swift
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

public class LinkButton: UIButton {
    // MARK: - Properties

    private let highlightedAlphValue: CGFloat = 0.8

    public override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                setTitleColor(AllowX.primaryColor.withAlphaComponent(highlightedAlphValue), for: .normal)
            } else {
                setTitleColor(AllowX.primaryColor, for: .normal)
            }
        }
    }

    public override var isEnabled: Bool {
        didSet {
            if isEnabled {
                setTitleColor(AllowX.primaryColor, for: .normal)
            } else {
                setTitleColor(UIColor(red: 178.0 / 255, green: 178.0 / 255, blue: 178.0 / 255, alpha: 1.0), for: .normal)
            }
        }
    }

    // MARK: - Init

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupLinkButtonStyle()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupLinkButtonStyle()
    }

    // MARK: - Private Functions

    private func setupLinkButtonStyle() {
        setTitleColor(AllowX.primaryColor, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        backgroundColor = .white
    }
}
