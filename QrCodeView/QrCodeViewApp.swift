//
//  QrCodeViewApp.swift
//  QrCodeView
//
//  Created by Michael Lustig on 10/26/21.
//

import SwiftUI

@main
struct QrCodeViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
