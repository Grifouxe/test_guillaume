import 'package:flutter/material.dart';
//import 'package:cloud_firebase/cloud_firebase.dart';



class Questionnaire extends StatefulWidget {
  const Questionnaire({super.key});

  @override
  createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  late String _selectedOption;

  /*void _saveResponseToFirebase(String response) {
    FirebaseFirestore.instance.collection('questionnaire_responses').add({
      'response': response,
      'timestamp': Timestamp.now(),
    }).then((value) {
      print("Réponse enregistrée avec succès!");
    }).catchError((error) {
      print("Erreur lors de l'enregistrement de la réponse: $error");
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Quel type de fonctionnalités recherchez-vous principalement dans cette application ?',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedOption =
                  'Je suis un sportif : Je veux faire un suivi de mes entraînements ainsi que de mes statistiques.';
                  //_saveResponseToFirebase(_selectedOption);
                });
              },
              child: const Text('Je suis un sportif : Je veux faire un suivi de mes entraînements ainsi que de mes statistiques.'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedOption =
                  'heuuuuu wtf c est quoi ici aussi ???';
                  //_saveResponseToFirebase(_selectedOption);
                });
              },
              child: const Text('Je suis coach : Je veux gerer les séances d\'entraînement et progrès individuels de mes athlètes.'),
            ),
          ],
        ),
      ),
    );
  }
}
