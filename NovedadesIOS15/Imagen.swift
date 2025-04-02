//
//  Imagen.swift
//  NovedadesIOS15
//
//  Created by Paul Jaime Felix Flores on 12/06/23.
//

import SwiftUI
//Vid 225
struct Imagen: View {
    var body: some View {
        ZStack{
            //Vid 225-Llamamos una imagen de internet ahora asi es mas facil 
            AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2015/12/19/20/31/table-1100248_960_720.jpg")){
                //Con esto cambiamos el tamaño de la imagen
                image in
                image.resizable()
                //El place holder sirve en lo que carga la imagen
            } placeholder: {
                Color.red
            }
            //Para que la imagen salga redonda
            //.clipShape(Circle())
            //Poner texto encima de la imagen 
            Text("Nombre de la imagen")
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
        }
    }
}

