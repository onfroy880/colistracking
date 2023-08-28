import 'package:colistracking/mics/app_button.dart';
import 'package:colistracking/mics/app_text.dart';
import 'package:colistracking/mics/app_title.dart';
import 'package:colistracking/mics/custome_drawer.dart';
import 'package:colistracking/screens/add/bloc/add_bloc.dart';
import 'package:colistracking/screens/add/bloc/add_event.dart';
import 'package:colistracking/screens/add/bloc/add_state.dart';
import 'package:colistracking/screens/resum/resum_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  //controller du formulaire
  final _formKey = GlobalKey<FormState>();
  TextEditingController adresseColecte = TextEditingController();
  TextEditingController contactTelephonique = TextEditingController();
  TextEditingController detailColis = TextEditingController();
  TextEditingController instructionParticuliere = TextEditingController();
  //regexp de validite de numero de telephone
  bool isValidPhone(String phone) {
    return RegExp(r'(?:[0-9]$)').hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(
      builder: ((context, state) {
        BlocProvider.of<AddBloc>(context).add(AddEvent());
        return Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.sort_rounded),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: AppTitle(
              text: 'Colis Tracker',
              color: Colors.purple,
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.purple,
          ),
          drawer: CustomDrawer(),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(18.w),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle(
                    text: 'Demande de collecte',
                  ),
                  SizedBox(height: 18.h),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: TextFormField(
                      controller: adresseColecte,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Address is not empty*';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Adresse de collecte',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: TextFormField(
                      controller: contactTelephonique,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Contact is not empty*';
                        } else if (isValidPhone(value) == false) {
                          return 'Contact is invalid';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Contact Telephonique',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: TextFormField(
                      controller: detailColis,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Detail is not empty*';
                        }
                        return null;
                      },
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Detail du Colis',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: TextFormField(
                      controller: instructionParticuliere,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'Instruction Particuliere',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  AppText(
                    text:
                        'En cliquant sur ce button vous attestez la validiter des informations sousmises.',
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResumScreen(information: [
                              adresseColecte.text,
                              contactTelephonique.text,
                              detailColis.text,
                              instructionParticuliere.text
                            ]),
                          ),
                        );
                      }
                    },
                    child: AppButton(
                        backgroundColor: Colors.purple,
                        color: Colors.white,
                        text: 'Envoyer la demande',
                        isIcon: true,
                        icon: Icons.double_arrow_rounded),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
