//
//  DashboardView.swift
//  MovilesCaritas
//
//  Created by Daniel Sebastian Jimenez Castillo on 03/11/26.
//

import SwiftUI


let colorFondo = Color(red: 0/255, green: 152/255, blue: 174/255)
let colorTarjeta = Color(red:229/255, green:246/255, blue: 249/255)
let colorTextoTarjeta = Color(red:0/255, green:120/255, blue: 137/255)

let colorMoradoClaro = Color(red: 168/255,green: 134/255, blue: 184/255)
let colorMoradoOscuro = Color(red: 115/255,green: 87/255, blue: 128/255)

struct DashboardView: View {
    @State private var listCandidatosView: [candidatos] = obtenerCandidatos()
    
    @State private var textoBusqueda = ""
    let nombres = ["Ana", "Marcos", "Mario"] //BORRAR AL FINAL
    
    @State private var showSheet: Bool = false
    @State private var selectedFiltre: Int = 1
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    var body: some View {
        VStack (alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(colorFondo)
                    .ignoresSafeArea()
                    .frame(width: .infinity, height: 300)
                
                VStack (alignment: .leading, spacing: 40){
                    Text("Encuestas Contestadas")
                        .font(.system(size: 40))
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.horizontal)
                    
                    CardsComponent()
                }
                .padding(.top, 120)
            }
            Spacer()
            
            //Tendre que cambiar
            NavigationStack {
                
                HStack (spacing: 12){
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(colorMoradoClaro)
                            .bold()
                        TextField("Busca candidato...", text: self.$textoBusqueda)
                            .tint(colorMoradoClaro)
                            .foregroundStyle(colorMoradoClaro)
                            
                    }
                    .padding()
                    .background(colorMoradoClaro.opacity(0.25))
                    .cornerRadius(20)
                    
                    Button(action: {
                        showSheet.toggle()
                    }) {
                        Image(systemName: "line.3.horizontal.decrease")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(width: 50, height: 50)
                            .background(colorMoradoClaro)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
                .background(.white)
                .sheet(isPresented: $showSheet, onDismiss: didDismiss){
                    
                    VStack (alignment: .leading){
                        Text("Filtros")
                            .font(.system(size: 40))
                            .bold()
                            .foregroundStyle(colorMoradoOscuro)
                            .padding(.top, 36)
                            .padding(.bottom, 8)
                        
                        Text("Estado")
                            .font(.system(size: 25))
                            .bold()
                            .padding(.vertical)
                        
                        VStack(alignment: .leading, spacing: 14){
                            let optionsFiltre = [(1, "Todas"), (2, "Completadas"), (3, "Pendientes")]
                            
                            ForEach(optionsFiltre, id: \.0) { item in
                                Button(action: {
                                    selectedFiltre = item.0
                                }) {
                                    HStack(spacing: 12) {
                                        Image(systemName: selectedFiltre == item.0 ? "largecircle.fill.circle" : "circle")
                                            .foregroundStyle(selectedFiltre == item.0 ? colorMoradoOscuro : .gray)
                                            .font(.title3)
                                        
                                        
                                        Text(item.1)
                                            .foregroundStyle(.primary)
                                    }
                                    .padding(.leading, 20)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        
                        Text("Fecha")
                            .font(.system(size: 25))
                            .bold()
                            .padding(.vertical)
                        
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Desde")
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(colorMoradoOscuro)
                                
                                DatePicker("", selection: $startDate, displayedComponents: .date)
                                    .labelsHidden()
                                    .tint(colorMoradoOscuro)
                                    .padding(6)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                                .font(.footnote)
                                .foregroundStyle(colorMoradoOscuro.opacity(0.6))
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Hasta")
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(colorMoradoOscuro)
                                
                                DatePicker("", selection: $endDate, in: startDate..., displayedComponents: .date)
                                    .labelsHidden()
                                    .tint(colorMoradoOscuro)
                                    .padding(6)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(colorMoradoClaro.opacity(0.2))
                        .cornerRadius(12)
                        .padding(.horizontal, 20)
                        
                        Spacer()
                        
                        //Falta guardar los filtros
                        
                        Button(action: {
                            showSheet.toggle()
                        }) {
                            Text("Aplicar Filtro")
                                .bold()
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 44)
                                .background(colorMoradoOscuro)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            selectedFiltre = 1
                            startDate = Date()
                            endDate = Date()
                            
                        }) {
                            Text("Borrar Filtro")
                                .bold()
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity)
                                .frame(height: 44)
                                .background(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                    }
                    .padding(20)
                    //Final del vstack
                    
                }
                
                List(listCandidatosView){
                    item in
                    NavigationLink{
                        ResumenView(candidatos: item)
                    } label: {
                        CandidatosRow(candidatos: item)
                    }.listRowBackground(Color(.white))
                }
                .scrollContentBackground(.hidden)
                .background(Color.white)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
    
    func didDismiss(){

    }
}

#Preview {
    DashboardView()
}
