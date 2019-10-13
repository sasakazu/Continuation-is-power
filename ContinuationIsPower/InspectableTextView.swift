//
//  InspectableTextView.swift
//  ContinuationIsPower
//
//  Created by 笹倉一也 on 2019/10/13.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit

class InspectableTextView: UITextView {

 
    
    // MARK: - プロパティ
    /// プレースホルダーに表示する文字列（ローカライズ付き）
    @IBInspectable var localizedString: String = "" {
        didSet {
            guard !localizedString.isEmpty else { return }
            // Localizable.stringsを参照する
            placeholderLabel.text = NSLocalizedString(localizedString, comment: "")
            placeholderLabel.sizeToFit()  // 省略不可
        }
    }
    
    /// プレースホルダー用ラベルを作成
    private lazy var placeholderLabel = UILabel(frame: CGRect(x: 6, y: 6, width: 0, height: 0))
    
    // MARK: - Viewライフサイクルメソッド
    /// ロード後に呼ばれる
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
        configurePlaceholder()
        togglePlaceholder()
    }
    
    /// プレースホルダーを設定する
    private func configurePlaceholder() {
        placeholderLabel.textColor = UIColor.gray
        addSubview(placeholderLabel)
    }
    
    /// プレースホルダーの表示・非表示切り替え
    private func togglePlaceholder() {
        // テキスト未入力の場合のみプレースホルダーを表示する
        placeholderLabel.isHidden = text.isEmpty ? false : true
    }
}

// MARK: -  UITextView Delegate
extension InspectableTextView: UITextViewDelegate {
    /// テキストが書き換えられるたびに呼ばれる ※privateにはできない
    func textViewDidChange(_ textView: UITextView) {
        togglePlaceholder()
    }
    
    
}
