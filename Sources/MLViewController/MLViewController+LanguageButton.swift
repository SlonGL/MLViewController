//
//  File.swift
//  
//
//  Created by Dzmitry Sotnikov on 08.01.2021.
//

import Foundation
import UIKit

open class MLVCLanguageButton : UIButton {
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.setImage(MLVCLanguages.flagImage(language: .Auto), for: .normal)
        imageView?.contentMode = .scaleAspectFit
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        self.addTargetClosure { [weak self] (_) in
            DispatchQueue.main.async {
                self?.buttonPressed()
            }
        }
    }
    
    /// You can remove the default button action
    /// if you want to create your own logic
    public func removeButtonAction() {
        self.removeTargetClosure()
    }
    
    /// Button action
    /// You can override this method
    open func buttonPressed() {
        let langArray = MLVCLanguages.allCases
        if let currentIndex = langArray.firstIndex(of: MLViewController.currentLanguage) {
            if currentIndex >= langArray.count - 1 {
                MLViewController.currentLanguage = .Auto
            } else {
                MLViewController.currentLanguage = langArray[currentIndex + 1]
            }
        }
        self.setImage(MLVCLanguages.flagImage(language: MLViewController.currentLanguage), for: .normal)
    }
    
}
