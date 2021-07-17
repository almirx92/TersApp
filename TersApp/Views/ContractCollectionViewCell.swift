//
//  ContractCollectionViewCell.swift
//  TersApp
//
//  Created by Macbook on 8. 7. 2021..
//

import UIKit
import WebKit

class ContractCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cellContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.displayWebView()
    }
  
    private func createWebView(withFrame frame: CGRect) -> WKWebView? {
        let webView = WKWebView(frame: frame)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if let resourceUrl = URL(string: "https://web.stanford.edu/class/archive/cs/cs161/cs161.1168/lecture4.pdf") {
            let request = URLRequest(url: resourceUrl)
            webView.load(request)
            
            return webView
        }
        return nil
    }
    
    private func displayWebView() {
        if let webView = self.createWebView(withFrame: cellContainer.bounds) {
            webView.scrollView.showsVerticalScrollIndicator = false
            webView.scrollView.showsVerticalScrollIndicator = false
            cellContainer.addSubview(webView)
        }
    }

}
