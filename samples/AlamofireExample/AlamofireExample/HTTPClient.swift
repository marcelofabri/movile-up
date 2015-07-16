//
//  HTTPClient.swift
//  AlamofireExample
//
//  Created by CursoIOS on 7/8/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation
import Alamofire
import Result

private enum Router: URLRequestConvertible {
    static let baseURL = NSURL(string: "http://httpbin.org/")!
    
    case IP
    
    // MARK: URLRequestConvertible
    var URLRequest: NSURLRequest {
        let (path: String, parameters: [String: AnyObject]?, method: Alamofire.Method) = {
            switch self {
            case .IP:
                return ("ip", nil, .GET)
            }
            }()
        
        let URLRequest = NSMutableURLRequest(URL: Router.baseURL.URLByAppendingPathComponent(path))
        URLRequest.HTTPMethod = method.rawValue
        
        let encoding = Alamofire.ParameterEncoding.URL
        
        return encoding.encode(URLRequest, parameters: parameters).0
    }
}

class HTTPClient {
    private lazy var manager = Manager()
    
    func getIP(completion: ((Result<String, NSError?>) -> Void)?) {
        manager.request(Router.IP).validate().responseJSON { (_, _, responseObject, error) in
            if let json = responseObject as? NSDictionary,
                ip = json["origin"] as? String {
                    completion?(Result.success(ip))
            } else {
                completion?(Result.failure(error))
            }
        }
    }
}