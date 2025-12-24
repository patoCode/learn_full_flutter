import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_full_flutter/infraestructure/database/app_models/app_model_paid_historic.dart';
import 'package:learn_full_flutter/infraestructure/database/repositories/paid_repository.dart';
import 'package:learn_full_flutter/screens/calculator/widgets/drawer_widget.dart';
import 'package:numeric_selector/numeric_selector.dart';
import 'package:uuid/uuid.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  bool _showErrors = false;
  bool _readyToSave = false;
  int _valorActual = 0;
  double _totalIndividual = 0.0;
  final _ammount = TextEditingController();
  final _qtyPeoples = TextEditingController();
  final _paidRepository = PaidRepository();

  double _calculate(String ammount, String people, String valueTip) {
    final doubleAmmount = double.parse(ammount);
    final doublePeoples = double.parse(people);
    final doubleTip = double.parse(valueTip);

    final total =
        (doubleAmmount + (doubleAmmount * (doubleTip / 100))) / doublePeoples;

    return total;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _ammount.dispose();
    _qtyPeoples.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = GoogleFonts.rubik(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      endDrawer: DrawerWidget(),
      drawer: Drawer(
        width: 380,
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                onTap: () => context.go('/calculator'),
                title: Text("Calculator"),
                leading: Icon(Icons.calculate),
              ),
              ListTile(
                onTap: () => context.go('/weather'),
                title: Text("Clima"),
                leading: Icon(Icons.dew_point),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Calculator", style: textStyle),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _FieldInputText(
                            controller: _ammount,
                            hint: "120.6",
                            label: 'Monto a pagar',
                            decimal: true,
                            showError: _showErrors,
                            icon: Icons.paid,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _FieldInputText(
                            controller: _qtyPeoples,
                            label: 'Nro. de Personas',
                            hint: '10',
                            icon: Icons.account_box,
                            showError: _showErrors,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Porcentaje de Propina: ${_valorActual.toStringAsFixed(2)} (%)",
                      textAlign: TextAlign.start,
                      style: textStyle.copyWith(
                        color: Colors.indigo,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    HorizontalNumericSelector(
                      minValue: 0,
                      maxValue: 100,
                      step: 1,
                      initialValue: _valorActual.toInt(),
                      onValueChanged: (value) {
                        setState(() {
                          _valorActual = value;
                        });
                      },
                      viewPort: 0.3,
                      selectedTextStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedTextStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                      backgroundColor: Colors.white,
                      showLabel: true,
                      label: "Quantity",
                      showArrows: true,
                      enableVibration: true,
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(2),
                    color: Colors.indigo.shade50,
                    onPressed: () {
                      if (_ammount.text.isEmpty || _qtyPeoples.text.isEmpty) {
                        setState(() => _showErrors = true);
                        return;
                      }
                      final data = _calculate(
                        _ammount.text,
                        _qtyPeoples.text,
                        _valorActual.toStringAsFixed(2),
                      );
                      setState(() {
                        _totalIndividual = data;
                        _showErrors = false;
                        _readyToSave = true;
                      });
                    },
                    iconSize: 40,
                    icon: Icon(FontAwesomeIcons.calculator),
                  ),
                ),

                SizedBox(height: 20),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "A pagar por persona: ",
                            style: textStyle.copyWith(
                              fontSize: 18,
                              color: Colors.indigo,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Text(
                            _totalIndividual.toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            style: textStyle.copyWith(
                              fontSize: 70,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    FilledButton.tonalIcon(
                      label: Text("Reset"),
                      onPressed: () {
                        setState(() {
                          _ammount.text = "";
                          _qtyPeoples.text = "";
                          _valorActual = 0;
                          _totalIndividual = 0;
                          _showErrors = false;
                          _readyToSave = false;
                        });
                      },
                      icon: Icon(Icons.refresh),
                    ),
                    SizedBox(height: 10),
                    FilledButton.tonalIcon(
                      label: Text("Save"),
                      onPressed: () {
                        if (!_readyToSave) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.orange.shade500,
                              content: Text(
                                "No se puede guardar este registro, verifique he intente nuevamente",
                              ),
                            ),
                          );
                          return;
                        }

                        final tagId = Uuid().v4();
                        final toSave = AppModelPaidHistoric(
                          id: tagId,
                          ammount: double.parse(_ammount.text),
                          qtyPeoples: double.parse(_qtyPeoples.text),
                          tip: _valorActual.toDouble(),
                          totalIndividual: _totalIndividual,
                          createAt: DateTime.now(),
                        );
                        try {
                          _paidRepository.save(toSave.toTableEntity(tagId));

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Guardado en Hive correctamente"),
                            ),
                          );
                        } catch (e) {
                          print("Error: $e");
                        }

                        setState(() {
                          _ammount.text = "";
                          _qtyPeoples.text = "";
                          _valorActual = 0;
                          _totalIndividual = 0;
                          _showErrors = false;
                          _readyToSave = false;
                        });
                      },
                      icon: Icon(Icons.save_sharp, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldInputText extends StatelessWidget {
  const _FieldInputText({
    required this.controller,
    required this.label,
    required this.hint,
    this.decimal = false,
    this.icon = Icons.input,
    this.showError = false,
  });

  final TextEditingController controller;
  final bool decimal;
  final String label;
  final String hint;
  final IconData icon;
  final bool showError;

  @override
  Widget build(BuildContext context) {
    final isInvalid = showError && controller.text.isEmpty;

    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: decimal),

      decoration: InputDecoration(
        errorText: isInvalid ? 'Campo requerido' : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: isInvalid ? Colors.red : Colors.indigo,
            width: 2,
          ),
        ),
        labelText: label.trim(),
        hintText: hint.trim(),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
