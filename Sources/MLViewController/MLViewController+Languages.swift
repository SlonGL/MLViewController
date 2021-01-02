//
//  File.swift
//  
//
//  Created by Dzmitry Sotnikov on 02.01.2021.
//

import Foundation
import UIKit

enum MLViewControllerLanguages : String, Codable {
    case Auto = "auto"
    case Unknown = "unknown"
    case EnglishUS = "us"
    case EnglishUK = "gb"
    case French = "fr"
    case German = "de"
    case TraditionalChinese = "tw"
    case SimplifiedChinese = "cn"
    case Dutch = "nl"
    case Italian = "it"
    case Spanish = "es"
    case PortugueseBrazil = "br"
    case PortuguesePortugal = "pt"
    case Danish = "dk"
    case Swedish = "se"
    case Finnish = "fi"
    case Norwegian = "sj"
    case Korean = "kr"
    case Japanese = "jp"
    case Russian = "ru"
    case Belarus = "by"
    case Polish = "pl"
    case Turkish = "tr"
    case Ukrainian = "ua"
    case Hungarian = "hu"
    case Arabic = "ar"
    case Thai = "th"
    case Czech = "cs"
    case Greek = "gr"
    case Hebrew = "il"
    case Indonesian = "in"
    case Malay = "ms"
    case Romanian = "ro"
    case Slovak = "sk"
    case Croatian = "hr"
    case Catalan = "ca_ES"
    case Vietnamese = "vn"
    
    static func flagImage(language: MLViewControllerLanguages) -> UIImage {
        let imageName = "\(language.rawValue)_flag"
        if let image = UIImage(named: imageName) {
            return image
        } else {
            return UIImage(named: "unknown_flag") ?? UIImage()
        }
    }
    
    func flagImage() -> UIImage {
        return MLViewControllerLanguages.flagImage(language: self)
    }
    
    static func languageName(language: MLViewControllerLanguages) -> String {
        return "\(language)"
    }
    
    func languageName() -> String {
        return MLViewControllerLanguages.languageName(language: self)
    }
}
