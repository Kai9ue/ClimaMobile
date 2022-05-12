import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:clima/model/clima_model.dart';
import 'package:clima/widgets/clima_widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ClimaModel climaModel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    carregaClima();
  }

  final List<String> _cidades = [
    "Aracaju",
    "Belém",
    "Belo Horizonte",
    "Boa Vista",
    "Brasilia",
    "Campo Grande",
    "Cuiaba",
    "Curitiba",
    "Florianópolis",
    "Fortaleza",
    "Goiânia",
    "João Pessoa",
    "Macapá",
    "Maceio",
    "Manaus",
    "Natal",
    "Palmas",
    "Porto Alegre",
    "Porto Velho",
    "Recife",
    "Rio Branco",
    "Rio de Janeiro",
    "Salvador",
    "São Luis",
    "São Paulo",
    "Teresina",
    "Vitória"
  ];

  String _cidadeSelecionada = "São Paulo";

  carregaClima() async {
    setState(() {
      _isLoading = true;
    });

    //var aux montagem da url de requisicao
    const String _apiURL = "api.openweathermap.org";
    const String _path = "/data/2.5/weather";
    const String _appid = "a45fc510f494dc131a3f086d9d6f60a1";
    const String _units = "metric";
    const String _lang = "pt-br";

    final _parms = {
      "q": _cidadeSelecionada,
      "appid": _appid,
      "units": _units,
      "lang": _lang
    };

    // req a api
    final climaResponse = await http.get(Uri.https(_apiURL, _path, _parms));

    print("URL Montada: " + climaResponse.request!.url.toString());

    if (climaResponse.statusCode == 200) {
      setState(() {
        climaModel = ClimaModel.fromJson(jsonDecode(climaResponse.body));
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(_cidadeSelecionada),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              items: _cidades,
              showSelectedItems: true,
              showSearchBox: true,
              maxHeight: height - 50,
              onChanged: (value) {
                setState(() {
                  _cidadeSelecionada = value!;
                  carregaClima();
                });
              },
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          strokeWidth: 4,
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                        )
                      : climaModel != null
                          ? ClimaWidget(climaData: climaModel)
                          : Text(
                              "Sem dados para exibir!",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: _isLoading
                        ? Text(
                            "Carregando...",
                            style: Theme.of(context).textTheme.headline4,
                          )
                        : IconButton(
                            onPressed: carregaClima,
                            icon: const Icon(Icons.refresh),
                            iconSize: 50,
                            color: Colors.blue,
                            tooltip: "Recarregar clima",
                          ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
