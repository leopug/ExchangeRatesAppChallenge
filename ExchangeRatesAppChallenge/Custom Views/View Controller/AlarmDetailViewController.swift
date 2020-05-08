import UIKit

class AlarmDetailViewController: UIViewController {

    var alarm : Alarm!
    
    init(alarm: Alarm? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.alarm = alarm
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        print("uhuuul")
    }

}
