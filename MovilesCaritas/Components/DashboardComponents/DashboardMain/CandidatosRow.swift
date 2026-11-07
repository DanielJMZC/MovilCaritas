//
//  CandidatosRow.swift
//  MovilesCaritas
//
//  Created by Alumno on 06/11/26.
//

import SwiftUI

struct CandidatosRow: View {
    @State var candidatos: candidatos
    
    let colorFondo = Color(red: 0/255, green: 152/255, blue: 174/255)
    let colorTarjeta = Color(red:229/255, green:246/255, blue: 249/255)
    let colorTextoTarjeta = Color(red:0/255, green:120/255, blue: 137/255)
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("\(candidatos.nombre) \(candidatos.apellido)")
                .font(.system(size: 21))
                .bold()
                .foregroundStyle(colorFondo)
            Text("\(candidatos.fecha)")
                .font(.system(size: 18))
                .foregroundStyle(colorFondo)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(26)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(colorFondo, lineWidth: 3)
        )
    }
}

#Preview {
    
    let candidatoEjemplo = candidatos(
        id: 1,
        nombre: "Sofía",
        apellido: "González",
        fecha: 1111111
    )
    CandidatosRow(candidatos: candidatoEjemplo)
}
