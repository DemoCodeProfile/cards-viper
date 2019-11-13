//
//  CardAPIClient.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

final class CardAPIClient: APIClient {

    private let baseEndpointUrl = URL(string: "https://lookup.binlist.net/")!
    private let session = URLSession(configuration: .default)
    
    func send<T>(_ request: T, completion: @escaping (Result<T.Response, ResponseError>) -> Void) where T : APIRequest {
        guard Reachability.isConnectedToNetwork() else {
            completion(.failure(ResponseError.noNetworkConnection))
            return
        }
        let endpoint = self.endpoint(for: request)
        
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                DispatchQueue.main.async {
                    switch httpResponse.statusCode {
                    case 200...299:
                        if let data = data {
                            do {
                                let responseObject = try JSONDecoder().decode(T.Response.self, from: data)
                                completion(.success(responseObject))
                            } catch {
                                completion(.failure(ResponseError.failed(error.localizedDescription)))
                            }
                        } else if let error = error {
                            completion(.failure(ResponseError.failed(error.localizedDescription)))
                        }
                    case 401...403:
                        completion(.failure(ResponseError.authenticationError))
                    case 404...500:
                        completion(.failure(ResponseError.notFound))
                    case 501...599:
                        completion(.failure(ResponseError.badRequest))
                    case 600:
                        completion(.failure(ResponseError.outdated))
                    default: completion(.failure(ResponseError.failed("Undefened Error".translate())))
                    }
                }
            }
        }
        task.resume()
    }
    
    private func endpoint<T: APIRequest>(for request: T) -> URL {
        guard let baseUrl = URL(string: request.resourceName, relativeTo: baseEndpointUrl) else {
            fatalError("Bad resourceName: \(request.resourceName)")
        }
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
        components.queryItems = request.queryItem
        return components.url!
    }
}
