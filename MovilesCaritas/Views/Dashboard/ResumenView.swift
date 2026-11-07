//
//  ResumenView.swift
//  MovilesCaritas
//
//  Created by Alumno on 06/11/26.
//

import SwiftUI

struct ResumenView: View {
    @State var candidatos:candidatos
    
    let colorFondo = Color(red: 0/255, green: 152/255, blue: 174/255)
    let colorTarjeta = Color(red:229/255, green:246/255, blue: 249/255)
    let colorTextoTarjeta = Color(red:0/255, green:120/255, blue: 137/255)
    
    
    var body: some View {
        VStack (alignment: .leading){
            Text("\(candidatos.nombre) \(candidatos.apellido)")
                .font(.system(size: 30))
                .bold()
                
            Text("\(candidatos.fecha)")
                .font(.system(size: 20))
                .bold()
                .foregroundStyle(colorFondo)
                .padding(.bottom, 25)
            
            PreguntasRespuestas()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    let candidatoEjemplo = candidatos(
        id: 1,
        nombre: "Sofía",
        apellido: "González",
        fecha: 1111111
    )
    
    ResumenView(candidatos: candidatoEjemplo)
}
