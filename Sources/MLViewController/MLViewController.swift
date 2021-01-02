
import UIKit

open class MLViewController : UIViewController {
    
    var _logLevel : MLVCLogLevel = .medium
    var _languageChangeNotification : Notification? = nil
    
    deinit {
        if [MLVCLogLevel.medium, MLVCLogLevel.full].contains(_logLevel) {
            PRINT_DEBUG("deInit: ", self.description)
        }
        removeObservers()
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
    }
    
    open func setFieldsForLanguage(language l : MLViewControllerLanguages) {
        
    }
    
}
