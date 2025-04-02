//
//  RecargarModelView.swift
//  NovedadesIOS15
//
//  Created by Paul Jaime Felix Flores on 13/06/23.
//

//Vid 230
import Foundation
//Vid 230 ,quitamos el distpach ,para que se ejecute en el hilo principal 
@MainActor
class RecargarModelView: ObservableObject {
    
    @Published var datosModelo : [Datos] = []
    
    func fetch() async {
        do{
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
            let (data,_) = try await URLSession.shared.data(from: url)
            //Diferencias con el anterior ,quitamos el Distpach
            let datos = try JSONDecoder().decode([Datos].self, from: data)
            self.datosModelo = datos
        }catch let error as NSError{
            print("error", error.localizedDescription)
        }
    }
    
}
