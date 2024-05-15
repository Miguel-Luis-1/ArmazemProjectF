import 'package:armazemf/app/models/sample_viwer.dart';
import 'package:armazemf/app/stores/graficos_page_store.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class GraficosPage extends StatefulWidget {
  const GraficosPage({super.key});

  @override
  State<GraficosPage> createState() => _GraficosPageState();
}

class _GraficosPageState extends State<GraficosPage> {
  GraficosPageStore store = Modular.get<GraficosPageStore>();

  @override
  void initState() {
    store.dispose();
    store.getItens(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BasePage(
        title: 'Gráficos',
        body: store.isLoading
            ? const Center(child: Text('Carregando...'))
            : Column(
                children: [
                  buildDefaultPieChart(),
                ],
              ),
      );
    });
  }

  SfCircularChart buildDefaultPieChart() {
    return SfCircularChart(
      title: ChartTitle(text: 'Gráfico de itens'),
      legend: Legend(),
      series: _getDefaultPieSeries(),
    );
  }

  List<PieSeries> _getDefaultPieSeries() {
    return [
      PieSeries(
          explode: true,
          explodeIndex: 0,
          dataSource: store.itens
              .map((element) => {
                    'x': element['nome'].toString(),
                    'y': int.parse(element['qtdunitaria'].toString()),
                    'text':
                        '${element['nome'].toString()}\n${element['qtdunitaria']}',
                  })
              .toList(),
          xValueMapper: (dynamic data, _) => data['x'] as String,
          yValueMapper: (dynamic data, _) => data['y'],
          dataLabelMapper: (dynamic data, _) => data['text'],
          startAngle: 80,
          endAngle: 80,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }
}
