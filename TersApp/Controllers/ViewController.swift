//
//  ViewController.swift
//  TersApp
//
//  Created by Macbook on 29. 5. 2021..
//

import UIKit
import Firebase
import Alamofire



class ViewController: UIViewController {

    @IBOutlet weak var nonCompanyUserContainer: UIView!
    @IBOutlet weak var companyUserContainer: UIView!
    @IBOutlet weak var searchContainer: UIView!
    @IBOutlet weak var allCategoriesBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var menuContainer: UIView!
    
  
    
    private let menuView = MenuView.instanceFromNib() as! MenuView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        setupUIFor(userContainer: nonCompanyUserContainer)
        setupUIFor(userContainer: companyUserContainer)
        setupUIForSearchContainer()
        
        menuContainer.addSubview(menuView)
        menuView.delegate = self
    
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillLayoutSubviews() {
        menuView.frame = menuContainer.bounds
    }
    
    override func viewDidDisappear(_ animated: Bool) {
       nonCompanyUserContainer.backgroundColor = UIColor(hexString: "#FFFFFF")
       companyUserContainer.backgroundColor = UIColor(hexString: "#FFFFFF")
    }
    
    @IBAction func didTapNonCompanyContainer(_ sender: Any) {
        nonCompanyUserContainer.backgroundColor = UIColor(hexString: "#F9EC1E")
    
        let vc = storyboard?.instantiateViewController(identifier: "usersController") as! NonCompanyUserViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapCompanyContainer(_ sender: Any) {
        companyUserContainer.backgroundColor = UIColor(hexString: "#F9EC1E")
        
        
        
        let vc = storyboard?.instantiateViewController(identifier: "usersController") as! NonCompanyUserViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUIFor(userContainer: UIView) {
        
        userContainer.layer.borderColor = UIColor.black.cgColor
        userContainer.layer.borderWidth = 1.0
        userContainer.layer.cornerRadius = 15.0
    }
    
    private func setupUIForSearchContainer() {
        
        view.backgroundColor = UIColor(hexString: "#FAFAFB")
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

extension ViewController: MenuViewDelegate {

    func didTap(item: MenuItemType) {
        switch item {
        case .home:
            print("printaj home")
        case .search:
           print("Printaj src Almir")

        case .add:
            print("printaj add")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc =
                storyboard.instantiateViewController(identifier: "AddViewController") as! AddViewController
            navigationController?.pushViewController(vc, animated: true)
            
        
        case .doc:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc =
                storyboard.instantiateViewController(identifier: "ProfileUserViewController") as! ProfileUserViewController
            navigationController?.pushViewController(vc, animated: true)

     
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
