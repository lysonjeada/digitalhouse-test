import UIKit

class Competidor {
    let velocidade: Int
    let aceleracao: Int
    let giro: Int
    let placa: Character
    
    init(velocidade: Int, aceleracao: Int, giro: Int, placa: Character) {
        self.velocidade = velocidade
        self.aceleracao = aceleracao
        self.giro = giro
        self.placa = placa
    }
}

class Carro: Competidor {
    let peso: Int
    let qtdDeRodas: Int
    
    init(peso: Int, qtdDeRodas: Int, velocidade: Int, aceleracao: Int, giro: Int, placa: Character) {
        self.peso = 1000
        self.qtdDeRodas = 4
        super.init(velocidade: velocidade, aceleracao: aceleracao, giro: giro, placa: placa)
    }
}

class Moto: Competidor {
    let peso: Int
    let qtdDeRodas: Int
    
    init(peso: Int, qtdDeRodas: Int, velocidade: Int, aceleracao: Int, giro: Int, placa: Character) {
        self.peso = 300
        self.qtdDeRodas = 2
        super.init(velocidade: velocidade, aceleracao: aceleracao, giro: giro, placa: placa)
    }
}

class Corrida: CorridaProtocol {
    let distancia: Int
    let premioEmDolares: Int
    let nome: Character
    let quantidadeDeCompetidoresPermitidos: Int
    var listaDeCompetidores: Array<Competidor>
    
    init(distancia: Int, premioEmDolares: Int, nome: Character, quantidadeDeCompetidoresPermitidos: Int, listaDeCompetidores: Array<Competidor>) {
        self.distancia = distancia
        self.premioEmDolares = premioEmDolares
        self.nome = nome
        self.quantidadeDeCompetidoresPermitidos = quantidadeDeCompetidoresPermitidos
        self.listaDeCompetidores = listaDeCompetidores
    }
    
    func adicionarCarro(velocidade: Int, aceleracao: Int, giro: Int, placa: Character) {
        let carro = Carro(peso: 1000, qtdDeRodas: 4, velocidade: 80, aceleracao: 100, giro: 40, placa: "5")
        listaDeCompetidores.append(carro)
    }
    
    func adicionarMoto(velocidade: Int, aceleracao: Int, giro: Int, placa: Character) {
        let moto = Moto(peso: 1000, qtdDeRodas: 4, velocidade: 80, aceleracao: 100, giro: 40, placa: "5")
        listaDeCompetidores.append(moto)
    }
    
    func eliminarCompetidor(competidor: Competidor) {
        listaDeCompetidores.remove(at: competidor.aceleracao)
    }
    
    func eliminarCompetidorComPlaca(umaPlaca: String) {
        listaDeCompetidores.remove(at: Int(umaPlaca) ?? 0)
    }
    
    func oGanhador() -> Competidor? {
        let carro = Carro(peso: 1000, qtdDeRodas: 4, velocidade: 80, aceleracao: 100, giro: 40, placa: "5")
        let moto = Moto(peso: 1000, qtdDeRodas: 4, velocidade: 80, aceleracao: 100, giro: 40, placa: "5")
        listaDeCompetidores.append(carro)
        listaDeCompetidores.append(moto)
        return listaDeCompetidores.randomElement()
    }
    
}

protocol CorridaProtocol {
    func adicionarCarro(velocidade: Int, aceleracao: Int, giro: Int, placa: Character)
    func adicionarMoto(velocidade: Int, aceleracao: Int, giro: Int, placa: Character)
    func eliminarCompetidor(competidor: Competidor)
    func eliminarCompetidorComPlaca(umaPlaca: String)
    func oGanhador() -> Competidor?
}

protocol SocorristaProtocol {
    func socorrer(umCompetidor: Competidor)
}

class SocorristaCarro: SocorristaProtocol {
    func socorrer(umCompetidor: Competidor) {
        let carro = Carro(peso: 1000, qtdDeRodas: 4, velocidade: 80, aceleracao: 100, giro: 40, placa: "5")
        print("Socorrendo carro \(carro.placa)")
    }
}

class SocorristaMoto: SocorristaProtocol {
    func socorrer(umCompetidor: Competidor) {
        let moto = Moto.init(peso: 300, qtdDeRodas: 2, velocidade: 100, aceleracao: 80, giro: 50, placa: "7")
        print("Socorrendo moto \(moto.placa)")
    }
}
