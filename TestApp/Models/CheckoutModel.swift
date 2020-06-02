/*
 {
   "status": 200,
   "data": "OK"
 }
 */
import Foundation

// MARK: - CheckoutModel
struct CheckoutModel: Codable {
    let status: Int
    let data: String
}
