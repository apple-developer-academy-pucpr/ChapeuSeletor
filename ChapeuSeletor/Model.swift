//
//  Model.swift
//  ChapéuSeletor
//
//  Created by Rafael Forbeck on 29/07/19.
//  Copyright © 2019 Rafael Forbeck. All rights reserved.
//

import Foundation

class Model {
    
    static var shared = Model()
    
    var morning = [Student]()
    var afternoon = [Student]()
    
    var selectedPeriod: Period = .morning
    
    func getStudents() -> [Student] {
        if selectedPeriod == .morning {
            return morning
        } else {
            return afternoon
        }
    }
    
    private init() {
        
        // MANHÃ
        morning.append(Student(name: "Ana Paula Aguiar Clemente", period: .morning))
        morning.append(Student(name: "Andressa Eloisa Valengo", period: .morning))
        morning.append(Student(name: "Carlos Roberto Modinez Junior", period: .morning))
        morning.append(Student(name: "Caroline Tokarski", period: .morning))
        morning.append(Student(name: "Cristiano Correia Rebouças", period: .morning))
        morning.append(Student(name: "Eduarda Linhares Mello", period: .morning))
        morning.append(Student(name: "Enzo Maruffa Moreira", period: .morning))
        morning.append(Student(name: "Felipe de Lima Mesquita", period: .morning))
        morning.append(Student(name: "Flavio Akira Tsukamoto", period: .morning))
        morning.append(Student(name: "Isabela Castro Nascimento", period: .morning))
        morning.append(Student(name: "João Conrado Santana de Lima Dembiski", period: .morning))
        morning.append(Student(name: "José Guilherme Bestel", period: .morning))
        morning.append(Student(name: "Kevin Katzer", period: .morning))
        morning.append(Student(name: "Leonardo Giovannetti Palinkas", period: .morning))
        morning.append(Student(name: "Letícia Linhares Camargo Pulner", period: .morning))
        morning.append(Student(name: "Lucas Brehm Ronnau", period: .morning))
        morning.append(Student(name: "Maria Fernanda Azolin", period: .morning))
        morning.append(Student(name: "Mariana Beilune Abad", period: .morning))
        morning.append(Student(name: "Mateus Nunes da Silva", period: .morning))
        morning.append(Student(name: "Matheus da Silva Cavasin", period: .morning))
        morning.append(Student(name: "Pedro Silva de Vargas", period: .morning))
        morning.append(Student(name: "Pyettra Ferreira", period: .morning))
        morning.append(Student(name: "Saulo de Freitas Martins da Silva", period: .morning))
        morning.append(Student(name: "Vinicius Augusto Dilay de Paula", period: .morning))
        morning.append(Student(name: "Vinícius Isoo Binder", period: .morning))
        
        // TARDE
        afternoon.append(Student(name: "Ailton Vieira Pinto Filho", period: .afternoon))
        afternoon.append(Student(name: "André Luiz Tosin", period: .afternoon))
        afternoon.append(Student(name: "Bruno Pastre", period: .afternoon))
        afternoon.append(Student(name: "Filipe de Oliveira Souza", period: .afternoon))
        afternoon.append(Student(name: "Gabriel Henrique Porto Caldeira Taques", period: .afternoon))
        afternoon.append(Student(name: "Gabriel Rodrigues Gazal Rocha", period: .afternoon))
        afternoon.append(Student(name: "Gabrielle Cristina Grein Nogueira", period: .afternoon))
        afternoon.append(Student(name: "Jéssica Lopes Matsuura", period: .afternoon))
        afternoon.append(Student(name: "Jéssica Yumi Tanimoto", period: .afternoon))
        afternoon.append(Student(name: "João Felipe Raffs", period: .afternoon))
        afternoon.append(Student(name: "João Guilherme Pinheiro Barion", period: .afternoon))
        afternoon.append(Student(name: "Kaz Born (Fernanda Rolim de Moura Born)", period: .afternoon))
        afternoon.append(Student(name: "Kelvin Javorski Soares", period: .afternoon))
        afternoon.append(Student(name: "Kevin Ribeiro", period: .afternoon))
        afternoon.append(Student(name: "Laryssa Tertuliano", period: .afternoon))
        afternoon.append(Student(name: "Lucas Giusti de Azevedo Souza", period: .afternoon))
        afternoon.append(Student(name: "Mariana Lech", period: .afternoon))
        afternoon.append(Student(name: "Mateus de Jesus João Paulo Filho", period: .afternoon))
        afternoon.append(Student(name: "Maykon Christian Meneghel", period: .afternoon))
        afternoon.append(Student(name: "Otávio Baziewicz Filho", period: .afternoon))
        afternoon.append(Student(name: "Rodolfo Diniz Biazi", period: .afternoon))
        afternoon.append(Student(name: "Rodrigo Forbeck Odppes", period: .afternoon))
        afternoon.append(Student(name: "Rubens Beraldo Paulico", period: .afternoon))
        afternoon.append(Student(name: "Walace Pereira de Paula e Silva", period: .afternoon))
    }
}
