
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    @IBAction func guessButtonClicked(_ sender: Any)
    {
        if numberTF.text == ""    {
            alertAction(message: "Please Write Number!")
        }else if Int(numberTF.text!)! > 10 {
            alertAction(message: "Please Between 0 and 10")
        }
        else {
            let randomNumber = String(arc4random_uniform(11))
            if numberTF.text == randomNumber
            {
                numberLabel.text = "Congratulations"
            }else
            {
                numberLabel.text = "False. True Number="+String(randomNumber)
            }
        }
    }
    @IBAction func exitButtonClicked(_ sender: Any)
    {
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
    }
    func alertAction(message: String)
    {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
           }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

