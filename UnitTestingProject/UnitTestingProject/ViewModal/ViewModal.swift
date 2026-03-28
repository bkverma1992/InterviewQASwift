//
//  ViewModal.swift
//  UnitTestingProject
//
//  Created by APPLE on 27/12/25.
//

import Foundation
class ViewModal {
    var onSuccess: ((User) -> Void)?
    var onFailure: ((String) -> Void)?
    var network: NetworkProtocol
    
    init(network: NetworkProtocol = NetworkService()) {
        self.network = network
    }
    
    func validateUser(name: String, pswd: String) {
        if name != "" && pswd != "" {
            network.loginApi { [weak self] result in
                switch result {
                case .success(let user):
                    self?.onSuccess!(user)
                    
                case .failure(let error):
                    print("\(error)")
                }
            }
        } else {
            onFailure?("Pleae Check your credencials")
        }
    }
}
