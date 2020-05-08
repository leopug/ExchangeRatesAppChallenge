import UIKit

class ExchangeRateViewController: UIViewController {

    var exchangeTitleLabel: UILabel!
    var rateValueLabel: UILabel!
    var currencyPickerView: CurrencyPickerView!
    var pickerViewModel: PickerViewModel!
    var exchangeRateViewModel: ExchangeRateViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        exchangeRateViewModel = ExchangeRateViewModel()
        
        pickerViewModel = PickerViewModel(currencyReceivable: exchangeRateViewModel)
        
        setupExchangeTitle()
        
        setupExchangeValue()
        
        setupCurrencyPicker()
        
        setupConstraints()
        
    }
    
    func setupExchangeTitle(){
        exchangeTitleLabel = ERTitleLabel(fontSize: 44, textAlignment: .center)
        exchangeTitleLabel.text = "DOLAR'AMA APP"
        exchangeTitleLabel.backgroundColor = .white
        view.addSubview(exchangeTitleLabel)
    }
    
    func setupExchangeValue(){
        rateValueLabel = UILabel()
        rateValueLabel.translatesAutoresizingMaskIntoConstraints = false
        rateValueLabel.text = "49.3"
        rateValueLabel.textAlignment = .center
        rateValueLabel.backgroundColor = .red
        rateValueLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        view.addSubview(rateValueLabel)
    }
    
    func setupCurrencyPicker(){
        currencyPickerView = CurrencyPickerView(viewModel: pickerViewModel, frame: .zero)
        currencyPickerView.translatesAutoresizingMaskIntoConstraints = false
        currencyPickerView.backgroundColor = .white
        
        view.addSubview(currencyPickerView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
         
         exchangeTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         exchangeTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         exchangeTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         exchangeTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         exchangeTitleLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2),

         rateValueLabel.topAnchor.constraint(equalTo: exchangeTitleLabel.bottomAnchor),
         rateValueLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         rateValueLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         rateValueLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

         currencyPickerView.topAnchor.constraint(equalTo: rateValueLabel.bottomAnchor),
         currencyPickerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         currencyPickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         currencyPickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         currencyPickerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
         currencyPickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
