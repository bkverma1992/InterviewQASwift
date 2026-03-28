import Foundation

public struct Network {
    public init() {}
    
    public func loadRequest(completion: (Result<Data, Error>) -> Void )  {
        let url = "https://api.slingacademy.com/v1/sample-data/photos?limit=10"
        
        let request = URLRequest(url: URL(string: url)!)
        var response: AutoreleasingUnsafeMutablePointer<URLResponse?>?
        
        do {
            let data = try NSURLConnection.sendSynchronousRequest(request, returning: response)
            completion(.success(data))
        } catch(let error) {
            completion(.failure(error))
        }
        
    }
}
