
import UIKit

enum Section {
    case main
}

class AlarmViewController: UIViewController {

    var collectionView: UICollectionView!
    var viewModel: AlarmOrchestrator!
    var dataSource : UICollectionViewDiffableDataSource<Section,Alarm>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
        
        viewModel = AlarmViewModel()

        setupCollectionView()
        
        setupConstraints()
        
        configureDataSource()
                
    }

    fileprivate func setupViewController() {
        view.backgroundColor = .purple
        title = "Rate Alarms"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlarm))
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AlarmCardViewCell.self, forCellWithReuseIdentifier: AlarmCardViewCell.reuseID)
        view.addSubview(collectionView)
        
    }
    
     func createFlowLayout()-> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let verticalPadding: CGFloat = 6
        let horizontalPadding: CGFloat = 6
        let itemWidth = width - horizontalPadding*2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: 50)
        return flowLayout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section,Alarm>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, alarm) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlarmCardViewCell.reuseID, for: indexPath) as? AlarmCardViewCell
            cell?.set(alarm) //configuring cell
            return cell
        })
    }
    
    func updateData(on alarms: [Alarm]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Alarm>()
        snapshot.appendSections([.main])
        snapshot.appendItems(alarms)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    @objc func addAlarm() {
        let newAlarm = Alarm(price: 12.3,
                             baseCurrency: .BRL ,
                             targeCurrency: .DOL,
                             operation: .more)
        
        viewModel.addAlarm(newAlarm)
        updateData(on: viewModel.getAlarms())
        print(viewModel.getAlarms().count,"what the hell")
        
        let alarmDetailVC = AlarmDetailViewController()
        present(alarmDetailVC,animated: true)
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
         collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
