import Foundation

// MARK: - FacilityAccessModel
struct FacilityAccessModel: Codable {
    let status: Int
    let data: DataModelClass
}

// MARK: - DataModelClass
struct DataModelClass: Codable {
    let idEmployee, idCatLunch: Int
    let employeeNumber, name, firstName, lastName: String
    let email: String
    let employeeStatus, suspectStatus, riskStatus, covidConfirmation: Bool
    let officeConfirmationAccess: Bool
    let lunchScheduleDate: String?
}
