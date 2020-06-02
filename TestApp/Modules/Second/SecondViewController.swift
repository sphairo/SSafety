import UIKit

class SecondViewController: UIViewController {

    private(set) var endpoint: Endpoint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    init(endpoint: Endpoint) {
        super.init(nibName: nil, bundle: nil)
        self.endpoint = endpoint
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        contentLabel.text = ""
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        calling(endpoint: self.endpoint)
    }
    
    func calling(endpoint: Endpoint) {
        titleLabel.text = endpoint.name
        switch endpoint.parseTo {
        case .accessQRModel:
            qrAccess()
            break
        case .disclaimerModel:
            saveDisclaimer()
        case .healthConditionModel:
            healthCondition()
        case .healthProfileFlagsModel:
            healthProfileFlags()
            break
        case .symptomsModel:
            symtomps()
        case .covitTestModel:
            covitTest()
        case .employeeModel:
            getEmployeeInfo()
        case .facilityAccessModel:
            facilityAccess()
        case .healthConditionEmployeeModel:
            healthConditionEmployee()
        case .covidContactModel:
            covidContact()
        case .travelModel:
            saveTravel()
        case .searchCitiesModel:
            searchCities()
        case .questionaryflagModel:
            saveQuestionaryFlag()
        case .checkoutModel:
            checkout()
        }
    }
    
    func setupContent(content: String) {
        DispatchQueue.main.async { [weak self] in
            self?.contentLabel.text = content
            self?.contentLabel.numberOfLines = 0
            self?.contentLabel.sizeToFit()
            self?.indicator.stopAnimating()
        }
    }
    
    private func qrAccess() {
        RequestManager<AccessQRModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func saveDisclaimer() {
        RequestManager<DisclaimerModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func healthCondition() {
        RequestManager<HealthconditionModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func healthProfileFlags() {
        RequestManager<HealthProfileFlagsModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func symtomps() {
        RequestManager<SymptomsModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func covitTest() {
        RequestManager<CovitTestModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func getEmployeeInfo() {
        RequestManager<EmployeeModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func facilityAccess() {
        RequestManager<FacilityAccessModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func healthConditionEmployee() {
        RequestManager<HealthConditionEmployeeModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func covidContact() {
        RequestManager<CovidContactModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func saveTravel() {
        RequestManager<TravelModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func searchCities() {
        RequestManager<SearchCitiesModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func saveQuestionaryFlag() {
        RequestManager<QuestionaryFlagModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
    
    private func checkout() {
        RequestManager<CheckoutModel>.request(with: endpoint.url, jsonObject: endpoint.body, method: endpoint.method) { (success, jsonData, model , error, statusCode) in
            if let jsonData = jsonData {
                if let json = jsonData.prettyPrintedJSONString {
                    if let model = model {
                        print(model)
                        self.setupContent(content: json as String)
                    }
                }
            } else {
                self.setupContent(content: "Data is nil ☹️")
            }
        }
    }
}
