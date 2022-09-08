import 'package:flutter/material.dart';

enum QualityOfService { amazing, good, okay }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _costOfService = TextEditingController();
  QualityOfService? _quality = QualityOfService.amazing;
  double _tip = 0.0;
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tip Time'),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 14,
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: TextField(
                  controller: _costOfService,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cost of Service',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.room_service),
              title: Text("How was the service?"),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child:
                      qualityRadioBtn('Amazing(20%)', QualityOfService.amazing),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: qualityRadioBtn('Good(18%)', QualityOfService.good),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: qualityRadioBtn('Okay(15%)', QualityOfService.okay),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 28),
                  child: Icon(
                    Icons.call_made,
                    color: Colors.green[900],
                  ),
                ),
                const Text("Round up tip?"),
                Expanded(
                  child: Container(),
                ),
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: _getTipQtty,
                color: Colors.green[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // <-- Radius
                ),
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tip Amount is: \$$_tip",
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ));
  }

  void _getTipQtty() {
    double cost = double.parse(_costOfService.text);
    double tipPercent = _quality == QualityOfService.amazing
        ? 20
        : _quality == QualityOfService.good
            ? 18
            : 15;
    tipPercent = tipPercent / 100.0;
    _tip = _isSwitched ? (cost * tipPercent).ceilToDouble() : cost * tipPercent;
    setState(() {});
  }

  RadioListTile<QualityOfService> qualityRadioBtn(
      String title, QualityOfService qosvalue) {
    return RadioListTile<QualityOfService>(
      title: Text(title),
      value: qosvalue,
      groupValue: _quality,
      onChanged: (QualityOfService? value) {
        setState(() {
          _quality = value;
        });
      },
    );
  }
}
