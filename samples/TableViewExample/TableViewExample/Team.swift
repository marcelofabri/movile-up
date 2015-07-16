//
//  Team.swift
//  TableViewExample
//
//  Created by CursoIOS on 7/8/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation


struct Team {
    let name: String
    let imageName: String
    
    static func allTeams() -> [Team] {
        let teams = [("Barcelona", "barcelona"),
        ("Inter de Milão", "interdemilao"),
        ("Santos", "santos"),
        ("Cruzeiro", "cruzeiro"),
        ("Atlético Mineiro", "atletico-mg"),
        ("Vasco", "vasco")]
        
        return teams.map { Team(name: $0.0, imageName: $0.1) }
    }
}