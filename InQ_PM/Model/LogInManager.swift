//
//  LogInManager.swift
//  InQ_PM
//
//  Created by RooZin on 2022/02/16.
//

import Foundation
import Alamofire

protocol LogInManagerDelegate {
    func loginCheck(_ data : Check)
    
}

struct LogInManager {
    
    var delegate : LogInManagerDelegate?
    
    func logIn(_ id : String, _ pw : String) {
        let URL = "https://61ed-115-143-100-251.ngrok.io/login"
        let param = Login(loginId: id, pw: pw)
        let userManager = UserManager()
        
        AF.request(URL, method: .post, parameters: param).responseJSON { response in
            print("response: \(response)")
            var pass : Check
            do {
                let decoder = JSONDecoder()
                switch (response.result) {
                case .success:
                    pass = try decoder.decode(Check.self, from: response.data!)
                    delegate?.loginCheck(pass)
                    userManager.getCurrentUser(id)
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


