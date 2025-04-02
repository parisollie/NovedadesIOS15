//
//  GroupBoxView.swift
//  NovedadesIOS15
//
//  Created by Paul Jaime Felix Flores on 12/06/23.
//

import SwiftUI
//Vid 224
struct GroupBoxView: View {
    var body: some View {
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            //Agrupamos Group Box uno dentro de uno 
            GroupBox("Titulo"){
                Text("Primer contenido")
                GroupBox{
                    Text("Segundo contenido")
                    GroupBox{
                        Text("Tercer contenido")
                    }
                }
            }.padding(.all)
            
        }
    }
}

