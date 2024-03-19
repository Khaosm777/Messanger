//
//  RegisterNetworkService.swift
//  Messanger
//
//  Created by Admin on 16.03.2024.
//

import Foundation
import FirebaseAuth

final class RegisterNetworkService {
    
    enum RegisterError: Error {
        case error(String)
    }
    
    func register(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let result = result,let email = result.user.email, error == nil else {
                completion(
                    .failure(
                        RegisterError.error("User creation error")
                    )
                )
                return
            }
            completion(.success(email))
        }
    }
}
