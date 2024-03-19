//
//  LoginNetworkService.swift
//  Messanger
//
//  Created by Admin on 16.03.2024.
//

import Foundation
import FirebaseAuth

final class LoginNetworkService {
    
    enum LoginError: Error {
        case error(String)
    }
    
    func login(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard let result = result,let email = result.user.email, error == nil else {
                completion(
                    .failure(
                        LoginError.error("User login error")
                    )
                )
                return
            }
            completion(.success(email))
        }
    }
}
