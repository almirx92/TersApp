//
//  AddViewController.swift
//  TersApp
//
//  Created by Macbook on 12. 7. 2021..
//

import UIKit
import Eureka
import ImageRow

class AddViewController: FormViewController, MenuViewDelegate {
   
    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var tableViewContainer: UIView!
    var newUser = AddNewUserFormRequest()
    
    private let menuView = MenuView.instanceFromNib() as! MenuView 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        tableView.frame = tableViewContainer.frame
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
        menuContainer.addSubview(menuView)
        menuView.delegate = self
        setup()
        
        form
            +++ Section(){ section in
                section.header = {
                  var header = HeaderFooterView<UIView>(.callback({
                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
                    let label = UILabel()
                    label.text = "JIB"
                    label.font = UIFont(name: "Roboto", size: 14)
                    label.textColor = UIColor(hexString: "#B5B5BE")
                    label.frame = view.frame
                    label.frame.origin.x += 15
                    view.addSubview(label)
                      return view
                  }))
                  header.height = { 30 }
                  return header
                }()
            }
            <<< TextRow(){ row in
                row.placeholder = "4303425000001"
                row.placeholderColor = .black
                
            }.cellSetup({cell, row int
                cell.textLabel?.font = UIFont(name: "Roboto", size: 14)
            })
            +++ Section(){ section in
                section.header = {
                  var header = HeaderFooterView<UIView>(.callback({
                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
                    let label = UILabel()
                    label.text = "PDV"
                    label.font = UIFont(name: "Roboto", size: 14)
                    label.textColor = UIColor(hexString: "#B5B5BE")
                    label.frame = view.frame
                    label.frame.origin.x += 15
                    view.addSubview(label)
                      return view
                  }))
                  header.height = { 30 }
                  return header
                }()
            }
            <<< TextRow(){ row in
                row.placeholder = "303425000001"
                row.placeholderColor = .black
            }.cellSetup({cell, row in
                cell.textLabel?.font = UIFont(name: "Roboto", size: 14)
            })
            // Placeholder row for the border
            <<< TextRow() { row in

            }.cellSetup({ cell, row in
                cell.height = {50.0}
                cell.addBorder(for: .bottom, withColor: UIColor(hexString: "#F1F1F5"), borderWidth: 1.0)
                cell.isUserInteractionEnabled = false
            })

            +++ Section(){ section in
                section.header = {
                  var header = HeaderFooterView<UIView>(.callback({
                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
                    let label = UILabel()
                    label.text = "Email Address"
                    label.font = UIFont(name: "Roboto", size: 14)
                    label.textColor = UIColor(hexString: "#B5B5BE")
                    label.frame = view.frame
                    label.frame.origin.x += 15
                    view.addSubview(label)
                      return view
                  }))
                  header.height = { 30 }
                  return header
                }()
            }
        
            <<< TextRow(){ row in
                row.placeholder = "pearshadow@gmail.com"
                row.placeholderColor = .black
            }.cellSetup({cell, row in
                cell.textLabel?.font = UIFont(name: "Roboto", size: 14)
            })
            +++ Section(){ section in
                section.header = {
                  var header = HeaderFooterView<UIView>(.callback({
                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
                    let label = UILabel()
                    label.text = "Company Address"
                    label.font = UIFont(name: "Roboto", size: 14)
                    label.textColor = UIColor(hexString: "#B5B5BE")
                    label.frame = view.frame
                    label.frame.origin.x += 15
                    view.addSubview(label)
                      return view
                  }))
                  header.height = { 30 }
                  return header
                }()
            }
            <<< TextRow(){ row in
                row.placeholder = "24. Juna br. 15 71320, Vogosca, Bosna i Hercegovina"
                row.placeholderColor = .black
            }.cellSetup({cell, row in
                cell.textLabel?.font = UIFont(name: "Roboto", size: 14)
            })
            +++ Section(){ section in
                section.header = {
                  var header = HeaderFooterView<UIView>(.callback({
                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
                    let label = UILabel()
                    label.text = "Phone Number"
                    label.font = UIFont(name: "Roboto", size: 14)
                    label.textColor = UIColor(hexString: "#B5B5BE")
                    label.frame = view.frame
                    label.frame.origin.x += 15
                    view.addSubview(label)
                      return view
                  }))
                  header.height = { 30 }
                  return header
                }()
            }
            <<< TextRow(){ row in
                row.placeholder = "+62 812 231 731 / +62 811 984 312"
                row.placeholderColor = .black
            }.cellSetup({cell, row in
                cell.textLabel?.font = UIFont(name: "Roboto", size: 14)
                cell.textField.textAlignment = .left
            })
            +++ Section(){ section in
                section.header = {
                    var header = HeaderFooterView<UIView>(.callback({
                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
                    let label = UILabel()
                    label.text = "Company Website"
                    label.font = UIFont(name: "Roboto", size: 14)
                    label.textColor = UIColor(hexString: "#B5B5BE")
                    label.frame = view.frame
                    label.frame.origin.x += 15
                    view.addSubview(label)
                      return view
                  }))
                  header.height = { 30 }
                  return header
                }()
            }
            <<< TextRow(){ row in
                row.placeholder = "pearshadow.com"
                row.placeholderColor = .black
            }.onChange { row in
                self.newUser.website = row.value
                print(self.newUser.website)
            }.cellSetup {cell, row in
                cell.textLabel?.font = UIFont(name: "Roboto", size: 44)
            }
            
            <<< TextRow() { row in

            }.cellSetup({ cell, row in
                cell.height = {50.0}
                cell.addBorder(for: .bottom, withColor:UIColor(hexString: "#F1F1F5"), borderWidth: 1.0)
                cell.isUserInteractionEnabled = false
            })
            <<< TextRow() { row in

            }.cellSetup({ cell, row in
                cell.height = {50.0}
                cell.isUserInteractionEnabled = false
            })
            <<< ButtonRow() {
                   $0.title = "Add new user"
                   $0.cell.backgroundColor = UIColor(hexString: "#F9EC1E")
                $0.cell.tintColor = .black
                $0.cell.layer.cornerRadius = 10.0
                $0.cell.textLabel?.font = UIFont(name: "Roboto", size: 14)
            }
    }
            
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillLayoutSubviews() {
    
    }
    
    func setup(){
        
    }
    
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

enum Border: Int {
    case top = 0
    case bottom
    case right
    case left
}

extension UIView {
    func addBorder(for side: Border, withColor color: UIColor, borderWidth: CGFloat)  {
       let borderLayer = CALayer()
       borderLayer.backgroundColor = color.cgColor

       let xOrigin: CGFloat = (side == .right ? frame.width - borderWidth : 0)
       let yOrigin: CGFloat = (side == .bottom ? frame.height - borderWidth : 0)

       let width: CGFloat = (side == .right || side == .left) ? borderWidth : frame.width
       let height: CGFloat = (side == .top || side == .bottom) ? borderWidth : frame.height

       borderLayer.frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)
       layer.addSublayer(borderLayer)

    }
}

extension CALayer {
    func updateBorderLayer(for side: Border, withViewFrame viewFrame: CGRect) {
        let xOrigin: CGFloat = (side == .right ? viewFrame.width - frame.width : 0)
        let yOrigin: CGFloat = (side == .bottom ? viewFrame.height - frame.height : 0)

        let width: CGFloat = (side == .right || side == .left) ? frame.width : viewFrame.width
        let height: CGFloat = (side == .top || side == .bottom) ? frame.height : viewFrame.height

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)
    }
}
