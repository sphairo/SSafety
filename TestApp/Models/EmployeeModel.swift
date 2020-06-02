/*
 {
   "status": 200,
   "data": {
     "employeeStatus": 200,
     "employeeData": {
       "idEmployee": 502,
       "idCatLunch": 1,
       "employeeNumber": "USRT2",
       "gender": "M",
       "name": "OSCAR",
       "firstName": "VALENCIA",
       "lastName": "ZUBIETA",
       "email": "oscar.valencia@softtek.com",
       "employeeStatus": true,
       "suspectStatus": false,
       "riskStatus": false,
       "covidConfirmation": false,
       "disclaimerFlag": true,
       "officeConfirmationAccess": false,
       "quizConfirmationFlag": true,
       "requiredSendMessageFlag": false,
       "returnGroup": 1,
       "createdDate": "2020-05-29",
       "updatedDate": "2020-05-29",
       "modifiedBy": "admin",
       "cognitoUser": "oscar.valencia"
     },
     "pregnancyStatusFlag": false,
     "publicMobilityFrequency": "Everyday",
     "employeeSymptomStatus": 200,
     "employeeSymptomData": [
       {
         "idEmployeeSymptom": 110,
         "idEmployee": 502,
         "symptom": {
           "idSymptom": 2,
           "descSymptom": "Cough",
           "statusSymptom": false,
           "primarySymptomFlag": true
         },
         "symptomDetectedDate": "2020-06-01"
       }
     ],
     "employeeConditionStatus": 404,
     "employeeConditionData": null,
     "errorMsg": null
   }
 }
 */
import Foundation

// MARK: - EmployeeModel
struct EmployeeModel: Codable {
    let status: Int
    let data: EmployeeDataClass
}

// MARK: - EmployeeDataClass
struct EmployeeDataClass: Codable {
    let employeeStatus: Int
    let employeeData: EmployeeData
    let pregnancyStatusFlag: Bool
    let publicMobilityFrequency: String
    let employeeSymptomStatus: Int
    let employeeSymptomData: [EmployeeSymptomDatum]
    let employeeConditionStatus: Int
    let employeeConditionData, errorMsg: String?
}

// MARK: - EmployeeData
struct EmployeeData: Codable {
    let idEmployee, idCatLunch: Int
    let employeeNumber, gender, name, firstName: String
    let lastName, email: String
    let employeeStatus, suspectStatus, riskStatus, covidConfirmation: Bool
    let disclaimerFlag, officeConfirmationAccess, quizConfirmationFlag, requiredSendMessageFlag: Bool
    let returnGroup: Int
    let createdDate, updatedDate, modifiedBy, cognitoUser: String
}

// MARK: - EmployeeSymptomDatum
struct EmployeeSymptomDatum: Codable {
    let idEmployeeSymptom, idEmployee: Int
    let symptom: Symptom
    let symptomDetectedDate: String
}

// MARK: - Symptom
struct Symptom: Codable {
    let idSymptom: Int
    let descSymptom: String
    let statusSymptom, primarySymptomFlag: Bool
}
