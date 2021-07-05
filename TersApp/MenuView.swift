//
//  MenuView.swift
//  TersApp
//
//  Created by Macbook on 1. 7. 2021..
//

import UIKit

enum MenuItemType {
    case home
    case search
}


protocol MenuViewDelegate {
    func didTap(item: MenuItemType)
}

class MenuView: UIView {

    public var delegate: MenuViewDelegate?
    
    @IBOutlet weak var dashBoardBtn: UIButton!
    @IBOutlet weak var docBtn: UIButton!
    @IBOutlet weak var srcBtn: UIButton!
    @IBOutlet weak var bookmarkBtn: UIButton!
    
    
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MenuView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setup(){
        
        dashBoardBtn.layer.backgroundColor = UIColor(hexString: "2A2B2B").cgColor
        docBtn.layer.backgroundColor = UIColor(hexString: "2A2B2B").cgColor
        srcBtn.layer.backgroundColor = UIColor(hexString: "2A2B2B").cgColor
        bookmarkBtn.layer.backgroundColor = UIColor(hexString:"2A2B2B").cgColor
        
        dashBoardBtn.layer.cornerRadius = 10.0
        docBtn.layer.cornerRadius = 10.0
        srcBtn.layer.cornerRadius = 10.0
        bookmarkBtn.layer.cornerRadius = 10.0
    }
    
    @IBAction func homeButtonAction(_ sender: Any) {
        delegate?.didTap(item: .home)
    }
    

}



