import UIKit

class AlarmDetailViewController: UIViewController {

    var alarm : Alarm!
    
    let textFieldContainer = UIView()
    let currenciesContainer = UIView()
    let alarmOperationsContainer = UIView()
    let stackView = UIStackView()
    
    let padding : CGFloat = 15
    
    
    init(alarm: Alarm? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.alarm = alarm
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemPink
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        print("uhuuul")
        
        configureStackView()
        
        configureTextFielContainer()
        
        configureCurrenciesContainer()
        
        configureAlarmOperationContainer()
        
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.tintColor = .systemRed
        stackView.spacing = 20

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
        
    }

    func configureTextFielContainer() {
        textFieldContainer.backgroundColor = .systemBlue
        textFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(textFieldContainer)
        
        NSLayoutConstraint.activate([
            textFieldContainer.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureCurrenciesContainer() {
        currenciesContainer.backgroundColor = .systemGray
        stackView.addArrangedSubview(currenciesContainer)
    }
    
    func configureAlarmOperationContainer() {
        alarmOperationsContainer.backgroundColor = .systemRed
        alarmOperationsContainer.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(alarmOperationsContainer)
        
        NSLayoutConstraint.activate([
            alarmOperationsContainer.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}
