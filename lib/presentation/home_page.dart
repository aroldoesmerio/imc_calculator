import 'package:calculo_imc/controller/calculate_imc_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalculateImcController controller = CalculateImcController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                  decoration: const InputDecoration(
                    labelText: 'Peso (Kg)',
                    labelStyle: TextStyle(color: Colors.cyan, fontSize: 16),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: controller.setWeight,
                  controller: controller.heightController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Altura (Cm)',
                  labelStyle: TextStyle(color: Colors.cyan, fontSize: 16),
                ),
                keyboardType: TextInputType.number,
                onChanged: controller.setHeight,
                controller: controller.weightController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    child: ValueListenableBuilder(
                      valueListenable: controller.enableButtom,
                      builder: (BuildContext context, enableButton, _) =>
                          ElevatedButton(
                        onPressed:
                            enableButton ? controller.calculateImc : null,
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        child: const Text('Calculate'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          controller.clearButton();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 15,
                          ),
                          backgroundColor: Colors.deepOrangeAccent),
                      child: const Text('Clear'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ValueListenableBuilder(
                valueListenable: controller.resultImc,
                builder: (BuildContext context, resultImc, _) => Text(
                  resultImc,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
