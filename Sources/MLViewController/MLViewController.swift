
import UIKit

/// This class inherits UIViewController.
/// It has listeners set up to change the language used.
/// Rewrite the method in your inherited class:
/// open func setFieldsForLanguage(language l: MLViewControllerLanguages)
/// and customize your multilingual UI elements in it.
/// You can find a complete description at:
/// https://github.com/SlonGL/MLViewController
open class MLViewController : UIViewController {
    
    /// Set to TRUE if you want to restore the last selected language.
    /// Default: TRUE
    open var restoreLanguageOnStart = true
    
    /// Set the value to your preferred language.
    /// It is also automatically updated with the language select button.
    /// You can set it with the .Auto value to get the language from the system preference
    /// Default: .Auto (.EnglishUS if was not recognized)
    public static var currentLanguage : MLVCLanguages = .Auto {
        didSet {
            if MLViewController.currentLanguage == .Auto {
                MLViewController.currentLanguage = MLViewController.autoLocaleRecognize() ?? .EnglishUS
                if _logLevel == .medium || _logLevel == .full {
                    PRINT_DEBUG("Auto recognized language: \(currentLanguage)")
                }
            }
            NotificationCenter.default.post(name: .MLViewControllerLanguageDidChange, object: nil, userInfo: ["Language" : currentLanguage])
            if _logLevel == .medium || _logLevel == .full {
                PRINT_DEBUG("Notification posted: \(currentLanguage)")
            }
            MLViewControllerStateStorage.saveState(language: currentLanguage)
            if _logLevel == .medium || _logLevel == .full {
                PRINT_DEBUG("New language was set: \(currentLanguage)")
            }
            if _logLevel == .full {
                PRINT_DEBUG("Previous language: \(oldValue)")
            }
        }
    }
    
    // Local variables ===============
    
    static var _logLevel : MLVCLogLevel = .medium
    static var _languageChangeNotification : Notification? = nil
    
    // Local variables end ===========

    
    deinit {
        if MLViewController._logLevel == .medium || MLViewController._logLevel == .full {
            PRINT_DEBUG("deInit: ", self.description)
        }
        removeObservers()
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
        if restoreLanguageOnStart {
            MLViewController.restoreLanguage()
        }
        if MLViewController.currentLanguage == .Auto {
            MLViewController.currentLanguage = MLViewController.autoLocaleRecognize() ?? .EnglishUS
        }
    }
    
    /// Set debug log level
    public func setLogLevel(_ logLevel : MLVCLogLevel) {
        MLViewController._logLevel = logLevel
    }
    
    /// Restore last used language
    @discardableResult public static func restoreLanguage() -> MLVCLanguages? {
        if let language = MLViewControllerStateStorage.loadState() {
            MLViewController.currentLanguage = language
            return language
        } else {
            return nil
        }
    }
    
    /// Try to auto language recognition
    public static func autoLocaleRecognize() -> MLVCLanguages? {
        let localeString = Locale.current.identifier
        let values: [String] = MLVCLanguages.allCases.map { $0.rawValue }
        for langRaw in values {
            if localeString.contains(langRaw) {
                return MLVCLanguages(rawValue: langRaw)
            }
        }
        return nil
    }
    
}

extension MLVCString {
    static let HelloWorld = MLVCString(rawValue: [
        MLVCLanguages.EnglishUS : "Hello, world!",
        MLVCLanguages.Russian : "Привет, мир!"
    ])
}
