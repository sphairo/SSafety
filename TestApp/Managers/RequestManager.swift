import Foundation

public enum HttpMethod:String {
    case GET
    case PUT
    case PATCH
    case POST
}

class RequestManager<Model: Codable> {
    
    static func request(with urlString: String, jsonObject:  [String : Any]?, method:HttpMethod, completion: @escaping (_ success: Bool, _ object: Data?, _ response: Model?, _ error: Error?, _ statusCode: Int?) -> ()) {
        guard URL.init(string: urlString) != nil else {return}
        let request = createRequestWithtUrlString(urlString: urlString, method: method, jsonObject: jsonObject)
        self.dataTaskWithStatusCode(request: request, completion: completion)
    }
    
    static private func createRequestWithtUrlString(urlString:String, method:HttpMethod, jsonObject:[String : Any]?) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: URL(string: urlString)!)
        request.httpMethod = method.rawValue
        if let jsonObject = jsonObject {
            if let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]) {
                request.httpBody = data
            }
        }
        return request
    }
    
    static private func dataTaskWithStatusCode(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: Data?, _ response: Model?, _ error: Error?, _ statusCode: Int?) -> ()) {
        let session = createURLSession()
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data, let response = response as? HTTPURLResponse {
                if 200...299 ~= response.statusCode {
                    guard let model = RequestManager<Model>.self.parsedModel(with: data, at: request.url?.absoluteString ?? "") else {
                        print("no pudo decodificar la respuesta \(response.description)")
                        completion(false, data, nil, nil, response.statusCode)
                        return
                    }
                    completion(true, data, model, error, response.statusCode)
                } else {
                    completion(false, data, nil, error, response.statusCode)
                }
            } else {
                completion(false, data, nil, error, nil)
            }
            }.resume()
    }
    
    static private func createURLSession() -> URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 30.0
        sessionConfiguration.timeoutIntervalForResource = 30.0
        let urlSession = URLSession(configuration: sessionConfiguration)
        return urlSession
    }
    
    static func parsedModel(with data: Data, at path: String?) -> Model? {
        do {
            print("response = ",data)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
            if let dictAtPath = json as? [String: Any] {
                let jsonData = try JSONSerialization.data(withJSONObject: dictAtPath, options: .prettyPrinted)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                do {
                    let model =  try decoder.decode(Model.self, from: jsonData)
                    return model
                } catch let err {
                    print(err)
                    return nil
                }
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}
