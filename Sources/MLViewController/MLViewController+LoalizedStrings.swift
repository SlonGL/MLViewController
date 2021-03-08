//
//  File.swift
//  
//
//  Created by Dzmitry Sotnikov on 08.01.2021.
//

import Foundation


/// Yuu can extend this protocol with your own localized strings
/// Example:
///
/// extension MLVCStrings {
///     static let HelloWorld = MLVCString(rawValue: [
///         .EnglishUS : "Hello, world!",
///         .Russian : "Привет, мир!"
///     ])
/// }
///
protocol MLVCStrings {}

class MLVCString : MLVCStrings, RawRepresentable {
    
    var rawValue: [MLVCLanguages : String]
    
    required init?(rawValue: [MLVCLanguages : String]) {
        self.rawValue = rawValue
    }
    
    /// A textual representation of this instance.
    var description: String { get { return rawValue.description } }
    
    open func localizedString() -> String? {
        return rawValue[MLViewController.currentLanguage]
    }
    
}



extension MLViewController {
    /// Returns String value for current language
    func MLVCLocalizedString(_ string : MLVCString?) -> String? {
        return string?.localizedString()
    }
}

