import Foundation

// MARK: - SearchCitiesModel
struct SearchCitiesModel: Codable {
    let status: Int
    let data: [DataSearchCities]
}

// MARK: - Datum
struct DataSearchCities: Codable {
    let name: String
}
