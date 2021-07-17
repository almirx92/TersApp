

import UIKit
import Firebase
import Eureka

class ProfileUserViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MenuViewDelegate {
    
  
    enum ProfileUserSections {
        case documents
        case contract
    }
    
    enum ProfileUserViewControllerCells: String {
        case documentsCollectionViewCell = "DocumentsCollectionViewCell"
        case contractCollectionViewCell = "ContractCollectionViewCell"
    }
    
    var activeSection: ProfileUserSections = .documents
    
    @IBOutlet var viewContainer: UIView!
    @IBOutlet weak var DocumentContainer: UIView!
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var sideContainer: UIView!
    @IBOutlet weak var bodyContainer: UIView!
    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var searchContainer: UIView!

    @IBOutlet weak var infoContainer: UIView!
    
    @IBOutlet weak var tabLineDocView: UIView!
    @IBOutlet weak var tabLineContView: UIView!
    
    @IBOutlet weak var DocColViewContainer: UIView!
    @IBOutlet weak var DocColView: UICollectionView!
    @IBOutlet weak var docCollectionView: UICollectionView!
    @IBOutlet weak var editBtnBtn: UIButton!
    @IBOutlet weak var contractBtn: UIButton!
    @IBOutlet weak var documentsBtn: UIButton!
    @IBOutlet weak var sendMessageBtn: UIButton!
   
    private let menuView = MenuView.instanceFromNib() as! MenuView
    
    @IBOutlet weak var searchBtn: UIButton!
    
    // MARK: User Data
    @IBOutlet weak var jibField: UITextField!
    @IBOutlet weak var pdvField: UITextField!
    @IBOutlet weak var companyAddField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var companyWebField: UITextField!
   
    private let itemsPerRow: CGFloat = 3
    private let sectionInsets = UIEdgeInsets(
      top: 10.0,
      left: 10.0,
      bottom: 15.0,
      right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setup()
        
        menuContainer.addSubview(menuView)
        menuView.delegate = self
        // Do any additional setup after loading the view.
        docCollectionView.delegate = self
        docCollectionView.dataSource = self
        
        let  db = Firestore.firestore()
        db.collection("company-users").getDocuments() {
            (QuerySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in QuerySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        docCollectionView.register(UINib(nibName: ProfileUserViewControllerCells.documentsCollectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: ProfileUserViewControllerCells.documentsCollectionViewCell.rawValue)
        
        docCollectionView.register(UINib(nibName: ProfileUserViewControllerCells.contractCollectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: ProfileUserViewControllerCells.contractCollectionViewCell.rawValue)
    }
    
    @IBAction func EditBtn(_ sender: Any) {
        
        let values: [String: Any] = [ "JIB": jibField.text!.lowercased(), "PDV": pdvField.text!.lowercased(),"Company Address": companyAddField.text!.lowercased(), "Email Address": emailField.text!.lowercased(),"Company Website": companyWebField.text!.lowercased()]
        let db = Firestore.firestore()
        db.collection("company-users").addDocument(data: values)
        
        
        
    }
    @IBAction func didTapDocuments(_ sender: Any) {
        tabLineDocView?.layer.backgroundColor = UIColor.systemYellow.cgColor
        tabLineContView?.layer.backgroundColor = UIColor.systemGray.cgColor
        
        activeSection = .documents
        docCollectionView.reloadData()
    }

    @IBAction func didTapContract(_ sender: Any) {
        tabLineContView?.layer.backgroundColor = UIColor.systemYellow.cgColor
        tabLineDocView?.layer.backgroundColor = UIColor.systemGray.cgColor
        activeSection = .contract
        docCollectionView.reloadData()
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillLayoutSubviews() {
        menuView.frame = menuContainer.bounds
    }
    func setup(){
        headerContainer.backgroundColor = UIColor(hexString: "#FAFAFB")
        
        searchContainer.layer.cornerRadius = 15.0
        searchContainer.layer.borderColor = UIColor(hexString: "E5E5E5").cgColor
        sideContainer.layer.borderColor = UIColor(hexString: "E5E5E5").cgColor
        searchContainer.layer.borderWidth = 1
        searchContainer.layer.backgroundColor = UIColor(hexString: "FFFFFF").cgColor
        
        sendMessageBtn.layer.cornerRadius = 10.0
        searchBtn.layer.cornerRadius = 10
        searchBtn.layer.borderColor = UIColor(hexString: "F9EC1E").cgColor
        editBtnBtn.layer.cornerRadius = 10
        editBtnBtn.layer.borderColor = UIColor(hexString: "E9E9EF").cgColor
        editBtnBtn.layer.borderWidth = 1
        infoContainer.layer.cornerRadius = 10.0
        infoContainer.layer.borderColor = UIColor(hexString: "E5E5E5").cgColor
        infoContainer.layer.borderWidth = 1
        DocumentContainer.layer.borderColor = UIColor(hexString: "E5E5E5").cgColor
        DocumentContainer.layer.borderWidth = 1
        tabLineDocView?.layer.backgroundColor = UIColor.systemYellow.cgColor
        tabLineContView?.layer.backgroundColor = UIColor.systemGray.cgColor
        
      
        
        
    
        
        
      
        
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        switch activeSection {
        case .documents:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileUserViewControllerCells.documentsCollectionViewCell.rawValue, for: indexPath) as! DocumentsCollectionViewCell
            return cell
        case .contract:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileUserViewControllerCells.contractCollectionViewCell.rawValue, for: indexPath) as! ContractCollectionViewCell
            return cell
        }
    }
    
    func didTap(item: MenuItemType) {
        switch item {
        case .home:
            print("printaj home")
        case .add:
          print("printaj add")
  //          let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc =
//                storyboard.instantiateViewController(identifier: "AddViewController") as! AddViewController
//            navigationController?.pushViewController(vc, animated: true)
//
        case .search:
            print("Printaj src")

        case .doc:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc =
                storyboard.instantiateViewController(identifier: "ProfileUserViewController") as! ProfileUserViewController
            navigationController?.pushViewController(vc, animated: true)

        }
    }

}


