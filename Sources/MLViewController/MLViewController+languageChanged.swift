//
//  File.swift
//  
//
//  Created by Dzmitry Sotnikov on 02.01.2021.
//

import Foundation

extension MLViewController {
    
    /// IMPORTANT !!!
    /// Override this method in your class for your UI objects localization
    ///
    /// Set strings values:
    /// -------------------------------------------------------------------
    /// extension MLVCString {
    ///     static let HelloWorld = MLVCString(rawValue: [
    ///         MLVCLanguages.EnglishUS : "Hello, world!",
    ///         MLVCLanguages.Russian : "Привет, мир!"
    ///     ])
    /// }
    /// -------------------------------------------------------------------
    ///
    /// Get value (Pay attention to the need to unwrap nullable value):
    /// -------------------------------------------------------------------
    /// yourLabel.text = MLVCLocalizedString(MLVCString.HelloWorld!)
    /// -------------------------------------------------------------------
    open func setFieldsForLanguage(language l : MLVCLanguages) {}
    
}
