//
//  cognitiveServices.swift
//  CognitiveAssignment
//
//  Created by Shane Jackson on 2017-03-28.
//  Copyright © 2017 Shane Jackson. All rights reserved.
//



import Foundation
import Alamofire


class CognitiveService {
    
    static let instance = CognitiveService()
    static let apiKey = "e256ef3fbce54ddea8789a758353cef6" /// set in constants file
    static let apiUrl = "https://api.projectoxford.ai/vision/v1.0/analyze?visualFeatures=Faces" /// set in constants file
    
    
    func test() {
        var header = [String : String]()
        header["Ocp-Apim-Subscription-Key"] = CognitiveService.apiKey
        
        let url = "http://www.stefantell.se/blog/wp-content/uploads/2013/12/lighting-groups-of-two-people-with-one-light.jpg"
        
        let params:[String: String] = ["url": url]
        
        let request = Alamofire.request(CognitiveService.apiUrl, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header)
        
        print("\(request)")
        var results: [String:AnyObject]!
        request.responseJSON { (response) in
            results = response.value as! [String : AnyObject]!
            
            //print(results)
            print(response)
        }
        
}
}
