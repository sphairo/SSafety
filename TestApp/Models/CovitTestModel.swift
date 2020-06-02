/*
 {
     "status": 200,
     "data": "OK"
 }
 */
import Foundation
// MARK: - CovitTestModel
struct CovitTestModel: Codable {
    let status: Int
    let message: String?
}
