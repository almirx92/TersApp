//
//  AddNewUserFormRequest.swift
//  TersApp
//
//  Created by Macbook on 22. 7. 2021..
//

import Foundation

public struct AddNewUserFormRequest: Codable {
    var jib: String?
    var pdv: String?
    var emailAddress: String?
    var companyAddress: String?
    var phoneNumber: String?
    var website: String?
}


//dodati validaciju
