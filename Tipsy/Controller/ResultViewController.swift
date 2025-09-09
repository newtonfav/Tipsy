

import UIKit

class ResultViewController: UIViewController {
    var billPerPerson: String?
    var numberOfPeople: Int?
    var tipPercentage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = billPerPerson
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \((tipPercentage)!)% tip."
    }
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)    
    }
    
}
