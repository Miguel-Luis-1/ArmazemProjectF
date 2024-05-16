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
                  store.itens.isEmpty
                      ? const Center(
                          child: Text('Não há itens para carregar o grafico'))
                      : _buildDefaultColumnChart(),
                ],
              ),
      );
    });
  }

  SfCartesianChart _buildDefaultColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Itens cadastrados'),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value} Unidades',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultColumnSeries(),
    );
  }

  List<ColumnSeries> _getDefaultColumnSeries() {
    return [
      ColumnSeries(
        dataSource: store.itens
            .map((element) => {
                  'x': element['nome'],
                  'y': element['qtdunitaria'],
                })
            .toList(),
        xValueMapper: (dynamic data, _) => data['x'] as String,
        yValueMapper: (dynamic data, _) => data['y'],
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }
}
