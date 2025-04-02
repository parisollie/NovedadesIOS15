//
//  Alerta.swift
//  NovedadesIOS15
//
//  Created by Paul Jaime Felix Flores on 12/06/23.
//

import SwiftUI

struct Alerta: View {
    //Vid 223, creamos nuestras variables para alerta
    @State private var show1 = false
    @State private var show2 = false
    
    var body: some View {
        VStack{
            Button("Mostrar alerta"){
                show1.toggle()
            }
            .alert("Mensaje de la alerta", isPresented: $show1) {
                    Button("Aceptar", role: .none){}
                //vid 223, es para que salga en color rojo ,hay roles en los botones
                    Button("Eliminar", role: .destructive){}
            }
            //Vid 223 , es muy usada para abrir menus 
            Button("Abrir menu"){
                show2.toggle()
            }
            .confirmationDialog("Titulo", isPresented: $show2) {
                Button("Aceptar", role: .none){}
                Button("Eliminar", role: .destructive){}
            }
        }
    }
}

