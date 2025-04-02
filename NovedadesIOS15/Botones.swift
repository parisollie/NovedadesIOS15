//
//  Botones.swift
//  NovedadesIOS15
//
//  Created by Paul Jaime Felix Flores on 12/06/23.
//

//vid 226
import SwiftUI

struct Botones: View {
    //Nuestra variable
    @State private var on = false
    
    var body: some View {
        VStack{
            
            Toggle("Activar", isOn: $on)
                .toggleStyle(.button)
                .tint(.yellow)
            //Boton redondeado
            Button("Guardar"){
                
            }
            .buttonStyle(.bordered)
            //Vid 226, dejo de existir
            //.controlProminence(.increased)
            .tint(.red)
            
            Button(action:{
                //
            }){
                Text("Guardar").frame(maxWidth: 300)
            }
            .buttonStyle(.bordered)
            .tint(.blue)
            
            Button(role: .destructive){
                
            } label:{
                Label("Eliminar", systemImage: "trash")
            }
            
            ControlGroup{
                Button{
                    
                } label:{
                    Label("Aceptar", systemImage: "pencil")
                }
                Button{
                    
                } label:{
                    Label("Eliminar", systemImage: "trash")
                }
            }
            
        }
    }
}
