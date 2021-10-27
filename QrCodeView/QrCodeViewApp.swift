//
//  QrCodeViewApp.swift
//  QrCodeView
//
//  Created by Michael Lustig on 10/26/21.
//

import SwiftUI

@main
struct QrCodeViewApp: App {
    let qrCodeToShow = "my actual public key in solana"
    var body: some Scene {
        WindowGroup {
            QrCodeView(qrCode: qrCodeToShow)
        }
    }
}
