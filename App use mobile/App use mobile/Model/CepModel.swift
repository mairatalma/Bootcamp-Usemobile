//
//  CepModel.swift
//  App use mobile
//
//  Created by Máira Talma on 11/06/22.
//

import UIKit

struct CepModel: Decodable {
    let cep: String?
    var logradouro: String?
    let bairro: String?
    var complemento: String?
    var número: String?
    let localidade: String?
    let uf: String?
    var destinatário: String?
}
