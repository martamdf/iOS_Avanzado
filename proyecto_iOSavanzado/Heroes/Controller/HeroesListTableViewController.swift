//
//  HeroesListTableViewController.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 24/2/23.
//

import UIKit

class HeroesListTableViewController : UIViewController {
    
    var mainView: HeroesListTableView {self.view as! HeroesListTableView}
    var heroesList: [HeroModel] = []
    var viewModel: HeroesListViewModel?
    
    private var tableViewDataSource: HeroesListTableViewDataSource?
    private var tableVideDelegate: HeroesListTableViewDelegate?
    
    private var heroMapViewModel = HeroMapViewModel()
    private var heroeListViewModel = HeroesListViewModel()
    private var loginViewModel = LoginViewModel()
    
    private var loginViewController: LoginViewController?
    
    override func loadView() {
        view = HeroesListTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.logoutButton.addTarget(self, action: #selector(buttonLogoutPressed), for: .touchUpInside)
        
        setTableElements()
        setDidTapOnCell()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(logout),
                                               name: Notification.Name("logout"),
                                               object: nil)
        
        if !isKeyChainData() {
            loginViewController = LoginViewController(delegate: self)
            if let loginViewController { // swift 5.7
                loginViewController.modalPresentationStyle = .fullScreen
                self.navigationController?.present(loginViewController, animated: true)
            }
            
            return
        }
        getHeroesData()
    }
    
    
    private func setTableElements() {
        tableVideDelegate = HeroesListTableViewDelegate()
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView)
        mainView.heroesTableView.dataSource = tableViewDataSource
        mainView.heroesTableView.delegate = tableVideDelegate
    }
    
    private func setDidTapOnCell() {
                tableVideDelegate?.didTapOnCell = { [weak self] index in
                    guard let datasource = self?.tableViewDataSource else { return }
        
                    let hero = datasource.heroes[index]
                    let heroDetailViewController = HeroDetailViewController(hero)
                    
                    // Presentamos el nuevo view controller
                    self?.present(heroDetailViewController, animated: true)
                }
    }
    
//    private func getData() {
//        // Nos preparamos para capturar los datos devueltos por el api rest
//        heroeListViewModel = HeroesListViewModel()//apiClient: ApiClient(token: getKeyChainToken()))
//        heroeListViewModel.updateUI = { [weak self] heroes in
//            self?.heroesList = heroes
//            //self?.tableViewDataSource?.set(heroes: heroes)
//        }
//
//        // Ejecutamos la llamada al api rest
//        heroeListViewModel.getData()
//    }
    
    private func getHeroesData() {
        if getStoredHeroes().count == 0 {
            
            let moveToMain = { (heroes: [HeroModel]) -> Void in
                
                heroes.forEach { storeHero($0.id, $0.name, $0.description, $0.photo, String($0.longitud!), String($0.latitud!))
                }
                
                self.tableViewDataSource?.set(heroes: getStoredHeroes())
            }
            let updateFullItems = { (heroes: [HeroModel]) -> Void in
                
                let group = DispatchGroup()
                for hero in heroes {
                    group.enter()  // INDICA QUE LA OPERACIÓN COMIENZA
                    
                    self.heroMapViewModel.updateUI = { [weak self] hero, heroLocations in
                        var fullHero = hero
                        if let firstLocation = heroLocations.first {
                            fullHero.latitud = Double(firstLocation.latitud)
                            fullHero.longitud = Double(firstLocation.longitud)
                        } else {
                            fullHero.latitud = 0.0
                            fullHero.longitud = 0.0
                        }
                        self?.heroesList.append(fullHero)
                        group.leave() // INDICA QUE LA OPERACIÓN TERMINA
                    }
                    self.heroMapViewModel.getData(heroe: hero)
                }
                
                group.notify(queue: .main) {
                    moveToMain(self.heroesList)
                }
            }
            
            self.heroeListViewModel.updateUI = { heroes in
                updateFullItems(heroes)
            }
            
            self.heroeListViewModel.getData()
            return
            
        } else {
            debugPrint("Request Heroes CoreData")
            tableViewDataSource?.set(heroes: getStoredHeroes())
            
        }
        
    }
    
    @objc func logout() {
        deleteDataKeyChain()
        deleteStoredHeroes()
        
        tableViewDataSource?.set(heroes: getStoredHeroes())
        
        loginViewController = LoginViewController(delegate: self)
        if let loginViewController { // swift 5.7
            loginViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(loginViewController, animated: true)
        }
    }
    
    @objc func buttonLogoutPressed(_ sender: Any) {
        NotificationCenter.default.post(Notification(name: Notification.Name("logout")))
    }
}

extension HeroesListTableViewController: LoginDelegate {
    
    func dismiss() {
        DispatchQueue.main.async {
            self.loginViewController?.dismiss(animated: true)
            self.getHeroesData()
        }
    }
}
