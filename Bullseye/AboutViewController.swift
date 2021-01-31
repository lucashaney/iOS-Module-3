import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    // Outlet for WebKit
    @IBOutlet weak var webView: WKWebView!
    
    // Action for close button
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Shows html file 
        if let url = Bundle.main.url(forResource: "Bullseye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
