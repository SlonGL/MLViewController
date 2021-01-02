//
//  File.swift
//  
//
//  Created by Dzmitry Sotnikov on 02.01.2021.
//

import Foundation
import UIKit

open class MLViewControllerStateStorage {
    
    static let LANGUAGE_USER_DEFAULTS_KEY = "MLViewController.state.key"
    
    class open func saveState(language: MLViewControllerLanguages) {
        let defaults = UserDefaults.standard
        defaults.set(language.rawValue, forKey: LANGUAGE_USER_DEFAULTS_KEY)
    }
    
    class open func loadState() -> MLViewControllerLanguages? {
        let defaults = UserDefaults.standard
        if let languageRaw = defaults.string(forKey: LANGUAGE_USER_DEFAULTS_KEY) {
            return MLViewControllerLanguages(rawValue: languageRaw)
        } else {
            return nil
        }
    }
    
}
