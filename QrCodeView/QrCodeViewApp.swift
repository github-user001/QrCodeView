//
//  QrCodeViewApp.swift
//  QrCodeView
//
//  Created by Michael Lustig on 10/26/21.
//

import SwiftUI

@main
struct QrCodeViewApp: App {
    let qrCodeToShow = "662ezJ2dRZr8DKoBrb6RZGPTdtLcBfJqho8pY7HBgtj2"
    var body: some Scene {
        WindowGroup {
            QrCodeView(qrCodeToShow)
            QrCodeView()
        }
    }
}
