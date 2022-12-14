//
//  AdressViewController.swift
//  App use mobile
//
//  Created by Máira Talma on 08/06/22.
//

import UIKit

class AdressViewController: UIViewController {
    
    var adress: CepModel
    var fullAdress: String?
    
    @IBOutlet weak var cepTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var neighbohoodTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var complementTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var recipientTextField: UITextField!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var cityTextField: UITextField!
    
    init(adress: CepModel) {
        self.adress = adress
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.text = adress.localidade
        cepTextField.text = adress.cep
        streetTextField.text = adress.logradouro
        neighbohoodTextField.text = adress.bairro
        stateTextField.text = adress.uf
        numberTextField.text = adress.número
        recipientTextField.text = adress.destinatário
        complementTextField.text = adress.complemento
        
        clickButton.layer.cornerRadius = 5
        
    }
    
    @IBAction func clickButtonTag(_ sender: Any) {
        adress.complemento = complementTextField.text
        adress.número = numberTextField.text
        adress.destinatário = recipientTextField.text
        createFullAdress()
        goToTag()
    }

    private func createFullAdress() {
        
        let fullAdress = """
Destinatário: \(adress.destinatário ?? "").
Endereço: \(adress.logradouro ?? ""), \(adress.número ?? ""), \(adress.localidade ?? ""),\(adress.uf ?? ""), \(adress.bairro ?? "")

"""
        self.fullAdress = fullAdress
    }
    
    func goToTag() {
        guard let fullAdress = fullAdress else { return }
        let viewController = TagViewController(fullAdress: fullAdress)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
