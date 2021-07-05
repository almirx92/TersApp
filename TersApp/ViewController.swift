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
        print(item)
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
