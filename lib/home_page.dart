import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum QualityOfService { amazing, good, okay }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QualityOfService? _character = QualityOfService.amazing;
  double tip = 10.5;
  bool isSwitched = false;
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
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cost of Service',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
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
                Text("Round up tip?"),
                Expanded(
                  child: Container(),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {},
                color: Colors.green[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // <-- Radius
                ),
                child: Text(
                  "CALCULATE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tip Amount is: \$${tip}",
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ));
  }

  RadioListTile<QualityOfService> qualityRadioBtn(
      String title, QualityOfService qosvalue) {
    return RadioListTile<QualityOfService>(
      title: Text(title),
      value: qosvalue,
      groupValue: _character,
      onChanged: (QualityOfService? value) {
        setState(() {
          _character = value;
        });
      },
    );
  }
}
