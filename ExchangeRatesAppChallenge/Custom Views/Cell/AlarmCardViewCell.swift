import UIKit

class AlarmCardViewCell: UICollectionViewCell {
    static let reuseID = "alarmCellID"
    var gl:CAGradientLayer!
    
    let baseCurrency = ERTitleLabel(fontSize: 16, textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ alarm: Alarm) {
        baseCurrency.text = alarm.baseCurrency.rawValue
    }
    
    fileprivate func setGradientColor() {
        let colorTop = UIColor.white.cgColor
        let colorBottom = UIColor(red: 0.941 , green: 0.818, blue: .zero, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.cornerRadius = 12
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        let padding : CGFloat = 8
        
        setGradientColor()
        
        addSubview(baseCurrency)

        NSLayoutConstraint.activate([
            baseCurrency.topAnchor.constraint(equalTo: contentView.topAnchor),
            baseCurrency.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            baseCurrency.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            baseCurrency.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
