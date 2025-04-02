//
//  ContentView.swift
//  NovedadesIOS15
//
//  Created by Paul Jaime Felix Flores on 12/06/23.
//

import SwiftUI

struct ContentView: View {
    //Vid 221, para poder hacer un switch case para poder pasar el foco
    enum Campos{
        case nombre
        case apellido
        case email
    }
    //Vid 221
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var email = ""
    
    //Vid 220, el foco significa ,que nos concentraremos en el campo a llenar.
    //El foco será de tipo opcional porque ya tenemos nuestro switch
    @FocusState private var foco : Campos?
    var body: some View {
        VStack{
            TextField("Nombre", text: $nombre)
            //Vid 221, el equeal es para que tenga una opcion de los casos
                .focused($foco, equals: .nombre)
                .textFieldStyle(.roundedBorder)
                //Vid 220, el continue es el nombre que saldrá en el teclado.
                .submitLabel(.continue)
            TextField("Apellido", text: $apellido)
                .focused($foco, equals: .apellido)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.continue)
            TextField("Email", text: $email)
                .focused($foco, equals: .email)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.done)
                //Vid 221, ponemos el teclado para que nos salga luego luego el arroba
                .keyboardType(.emailAddress)
            
            //Vid 222 ,agregar botones en la parte inferior
            TextField("Name", text: $nombre)
                .textFieldStyle(.roundedBorder)
            //Vid 222 Agregamos el toolbar al textfield 
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Button("Aceptar"){
                            //
                        }
                        Button("Cancelar"){
                            //
                        }
                        Button("Registrar"){
                            //
                        }
                    }
                }
            
        }.padding(.all)
        //Vid 221 ,accionamos la funcion del teclado que seria la funcion next
        //se pasan de uno al siguiente
            .onSubmit {
                switch foco {
                case .nombre:
                    foco = .apellido
                case .apellido:
                    foco = .email
                default:
                    print("Guardar formulario")
                }
            }
    }
}




