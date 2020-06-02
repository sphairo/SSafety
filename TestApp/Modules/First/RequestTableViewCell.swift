import UIKit

class RequestTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupTableViewCell(endpoint: Endpoint) {
        titleLabel.text = endpoint.name
    }
    
}
