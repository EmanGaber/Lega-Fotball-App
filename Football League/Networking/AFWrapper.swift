//
//  AFWrapper.swift
//  ESS
//
//  Created by Eman Gaber on 3/5/19.
//  Copyright © 2019 CivilSoft. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AFWrapper: NSObject {
    
    class func requestGETURL(_ strURL: String, headers:HTTPHeaders?, params : [String : AnyObject]?, success:@escaping (DataResponse<Any, AFError>? ) -> Void, failure:@escaping (AFError) -> Void) {
       
        AF.request(strURL, method: .get, parameters: params, encoding: URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse) -> Void in


            switch(response.result) {
            case .success(let value):
                print(value)
                success(response)

            case .failure(_):

                print(response.error?.localizedDescription ?? "error hereee")
                failure(response.error!)
                break
            }
            
                
        }
    }

    
    class func requestPOSTURLBody(_ strURL: String, params : Parameters, headers:HTTPHeaders?, success:@escaping (JSON,DataResponse<Any, AFError>? ) -> Void, failure:@escaping (AFError) -> Void) {
       
        AF.request(strURL, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse) -> Void in


            switch(response.result) {
            case .success(let value):
                print(value)

                let resJson = JSON(response.value!)
                success(resJson,response)

            case .failure(_):

                print(response.error?.localizedDescription ?? "error hereee")
                failure(response.error!)
                break
            }
            
                
        }
    }

    class func RequestWithBody(_ request: URLRequest, success:@escaping (JSON,DataResponse<Any, AFError>? ) -> Void, failure:@escaping (AFError) -> Void)
    {
       
        AF.request(request).responseJSON { (response:DataResponse) -> Void in


            switch(response.result) {
            case .success(let value):
                print(value)

                let resJson = JSON(response.value!)
                success(resJson,response)

            case .failure(_):

                print(response.error?.localizedDescription ?? "error hereee")
                failure(response.error!)
                break
            }
            
                
        }
    }
      
    
}
