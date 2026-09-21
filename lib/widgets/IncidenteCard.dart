import 'package:flutter/material.dart';

import '../models/Incidente.dart';

IconData iconeDaSeveridade(Severidade severidade) {
  switch (severidade) {
    case Severidade.critico:
      return Icons.report;
    case Severidade.alto:
      return Icons.warning;
    case Severidade.medio:
      return Icons.info;
    case Severidade.baixo:
      return Icons.low_priority;
  }
}

Color corDaSeveridade(Severidade severidade) {
  switch (severidade) {
    case Severidade.critico:
      return Colors.red;
    case Severidade.alto:
      return Colors.orange;
    case Severidade.medio:
      return Colors.amber;
    case Severidade.baixo:
      return Colors.blue;
  }
}

String textoDaSeveridade(Severidade severidade) {
  switch (severidade) {
    case Severidade.critico:
      return 'Crítico';
    case Severidade.alto:
      return 'Alto';
    case Severidade.medio:
      return 'Médio';
    case Severidade.baixo:
      return 'Baixo';
  }
}

String textoDoStatus(Status status) {
  switch (status) {
    case Status.aberto:
      return 'Aberto';
    case Status.emAndamento:
      return 'Em andamento';
    case Status.resolvido:
      return 'Resolvido';
  }
}

Color corDoStatus(Status status) {
  switch (status) {
    case Status.aberto:
      return Colors.red;
    case Status.emAndamento:
      return Colors.amber;
    case Status.resolvido:
      return Colors.green;
  }
}

class IncidenteCard extends StatelessWidget {
  final Incidente incidente;

  const IncidenteCard({super.key, required this.incidente});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(iconeDaSeveridade(incidente.severidade)),
                const SizedBox(width: 8),
                Text(incidente.titulo),
              ],
            ),
            const SizedBox(height: 4),
            Text('#${incidente.id} · ${incidente.tipo}'),
            const SizedBox(height: 4),
            Text('Severidade: ${incidente.severidade}'),
            Text('Status: ${incidente.status}'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(incidente.responsavel ?? 'Sem responsável'),
                Text(incidente.abertoHa),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
