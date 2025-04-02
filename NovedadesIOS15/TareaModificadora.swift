//
//  TareaModificadora.swift
//  NovedadesIOS15
//
//  Created by Paul Jaime Felix Flores on 13/06/23.
//

import SwiftUI
//Vid 227
struct TareaModificadora: View {
    @State private var num = 0
    var body: some View {
        Text("Hello, World!")
        //Vid 227 , se deja de ejecutar cuando la vista desaparece en el on appear no
        //se usara llamar apis 
            .task(id: num) {
                print("ejecuta la acción")
            }
        Button(action:{
            num += 1
        }){
            Text("incrementar")
        }
    }
}
