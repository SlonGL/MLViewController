//
//  UIButtonActionClosure.swift
//  ElefantVPN
//
//  Created by Dzmitry Sotnikov on 25.05.2020.
//  Copyright © 2020 Dzmitry Sotnikov (it.studio.slon@gmail.com). All rights reserved.
//

import Foundation
import UIKit

// Реакция на кнопку без #selector функции
// Использование:
//
//  loginButton.addTargetClosure { button in
//      // login logics
//  }

typealias UIButtonTargetClosure = (UIButton) -> ()

class ButtonClosureWrapper: NSObject {
    let closure: UIButtonTargetClosure
    init(_ closure: @escaping UIButtonTargetClosure) {
        self.closure = closure
    }
}

extension UIButton {
    
    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }
    
    private var targetClosure: UIButtonTargetClosure? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? ButtonClosureWrapper else { return nil }
            return closureWrapper.closure
        }
        set(newValue) {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, ButtonClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addTargetClosure(closure: @escaping UIButtonTargetClosure) {
        targetClosure = closure
        addTarget(self, action: #selector(UIButton.closureAction), for: .touchUpInside)
    }
    
    @objc func closureAction() {
        guard let targetClosure = targetClosure else { return }
        targetClosure(self)
    }
    
    func removeTargetClosure() {
        self.removeTarget(self, action: #selector(UIButton.closureAction), for: .touchUpInside)
        targetClosure = nil
    }
}

// Конец реакции на кнопку без #selector функции
