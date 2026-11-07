//
//  CardsComponent.swift
//  MovilesCaritas
//
//  Created by Alumno on 05/11/26.
//

import SwiftUI

struct CardsComponent: View {
    
    let colorTarjeta = Color(red:229/255, green:246/255, blue: 249/255)
    let colorTextoTarjeta = Color(red:0/255, green:120/255, blue: 137/255)
    
    var body: some View {
        VStack (alignment: .leading){
            HStack(spacing: 16) {
                ZStack {
                    Rectangle()
                        .fill(colorTarjeta)
                        .frame(width: 176, height: 136)
                        .cornerRadius(10)
                    
                    VStack {
                        Text("100")
                            .font(.system(size: 64))
                            .foregroundStyle(colorTextoTarjeta)
                            .bold()
                        Text("Total encuestas")
                            .font(.system(size: 16))
                            .foregroundStyle(colorTextoTarjeta)
                            .bold()
                    }
                    
                }
                    
                ZStack {
                    Rectangle()
                        .fill(colorTarjeta)
                        .frame(width: 176, height: 136)
                        .cornerRadius(10)
                    
                    VStack {
                        Text("100")
                            .font(.system(size: 64))
                            .foregroundStyle(colorTextoTarjeta)
                            .bold()
                        Text("Pendientes")
                            .font(.system(size: 16))
                            .foregroundStyle(colorTextoTarjeta)
                            .bold()
                        
                    }
                }
            }
        }
    }
}

#Preview {
    CardsComponent()
}
