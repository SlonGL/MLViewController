//
//  File.swift
//  
//
//  Created by Dzmitry Sotnikov on 02.01.2021.
//

import Foundation

extension Notification.Name {
    static let MLViewControllerLanguageDidChange = Notification.Name("MLViewControllerLanguageDidChange")
}

extension MLViewController {
    
    open func setObservers() {
        NotificationCenter.default.addObserver(forName: .MLViewControllerLanguageDidChange, object: nil, queue: nil) { [weak self] (notification) in
            self?.languageChangeNotificationObserver(notification: notification)
        }
    }
    
    open func removeObservers() {
        if _logLevel == .medium {
            PRINT_DEBUG(self.description, ": Observers removed.")
        }
        if _logLevel == .full {
            PRINT_DEBUG(self.description, ": Observers removed.")
        }
        NotificationCenter.default.removeObserver(self)
    }
    
    open func languageChangeNotificationObserver(notification: Notification) {
        if _logLevel == .medium {
            PRINT_DEBUG(self.description, ": language changed")
        }
        if _logLevel == .full {
            PRINT_DEBUG(self.description, ": language change notification\nObject: ", String(describing: notification.object), "\nUserInfo: ", String(describing: notification.userInfo))
        }
    }
    
}
