import Foundation

enum NetworkError: Error {
    case unauthorized
    case forbidden
    case notFound
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingError
    case invalidURL
    case notConnectedToInternet
    case unknown(Error)
    
}
class APIClient {
    
    func fetch<T: Decodable>(request: URLRequest) async throws -> T {
    
        do {
            let (data,response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            switch httpResponse.statusCode {
                case 200...299:
                    break
                
                case 401:
                    throw NetworkError.unauthorized
                
                case 403:
                    throw NetworkError.forbidden
            
                case 404:
                    throw NetworkError.notFound
            
                default:
                    throw NetworkError.invalidStatusCode(httpResponse.statusCode)
            }
            
            return try JSONDecoder().decode(T.self, from: data)
            
        } catch let error as NetworkError {
            throw error
        }
        catch let error as URLError {
        
            switch error.code {
                case .badURL:
                    throw NetworkError.invalidURL
                    
                case .notConnectedToInternet:
                    throw NetworkError.notConnectedToInternet
                    
                default:
                    throw NetworkError.unknown(error)
            }
        } catch let error as DecodingError {
            throw NetworkError.decodingError
        } catch let error {
            throw NetworkError.unknown(error)
        }
        
    }
    
}
