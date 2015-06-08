private enum Router: URLRequestConvertible {
    static let baseURLString = "https://api-v2launch.trakt.tv/"
    
    case PopularShows
    case Show(String)
    case Seasons(showId: String)
    case Episodes(showId: String, season: Int)
    case Episode(showId: String, season: Int, number: Int)
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSURLRequest {
        let (path: String, parameters: [String: AnyObject]?, method: Alamofire.Method) = {
            switch self {
            case .PopularShows:
                return ("shows/popular", ["limit": 50, "extended": "images"], .GET)
            case .Show(let id):
                return ("shows/\(id)", ["extended": "images,full"], .GET)
            case .Seasons(let showId):
                return ("shows/\(showId)/seasons", ["extended": "images,full"], .GET)
            case .Episodes(let showId, let season):
                return ("shows/\(showId)/seasons/\(season)", ["extended": "images,full"], .GET)
            case .Episode(let showId, let season, let number):
                return ("shows/\(showId)/seasons/\(season)/episodes/\(number)", ["extended": "images,full"], .GET)
            }
            }()
        
        let URL = NSURL(string: Router.baseURLString)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        URLRequest.HTTPMethod = method.rawValue
        
        let encoding = Alamofire.ParameterEncoding.URL
        
        return encoding.encode(URLRequest, parameters: parameters).0
    }
}