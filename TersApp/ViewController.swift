//
//  ViewController.swift
//  TersApp
//
//  Created by Macbook on 29. 5. 2021..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nonCompanyUserContainer: UIView!
    @IBOutlet weak var companyUserContainer: UIView!
    
    @IBOutlet weak var searchContainer: UIView!
    
    @IBOutlet weak var allCategoriesBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIFor(userContainer: nonCompanyUserContainer)
        setupUIFor(userContainer: companyUserContainer)
        setupUIForSearchContainer()
    }
    
    @IBAction func didTapNonCompanyContainer(_ sender: Any) {
        nonCompanyUserContainer.backgroundColor = UIColor(hexString: "#F9EC1E")
    }
    
    @IBAction func didTapCompanyContainer(_ sender: Any) {
        print ("ggggr druga")
    }
    
    private func setupUIFor(userContainer: UIView) {
        
        userContainer.layer.borderColor = UIColor.black.cgColor
        userContainer.layer.borderWidth = 1.0
        userContainer.layer.cornerRadius = 15.0
    }
    
    private func setupUIForSearchContainer() {
        searchContainer.layer.cornerRadius = 15.0
        searchContainer.layer.borderColor = UIColor(hexString: "E5E5E5").cgColor
        searchContainer.layer.borderWidth = 1
        
        allCategoriesBtn.layer.cornerRadius = 7
        allCategoriesBtn.layer.borderColor = UIColor(hexString: "F1F1F5").cgColor
        allCategoriesBtn.backgroundColor = UIColor(hexString: "F1F1F5")
        
        searchBtn.layer.cornerRadius = 10
        searchBtn.layer.borderColor = UIColor(hexString: "F9EC1E").cgColor

        
    }

}
