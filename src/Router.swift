private enum Router: URLRequestConvertible {
    static let baseURLString = "https://api-v2launch.trakt.tv/"
    
    case PopularShows
    
    // MARK: URLRequestConvertible
    var URLRequest: NSURLRequest {
        let (path: String, parameters: [String: AnyObject]?, method: Alamofire.Method) = {
            switch self {
            case .PopularShows:
                return ("shows/popular", ["limit": 50, "extended": "images"], .GET)
            }
            }()
        
        let URL = NSURL(string: Router.baseURLString)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        URLRequest.HTTPMethod = method.rawValue
        
        let encoding = Alamofire.ParameterEncoding.URL
        
        return encoding.encode(URLRequest, parameters: parameters).0
    }
}