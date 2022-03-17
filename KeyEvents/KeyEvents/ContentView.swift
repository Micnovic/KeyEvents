//
//  ContentView.swift
//  KeyEvents
//
//  Created by Глеб Михновец on 06.02.2022.
//

import SwiftUI
import AppKit

struct ContentView: View {
    @State var pressedKey: String = "_"
    
    var body: some View {
        ZStack {
            Color(.white)
            Text(pressedKey).font(.largeTitle)
        }
        .frame(width: 100, height: 100)
        .onAppear(
            perform: {
                NSEvent.addLocalMonitorForEvents(matching: [.keyDown]) {
                    event in
                    let pressedChar = event.charactersIgnoringModifiers!
                    print(pressedChar)
                    pressedKey = pressedChar
                    return nil
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
