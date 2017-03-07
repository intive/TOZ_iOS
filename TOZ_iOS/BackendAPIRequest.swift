import Foundation

protocol BackendAPIRequest {
/**
Classes implementing this protocol are able to provide informations required
to build a request.
*/
    var endpoint: String { get }
    var method: NetworkService.Method { get }
    //NetworkService.Method is enum with GET, POST, PUT, DELETE for RESTful API:
    var query: NetworkService.QueryType { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

extension BackendAPIRequest {

    /// Returns default headers for JSON content
    func defaultJSONHeaders() -> [String: String] {

        return ["Content-Type": "application/json"]
    }
}
