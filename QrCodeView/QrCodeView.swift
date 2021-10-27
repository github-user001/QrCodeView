//
//  ContentView.swift
//  QrCodeView
//
//  Created by Michael Lustig on 10/26/21.
//

import SwiftUI

class QrCodeViewModel: ObservableObject {
    
    var qrCode: String?
    
    init(_ qrCode: String?) {
        self.qrCode = qrCode
    }
    
    enum QrCodeViewState: String {
        case scanning = "Scanning";
        case displaying = "Displaying"
    }
    
    var viewState: QrCodeViewState {
        return qrCode == nil ? QrCodeViewState.scanning : QrCodeViewState.displaying
    }
}


struct QrCodeDisplayView: View {
    var qrCode: String
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: getQRCodeDate(text: qrCode)!)!)
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
    
    func getQRCodeDate(text: String) -> Data? {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        let data = text.data(using: .ascii, allowLossyConversion: false)
        filter.setValue(data, forKey: "inputMessage")
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
}


struct QrCodeView: View {
    
    @ObservedObject private var qrCodeViewModel: QrCodeViewModel
    
    init(_ qrCode: String? = nil) {
        self.qrCodeViewModel = QrCodeViewModel(qrCode)
    }
    
    var body: some View {
        
        VStack {
            switch qrCodeViewModel.viewState {
            case .scanning:
               Text("Todo: Scanning for QR Code")
            case .displaying:
                QrCodeDisplayView(qrCode: qrCodeViewModel.qrCode!)
            }
        }
            .padding()
            .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QrCodeView()
    }
}
