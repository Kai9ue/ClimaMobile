import 'package:flutter/material.dart';
import 'package:clima/model/clima_model.dart';

class ClimaWidget extends StatelessWidget {
  const ClimaWidget({ Key? key, required this.climaData }) : super(key: key);

  final ClimaModel climaData;

  String primeiraMaiuscula(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "http://openweathermap.org/img/wn/${climaData.icone}@2x.png",
        fit: BoxFit.fill,
        width: 120,
        ),
        Text(
          "${climaData.temperatura.toStringAsFixed(0)} ºC",
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          primeiraMaiuscula(climaData.descricao),
          style: const TextStyle(fontSize: 50),
        ),
        const SizedBox(height: 20),
        Text(
          "Mínima do momento: ${climaData.tempMin} ºC",
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          "Máxima do momento: ${climaData.tempMax} ºC",
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          "Sensação térmica: ${climaData.sensacaoTermica} ºC",
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          "Pressão: ${climaData.pressao}hPa",
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          "Umidade: ${climaData.umidade}%",
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          "Visibilidade: ${climaData.visibilidade}m",
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          "Velocidade do vento: ${climaData.velocidadeVento}m/s",
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          "Direção do vento: ${climaData.direcaoVento}º",
          style: const TextStyle(fontSize: 50),
        ),
      ],
    );
  }
}