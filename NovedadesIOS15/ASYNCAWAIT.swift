//
//  ASYNCAWAIT.swift
//  NovedadesIOS15
//
//  Created by Paul Jaime Felix Flores on 13/06/23.
//

import SwiftUI
//vid 229,ponemos nuestra estructura
struct Datos: Decodable, Identifiable{
    var id : Int
    var name : String
    var username : String
}

struct ASYNCAWAIT: View {
    
    @State private var datos = [
       Datos(id: 0, name: "Juan", username: "Juanito")
    ]
    //vid 230
   @StateObject private var datosModelo = RecargarModelView()
    //Vid 231
    @State private var buscador = ""
    
    
     //Vid 229
     //Nueva forma de mandar datos de internet
    func recargar() async {
        do{
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
     //Espero a la llamada y no afecte al hilo principal 
            let (data,_) = try await URLSession.shared.data(from: url)
            datos = try JSONDecoder().decode([Datos].self, from: data)
        }catch let error as NSError{
            print("error", error.localizedDescription)
        }
    }
    
    
    var body: some View{
        NavigationView{
            //Vid 230,231, si el buscador esta vacio muestrame toda la lista y filtramos lo que contenta buscador
            List{
                //Vid 232 agregamos el Foreach y lo ponemos andreo del List
                ForEach(datosModelo.datosModelo.filter {buscador.isEmpty ? true : $0.name.contains(buscador)  }){ item in
                    VStack(alignment: .leading){
                        Text(item.name).font(.headline)
                        Text(item.username).font(.subheadline)
                      //Vid 232,ponemos el swipe action en el nombre 
                    }.swipeActions{
                        Button("Aceptar"){
                            print("aceptar")
                        }.tint(.blue)
                        
                        Button{
                            print("eliminar")
                        } label:{
                            Label("eliminar", systemImage: "trash.fill")
                        }.tint(.red)
                        
                    }
                }
            }.navigationTitle("Lista")
            //Vid 231 , le ponemos el binding de nuestro buscador
                .searchable(text: $buscador)
                .refreshable{
                    await datosModelo.fetch()
                }
        }
    }
    //Vid 229
    /*var body : some View {
        NavigationView{
            List(datos) { item in
                VStack(alignment: .leading){
                    Text(item.name).font(.headline)
                    Text(item.username).font(.subheadline)
                }
            }.navigationTitle("Lista")
                .refreshable{
                    await recargar()
                }
        }
    }*/
    
    
    
}
    

