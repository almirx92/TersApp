//
//  UserCollectionViewCell.swift
//  TersApp
//
//  Created by Macbook on 9. 6. 2021..
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell
    {

    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var usersImg: UIImageView!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var sendEmailBtn: UIButton!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup() {
        
        cellContainerView.backgroundColor = UIColor(hexString:"#FFFFFF")
        cellContainerView.layer.cornerRadius = 15.0
        cellContainerView.layer.borderColor = UIColor.black.cgColor
        cellContainerView.layer.borderWidth = 1
        
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
