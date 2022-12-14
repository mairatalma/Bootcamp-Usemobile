//
//  HomeViewController.swift
//  App use mobile
//
//  Created by Máira Talma on 08/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var imageLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.layer.cornerRadius = 5
        
        textField.delegate = self
        
    }

    @IBAction func searchButtonClicked(_ sender: Any) {
        guard let text = textField.text else { return }
        guard let url = URL(string: "https://viacep.com.br/ws/\(text)/json/") else { return }
        
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("STATUS CODE: ", response.statusCode)
            }
            guard let data = data else { return }
            guard let cepModel = try? JSONDecoder().decode(CepModel.self, from: data) else { return }
            self.goToAdress(adress: cepModel)
            print(cepModel)
        }
        task.resume()
    }
    
    func goToAdress(adress: CepModel) {
        DispatchQueue.main.async {
            let viewController = AdressViewController(adress: adress)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return false}
        return text.count < 8
    }

}
