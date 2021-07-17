//
//  SearchHeaderView.swift
//  TersApp
//
//  Created by Macbook on 1. 7. 2021..
//

import UIKit

enum SearchHeaderItemType {
    case search 
}

protocol SearchHeaderDelegate {
    func didTap(item: SearchHeaderItemType)
}

class SearchHeaderView: UICollectionReusableView {
    
    static let identifier = "SearchHeadView"
    public var delegate: SearchHeaderDelegate?

    @IBOutlet weak var label1Txt: UILabel!
    @IBOutlet weak var label2Txt: UILabel!
    @IBOutlet weak var label3Txt: UILabel!
    @IBOutlet weak var label4Txt: UILabel!
    @IBOutlet weak var dropDownBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var allCategoriesBtn: UIButton!
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchContainer: UIStackView!
    @IBOutlet weak var filterContainer: UIStackView!
    
    @IBOutlet weak var contView: UIView!
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    class func instanceFromNib() -> UICollectionReusableView {
        return UINib(nibName: "SearchHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UICollectionReusableView 
    }
    
    override func awakeFromNib() {
        setup()
    }
    
    
    
    func setup(){
    allCategoriesBtn?.layer.cornerRadius = 7
    allCategoriesBtn?.layer.borderColor = UIColor(hexString: "F1F1F5").cgColor
    allCategoriesBtn?.backgroundColor = UIColor(hexString: "F1F1F5")
    searchBtn?.layer.cornerRadius = 10
    searchBtn?.layer.borderColor = UIColor(hexString: "F9EC1E").cgColor
    
    searchContainer?.layer.cornerRadius = 15.0
    searchContainer?.layer.borderColor = UIColor(hexString: "E5E5E5").cgColor
    searchContainer?.layer.borderWidth = 1
    
    filterContainer?.layer.cornerRadius = 15.0
    filterContainer?.layer.borderColor = UIColor(hexString: "E5E5E5").cgColor
    filterContainer?.layer.borderWidth = 1
    
    contView?.backgroundColor = UIColor(hexString: "#FAFAFB")
    
    }
    @IBAction func searchBtnAction(_ sender: Any) {
        delegate?.didTap(item: .search)
    }

}
