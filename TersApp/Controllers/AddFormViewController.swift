//
//  FormViewController.swift
//  TersApp
//
//  Created by Macbook on 17. 7. 2021..
//

import UIKit
import Eureka

class AddFormViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
           form +++ Section("Section1")
               <<< TextRow(){ row in
                   row.title = "Text Row"
                   row.placeholder = "Enter text here"
               }
               <<< PhoneRow(){
                   $0.title = "Phone Row"
                   $0.placeholder = "And numbers here"
               }
           +++ Section("Section2")
               <<< DateRow(){
                   $0.title = "Date Row"
                   $0.value = Date(timeIntervalSinceReferenceDate: 0)
               }
       }
        // Do any additional setup after loading the view.
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
