import Foundation
/*
 
 {
   "status": 200,
   "data": [
     {
       "idConditions": 1,
       "descConditions": "Diabetes",
       "statusConditions": "0"
     },
     {
       "idConditions": 2,
       "descConditions": "High Blood Pressure",
       "statusConditions": "0"
     },
     {
       "idConditions": 3,
       "descConditions": "Heart Condition",
       "statusConditions": "0"
     },
     {
       "idConditions": 4,
       "descConditions": "Renal Decease",
       "statusConditions": "0"
     },
     {
       "idConditions": 5,
       "descConditions": "Cronic pulmonary decease",
       "statusConditions": "0"
     },
     {
       "idConditions": 6,
       "descConditions": "Cancer",
       "statusConditions": "0"
     },
     {
       "idConditions": 7,
       "descConditions": "Immunocompromise",
       "statusConditions": "0"
     },
     {
       "idConditions": 8,
       "descConditions": "VIH",
       "statusConditions": "0"
     },
     {
       "idConditions": 9,
       "descConditions": "Obesity",
       "statusConditions": "0"
     },
     {
       "idConditions": 10,
       "descConditions": "Smoking",
       "statusConditions": "0"
     },
     {
       "idConditions": 11,
       "descConditions": "None of the above",
       "statusConditions": "0"
     }
   ]
 }
 
 */
// MARK: - HealthconditionModel
struct HealthconditionModel: Codable {
    let status: Int
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let idConditions: Int
    let descConditions, statusConditions: String
}
