//
//  TagViewController.swift
//  App use mobile
//
//  Created by Máira Talma on 08/06/22.
//

import UIKit

class TagViewController: UIViewController {
    
    var fullAdress: String
    
    @IBOutlet weak var viewTag: UIView!
    @IBOutlet weak var tagText: UILabel!
    
    init(fullAdress: String) {
        self.fullAdress = fullAdress
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.title = "hello"
        tagText.text = fullAdress
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.tintColor = UIColor(named: "useColor")
        
    }
    private func setupUI() {
        viewTag.layer.cornerRadius = 6
    }
    
}

