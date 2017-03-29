//
//  cognitiveServices.swift
//  CognitiveAssignment
//
//  Created by Shane Jackson on 2017-03-28.
//  Copyright © 2017 Shane Jackson. All rights reserved.
//



import Foundation
import Alamofire
import Alamofire_Synchronous


class CognitiveService {
    
    static let instance = CognitiveService()
    static let apiKey = "e256ef3fbce54ddea8789a758353cef6" /// set in constants file
    static let apiUrl = "https://api.projectoxford.ai/vision/v1.0/analyze?visualFeatures=Faces" /// set in constants file
    var ageArray:[Int] = []
    var genderArray:[String] = []
    
    func getAges() -> [Int]{
        return self.ageArray
    }
    
    func getGenders() -> [String]{
        return self.genderArray
    }
    
    func test() {
        print("inside test")
        var header = [String : String]()
        header["Ocp-Apim-Subscription-Key"] = CognitiveService.apiKey
        
        let url = "http://www.stefantell.se/blog/wp-content/uploads/2013/12/lighting-groups-of-two-people-with-one-light.jpg"
        
        let params:[String: String] = ["url": url]

        //let request = Alamofire.request(CognitiveService.apiUrl, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header)
        
        //print("\(request)")
        
        //http://stackoverflow.com/questions/39961010/how-to-make-a-synchronous-request-using-alamofire
        
        Alamofire.request(CognitiveService.apiUrl, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { response in
        
        switch(response.result) {
        case .success(_):
            if let results = response.result.value as! [[String : AnyObject]]!{
                //Here I retrieve the data
                
                if let jsonDict = response.result.value as? [String:Any],
                                let dataArray = jsonDict["faces"] as? [[String:Any]] {
                                self.genderArray = dataArray.flatMap { $0["gender"] as? String }
                                self.ageArray = dataArray.flatMap {$0["age"] as? Int}
                                print("PRINTING DATA ARRAY!!!!!!")
                                //print(dataArray)
                
                            }
            }
            //completion(number: numberRows, strArr1 : nameArray, strArr2 : ageArray, strArr3: birthdayArray)
            break
            
        case .failure(_):
            print("Error")
            //completion(number: numberRows, strArr1 : nameArray, strArr2 : ageArray, strArr3: birthdayArray)
            break
        }
        
//        var results: [String:AnyObject]!
//        request.responseJSON { (response) in
//            results = response.value as! [String : Any]! as [String : AnyObject]!
//
//            
//            if let jsonDict = response.result.value as? [String:Any],
//                let dataArray = jsonDict["faces"] as? [[String:Any]] {
//                self.genderArray = dataArray.flatMap { $0["gender"] as? String }
//                self.ageArray = dataArray.flatMap {$0["age"] as? Int}
//                print("PRINTING DATA ARRAY!!!!!!")
//                //print(dataArray)
//
//            }
//
//        }
        
        
        }
    }
    
}
