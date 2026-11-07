//
//  Model.swift
//  MovilesCaritas
//
//  Created by Daniel Sebastian Jimenez Castillo on 03/11/26.
//

import Foundation

var listaCandidatos: Array<candidatos> = [
    candidatos(
            id: 1,
            nombre: "Sofía",
            apellido: "González",
            fecha: 1001101
        ),
        candidatos(
            id: 2,
            nombre: "Mateo",
            apellido: "Hernández",
            fecha: 6767676767
        ),
        candidatos(
            id: 3,
            nombre: "Valeria",
            apellido: "Morales",
            fecha: 111111111
        )
]

func obtenerCandidatos() -> [candidatos]
{
    return listaCandidatos
}
