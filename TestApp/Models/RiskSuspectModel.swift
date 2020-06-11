import Foundation

// MARK: - RiskSuspectModel
struct RiskSuspectModel: Codable {
    let data: DataRiskSuspectClass
    let status: Int
}

// MARK: - DataRiskSuspectClass
struct DataRiskSuspectClass: Codable {
    let isInCovidRisk: Bool
    let employeePrimarySymptoms: Int
    let covidContact, isCovidSuspected, covidConfirmation: Bool
    let employeeSecondarySymptoms: Int
}
