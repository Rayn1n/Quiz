class Carro {
  String marca;
  String modelo;
  int ano;
  int velocidadeAtual;


  Carro(this.marca, this.modelo, this.ano, [this.velocidadeAtual = 0]);

  void acelerar() {
    velocidadeAtual += 10;
    print('O $marca $modelo está acelerando, Velocidade atual: $velocidadeAtual km/h.');
  }


  void frear() {
    velocidadeAtual -= 10;
    print('O $marca $modelo está freando, Velocidade atual: $velocidadeAtual km/h.');
  }


  void info() {
    print('Informações do carro: Marca: $marca, Modelo: $modelo, Ano: $ano, Velocidade Atual: $velocidadeAtual km/h.');
  }
}

void main() {

  Carro carro1 = Carro('Toyota', 'Corolla', 2022);
  carro1.acelerar();
  carro1.frear();
  carro1.info();

  
  Carro carro2 = Carro('Honda', 'Civic', 2021);
  carro2.acelerar();
  carro2.acelerar();
  carro2.frear();
  carro2.info();
}
