//
//  Refresh.swift
//  NovedadesIOS15
//
//  Created by Paul Jaime Felix Flores on 13/06/23.
//

//Vid 228
import SwiftUI

struct Refresh: View {
    
    @State private var ite = "Item"
    
    var body: some View {
        NavigationView{
            List(1..<10){ item in
                Text("\(ite) \(item)")
            }
            .navigationTitle("Lista")
            //Vid 228, todo lo va a estar refrescando s
            .refreshable {
                ite = "Ejecutar el refresh"
            }
        }
    }
}
