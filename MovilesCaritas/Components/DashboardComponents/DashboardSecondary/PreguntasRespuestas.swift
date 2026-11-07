//
//  PreguntasRespuestas.swift
//  MovilesCaritas
//
//  Created by Alumno on 06/11/26.
//

import SwiftUI

struct PreguntasRespuestas: View {
    
    let colorFondo = Color(red: 0/255, green: 152/255, blue: 174/255)
    let colorTarjeta = Color(red:229/255, green:246/255, blue: 249/255)
    let colorTextoTarjeta = Color(red:0/255, green:120/255, blue: 137/255)
    
    var body: some View {
        VStack (spacing: 20) {
            VStack (alignment: .leading) {
                Text("Pregunta 1")
                    .font(.system(size: 18))
                    .foregroundStyle(.white)
                    .bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
            .background(colorFondo)
            .cornerRadius(10)
            
            Text("¿Cuantos miembros del hogar tienen 17 años o menos?")
                .font(.system(size: 18))
                .bold()
                .foregroundStyle(.black)
        }
        .padding(.bottom, 20)
        .background(colorTarjeta)
        .cornerRadius(10)
    }
}

#Preview {
    PreguntasRespuestas()
}
