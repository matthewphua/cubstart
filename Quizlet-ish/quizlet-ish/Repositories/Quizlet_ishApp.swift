//
//  Quizlet_ishApp.swift
//  Shared
//
//  Created by Matthew Phua on 4/13/22.
//

import SwiftUI
import Firebase
@main
struct Quizlet_ishApp: App {
    init() {
        FirebaseApp.configure()
        AuthenticationService.signIn()

    }
    var body: some Scene {
        WindowGroup {
            CardListView()
        }
    }
}
