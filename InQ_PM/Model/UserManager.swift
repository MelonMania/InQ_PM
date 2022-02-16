//
//  UserManager.swift
//  InQ_PM
//
//  Created by RooZin on 2022/02/16.
//

import Foundation
import Alamofire

protocol UserManagerDelegate {
    func adoptCurrentUser(_ member : MemberData)
}

struct UserManager {
    
    var delegate : UserManagerDelegate?
    public var current : MemberData?
    
    func getCurrentUser(_ id : String) {
        let URL = "https://61ed-115-143-100-251.ngrok.io/members"
        
        AF.request(URL, method: .get).responseJSON { response in
            print("response: \(response)")
            var members : [MemberData]
            do {
                let decoder = JSONDecoder()
                switch (response.result) {
                case .success:
                    members = try decoder.decode([MemberData].self, from: response.data!)
                    for i in 0 ..< members.count {
                        if id == members[i].loginId {
                            print(members[i])
                            delegate?.adoptCurrentUser(members[i])
                        }
                    }
                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error : ", parsingError)
            }
        }.resume()
    }
}
