import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var arrayEndpoints: [Endpoint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }
    
    private func setupView() {
        setupEndpoints()
        tableView.register(RequestTableViewCell.nib, forCellReuseIdentifier: RequestTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
    }
    
    private func setupEndpoints() {
        
        arrayEndpoints.append(Endpoint.init(name: "Facility Access", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/facilityaccess", method: .POST, body: ["observations" : "", "employeeNumber" : "FCAG"], parseTo: .facilityAccessModel))
        
        arrayEndpoints.append(Endpoint.init(name: "Disclaimer", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/disclaimer", method: .PUT, body: ["idEmployee" : 1, "disclaimerFlag": true], parseTo: .disclaimerModel))
        arrayEndpoints.append(Endpoint.init(name: "Employee info", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee?username=oscar.valencia@softtek.com", method: .GET, body: nil, parseTo: .employeeModel))
        
        arrayEndpoints.append(Endpoint.init(name: "Health Profile", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/healthprofileflags", method: .PUT, body: ["pregnancyStatusFlag" : NSNull(), "publicMobilityFrequency": true, "idEmployee": 1], parseTo: .healthProfileFlagsModel))
        
        arrayEndpoints.append(Endpoint.init(name: "Health Conditions Employee", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/healthcondition", method: .POST, body: ["idEmployee" : 1,
                                                                                                                                                                                                 "conditions": [["idConditions" : 1, "descConditions": "Diabetes"], ["idConditions" : 3, "descConditions": "Heart Condition"]] ], parseTo: .healthConditionEmployeeModel))
        
        arrayEndpoints.append(Endpoint.init(name: "Health Condition Catalog", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/catalog/healthcondition", method: .GET, body: nil, parseTo: .healthConditionModel))
        
        arrayEndpoints.append(Endpoint.init(name: "Symptoms", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/symptom", method: .POST, body: ["idEmployee": 1, "symptoms": [["idSymptom": 1, "descSymptom": "Mareo"], ["idSymptom": 2, "descSymptom": "Dolor"]] ], parseTo: .symptomsModel))
        
        arrayEndpoints.append(Endpoint.init(name: "COVID Patient Contact", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/covidcontact", method: .POST, body: ["idEmployee": 1, "contactWithCovidPerson": true], parseTo: .covidContactModel))
        
        arrayEndpoints.append(Endpoint.init(name: "Travel", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/travel", method: .POST,
                                            body: ["idEmployee": 1, "travels": [["lastTravelDate": "2012-04-23", "travelCity": "Brasil", "arriveDate" : NSNull(), "leaveDate": NSNull()]] ], parseTo: .covidContactModel))
        
        arrayEndpoints.append(Endpoint.init(name: "Search Cities", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/travel?search=Alaska", method: .GET, body: nil, parseTo: .searchCitiesModel))
        
        arrayEndpoints.append(Endpoint.init(name: "Questionnaire completed", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/questionaryflag", method: .PUT, body: ["idEmployee" : 1, "questionaryFlag" : true], parseTo: .questionaryflagModel))
        
        arrayEndpoints.append(Endpoint.init(name: "Risk Suspect", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/risk/suspect?email=erik.torres@softtek.com", method: .GET, body: nil, parseTo: .riskSuspectModel))

        arrayEndpoints.append(Endpoint.init(name: "Covid Test Result", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/covidtest", method: .POST, body: ["employeeCovidTest": [ "idEmployee": 1,
                                                                                                                                                                                          "lab" : "MEXICO",
                                                                                                                                                                                          "labTypeTest" : "Blood test",
                                                                                                                                                                                          "testDate" : "Wed, 01 Jan 2020 00:00:00 GMT"]], parseTo: .covitTestModel ))
        
        arrayEndpoints.append(Endpoint.init(name: "Get QR", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/qr/access", method: .POST, body: ["idEmployee" : 505], parseTo: .accessQRModel))
        
        arrayEndpoints.append(Endpoint.init(name: "Checkout", url: "https://ddmx3eietd.execute-api.us-east-2.amazonaws.com/dev/employee/facilityaccess", method: .PUT, body: ["idEmployee" : 1], parseTo: .checkoutModel))
        
    }
    
    private func getEndpoint(atIndexPath: Int) -> Endpoint {
        return arrayEndpoints[atIndexPath]
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayEndpoints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: RequestTableViewCell.reuseIdentifier, for: indexPath) as? RequestTableViewCell {
            cell.setupTableViewCell(endpoint: getEndpoint(atIndexPath: indexPath.row))
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = SecondViewController.init(endpoint: getEndpoint(atIndexPath: indexPath.row))
        present(secondViewController, animated: true, completion: nil)
    }
    
}
