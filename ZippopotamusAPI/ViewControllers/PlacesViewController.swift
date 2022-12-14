//
//  PlacesViewController.swift
//  ZippopotamusAPI
//
//  Created by Руслан Шигапов on 09.11.2022.
//

import UIKit

class PlacesViewController: UITableViewController {

    private var zip: Zip?
    
    private var spinnerView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        showSpinner(in: view)
        fetchZip()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "\(zip?.postCode ?? "00000") \(zip?.country ?? "") (\(zip?.countryAbbreviation ?? ""))"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        zip?.places.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "place", for: indexPath)
        guard let cell = cell as? PlaceCell else { return UITableViewCell() }
        if let place = zip?.places[indexPath.row] {
            cell.configure(with: place)
        }
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - UIActivityIndicatorView
    private func showSpinner(in view: UIView) {
        spinnerView = UIActivityIndicatorView(style: .large)
        spinnerView.color = .gray
        spinnerView.startAnimating()
        spinnerView.center = view.center
        spinnerView.hidesWhenStopped = true
        
        view.addSubview(spinnerView)
    }
    
    // MARK: - Networking
    private func fetchZip() {
        NetworkManager.shared.fetchZip(from: Link.url.rawValue) { [weak self] result in
            switch result {
            case .success(let zip):
                self?.zip = zip
                self?.tableView.reloadData()
                self?.spinnerView.stopAnimating()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

