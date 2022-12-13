//
//  CreateEventRepository.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import Foundation
import Firebase
import FirebaseStorage
import SwiftUI
import FirebaseFirestore

protocol CreateEventRepositoryProtocol {
    func addEventToDB(image: UIImage, currentUsers: String, eventName: String, date: Date, placeName: String, participants: String, description: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void
}

final class CreateEventRepository: CreateEventRepositoryProtocol {
    func addEventToDB(image: UIImage, currentUsers: String, eventName: String, date: Date, placeName: String, participants: String, description: String, onResponse: @escaping(Result<Void, Error>) -> Void) {
        
        let db = Firestore.firestore()
        print("ceva")
        self.uploadPhoto(image: image) { result in
            switch result {
            case .success(let url):
                
                let db = Firestore.firestore()
                let ref = db.collection("events").document()
                ref.setData(["image": url.absoluteString, "currentUsers": currentUsers, "eventName": eventName, "date": date, "placeName": placeName, "participants": participants, "description": description]) { error in
                    if let error = error {
                        onResponse(.failure(error))
                    } else {
                        onResponse(.success(()))
                    }
                }
            case .failure(let error):
                onResponse(.failure(error))
            }
        }
    }
    
    func uploadPhoto (image: UIImage, onResponse: @escaping(Result<URL, Error>) -> Void ) -> Void{
        print("upload photo")
        let storageRef = Storage.storage().reference()
        let imageData = image.jpegData(compressionQuality: 0.8)
        guard imageData != nil else{
            return
        }
        let fileRef = storageRef.child("images/\(UUID().uuidString).jpg")
        
        let uploadTask = fileRef.putData(imageData!) { result, error in
            if let error = error {
                onResponse(.failure(error))
                return
            }
            
            fileRef.downloadURL() { url, error in
                if let url = url {
                    onResponse(.success(url))
                } else {
                    onResponse(.failure(error!))
                }
            }
        }
    }
}


