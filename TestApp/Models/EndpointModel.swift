import Foundation

public enum ModelType: String {
    case facilityAccessModel = "facilityAccess"
    case accessQRModel = "AccessQRModel"
    case disclaimerModel = "DisclaimerModel"
    case employeeModel = "EmployeeModel"
    case healthConditionModel = "Healthcondition"
    case healthConditionEmployeeModel = "HealthConditionEmployee"
    case healthProfileFlagsModel = "HealthProfileFlagsModel"
    case symptomsModel = "SymptomsModel"
    case covidContactModel = "CovidContactModel"
    case questionaryflagModel = "QuestionaryflagModel"
    case riskSuspectModel = "RiskSuspectModel"
    case searchCitiesModel = "SearchCitiesModel"
    case travelModel = "TravelModel"
    case covitTestModel = "CovitTestModel"
    case checkoutModel = "CheckoutModel"
}

struct Endpoint {
    let name: String
    let url: String
    let method: HttpMethod
    let body: [String : Any]?
    let parseTo: ModelType
}
