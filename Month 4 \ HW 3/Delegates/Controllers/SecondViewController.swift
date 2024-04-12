//
//  SecondViewController.swift
//  Month 4 \ HW 3
//
//  Created by Aslan Toktogulov on 12/3/24.
//

import UIKit


class SecondViewController: UIViewController, UITableViewDataSource {
    
    var Contacts: [Contact] = []
    private let cellID = "cell"

    private lazy var myContactsLbl: UILabel = MakerView().makeLbl(text: "My contacts",
                                                                  textColor: .black,
                                                                  textSize: 20,
                                                                  ofSize: .semibold)
    
    private let myTableView: UITableView = {
    let tableView = UITableView()
          tableView.translatesAutoresizingMaskIntoConstraints = false
          return tableView
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
     
        setupmyContactsLbl()
        setupmyTableView()
        setupData()
    }
  
    private func setupmyContactsLbl() {
        view.addSubview(myContactsLbl)
        
        NSLayoutConstraint.activate([
            myContactsLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -30),
            myContactsLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupmyTableView() {
        view.addSubview(myTableView)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            myTableView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupData() {
        Contacts = [
            Contact(image: "1", name: "Jane Cooper", phoneNumber: "(270) 555-0117"),
            Contact(image: "2", name: "Devon Lane", phoneNumber: "(308) 555-0121"),
            Contact(image: "3", name: "Darrell Steward" , phoneNumber: "(684) 555-0102"),
            Contact(image: "4", name: "Devon Lane", phoneNumber: "(704) 555-0127"),
            Contact(image: "5", name: "Courtney Henry", phoneNumber: "(505) 555-0125"),
            Contact(image: "6", name: "Wade Warren", phoneNumber: "(225) 555-0118"),
            Contact(image: "7", name: "Bessie Cooper", phoneNumber: "(406) 555-0120"),
            Contact(image: "8", name: "Robert Fox", phoneNumber: "(480) 555-0103"),
            Contact(image: "9", name: "Jacob Jones", phoneNumber: "(702) 555-0122"),
            Contact(image: "10", name: "Jenny Wilson", phoneNumber: "(239) 555-0108"),
            Contact(image: "1", name: "Almaz", phoneNumber: "(222) 222 222"),
            Contact(image: "4", name: "Bektur", phoneNumber: "(501) 235 111"),
            Contact(image: "5", name: "Samir", phoneNumber: "(703) 322 384"),
            Contact(image: "8", name: "Aslan", phoneNumber: "(227) 444 444"),
            Contact(image: "6", name: "Abdylda", phoneNumber: "(555) 555 555")
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        guard indexPath.row < Contacts.count else {
            return cell
        }
        
        let contact = Contacts[indexPath.row]
    
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phoneNumber
        cell.imageView?.image = UIImage(named: contact.image)
        
        return cell
    }

}
