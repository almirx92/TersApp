//
//  CompanyUserCollectionViewCell.swift
//  TersApp
//
//  Created by Macbook on 30. 6. 2021..
//

import UIKit

class CompanyUserCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var companyUserViewContainer: UIView!
    
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBOutlet weak var sendEmailBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup() {
        
        companyUserViewContainer.backgroundColor = UIColor(hexString:"#FFFFFF")
        companyUserViewContainer.layer.cornerRadius = 15.0
        companyUserViewContainer.layer.borderColor = UIColor.black.cgColor
        companyUserViewContainer.layer.borderWidth = 1
        
        profileBtn.backgroundColor = UIColor(hexString: "#F1F1F5")
        profileBtn.layer.cornerRadius = 10.0
        
        sendEmailBtn.backgroundColor = UIColor(hexString: "#F1F1F5")
        sendEmailBtn.layer.cornerRadius = 10.0
        
    }
    
    @IBAction func didTapProfileBtn(_ sender: Any) {
        profileBtn.backgroundColor = UIColor(hexString: "#F9EC1E")
    }
    
    @IBAction func didTapSendEmailBtn(_ sender: Any) {
        sendEmailBtn.backgroundColor = UIColor(hexString: "#F9EC1E")
    }
    
}
