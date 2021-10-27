//
//  ContentView.swift
//  QrCodeView
//
//  Created by Michael Lustig on 10/26/21.
//

import SwiftUI

class QrCodeViewModel: ObservableObject {
    @Published var count = 1
    
    func inc() {
        count += 1
    }
}

enum QrCodeViewState: String {
    case scanning = "Scanning";
    case displaying = "Displaying"
}


struct QrCodeView: View {
    @ObservedObject private var qrCodeViewModel = QrCodeViewModel()
    var qrCode: String?
    
    var viewState: QrCodeViewState {
        return qrCode == nil ? QrCodeViewState.scanning : QrCodeViewState.displaying
    }
    
    var body: some View {
        Text("\(qrCodeViewModel.count)")
            .padding()
        
        Text("\(viewState.rawValue)")
            .padding()
        
        Button("Inc") {
            qrCodeViewModel.inc()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QrCodeView()
    }
}