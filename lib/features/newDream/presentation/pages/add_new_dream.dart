import 'package:flutter/material.dart';

class AddDreamScreen extends StatefulWidget {
  @override
  _AddDreamScreenState createState() => _AddDreamScreenState();
}

class _AddDreamScreenState extends State<AddDreamScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  int _lucidity = 1;
  int _clarity = 3;
  String _duration = 'Court';
  int _sleepQuality = 3;
  String _mood = 'Joyeux';
  bool _isNightmare = false;
  bool _isRecurring = false;
  List<String> _tags = [];
  List<String> predefinedTags = [
    "Vol", "Eau", "Famille", "Animaux", "Ville", "Nature", "Poursuite", "École"
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _date)
      setState(() {
        _date = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time)
      setState(() {
        _time = picked;
      });
  }

  void _addTag(String tag) {
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    final firstDate = DateTime(DateTime.now().year - 120);
    final lastDate = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.bedtime, color: Colors.purple),
            SizedBox(width: 8),
            Text('Nouveau Rêve'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Sauvegarder en brouillon
            },
            child: Text('Brouillon', style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              _formKey.currentState?.reset();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.bedtime, color: Colors.purple),
                          SizedBox(width: 8),
                          Text('Détails du rêve', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Titre du rêve *'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer un titre';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _title = value!;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Date'),
                                InputDatePickerFormField(firstDate: firstDate, lastDate: lastDate,)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Heure du réveil'),
                                TextButton(
                                  onPressed: () => _selectTime(context),
                                  child: Text(_time.format(context)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Description du rêve *'),
                        maxLines: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer une description';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _description = value!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange),
                          SizedBox(width: 8),
                          Text('Caractéristiques', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Niveau de lucidité'),
                          Slider(
                            value: _lucidity.toDouble(),
                            min: 1,
                            max: 5,
                            divisions: 4,
                            label: _lucidity.toString(),
                            onChanged: (value) {
                              setState(() {
                                _lucidity = value.toInt();
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pas conscient'),
                              Text('Totalement lucide'),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Clarté du souvenir'),
                          Slider(
                            value: _clarity.toDouble(),
                            min: 1,
                            max: 5,
                            divisions: 4,
                            label: _clarity.toString(),
                            onChanged: (value) {
                              setState(() {
                                _clarity = value.toInt();
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Très flou'),
                              Text('Très clair'),
                            ],
                          ),
                        ],
                      ),
                      DropdownButtonFormField<String>(
                        value: _duration,
                        decoration: InputDecoration(labelText: 'Durée perçue'),
                        items: ['Court', 'Moyen', 'Long', 'Très long'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _duration = newValue!;
                          });
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qualité du sommeil'),
                          Slider(
                            value: _sleepQuality.toDouble(),
                            min: 1,
                            max: 5,
                            divisions: 4,
                            label: _sleepQuality.toString(),
                            onChanged: (value) {
                              setState(() {
                                _sleepQuality = value.toInt();
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Très mauvais'),
                              Text('Excellent'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.pink),
                          SizedBox(width: 8),
                          Text('Émotions et type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text('Humeur générale'),
                      Wrap(
                        spacing: 8.0,
                        children: [
                          'Joyeux', 'Paisible', 'Mystérieux', 'Nostalgique', 'Anxieux', 'Excité'
                        ].map((mood) {
                          return ChoiceChip(
                            label: Text(mood),
                            selected: _mood == mood,
                            onSelected: (selected) {
                              setState(() {
                                _mood = mood;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SwitchListTile(
                        title: Text('Cauchemar'),
                        subtitle: Text('Ce rêve était-il effrayant ?'),
                        value: _isNightmare,
                        onChanged: (value) {
                          setState(() {
                            _isNightmare = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text('Rêve récurrent'),
                        subtitle: Text('Avez-vous déjà fait ce rêve ?'),
                        value: _isRecurring,
                        onChanged: (value) {
                          setState(() {
                            _isRecurring = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.label, color: Colors.green),
                          SizedBox(width: 8),
                          Text('Thèmes et éléments', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Wrap(
                        spacing: 8.0,
                        children: _tags.map((tag) {
                          return Chip(
                            label: Text(tag),
                            onDeleted: () => _removeTag(tag),
                          );
                        }).toList(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(labelText: 'Ajouter un thème...'),
                              onSubmitted: _addTag,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              // Ajouter un thème
                            },
                          ),
                        ],
                      ),
                      Text('Thèmes populaires'),
                      Wrap(
                        spacing: 8.0,
                        children: predefinedTags.map((tag) {
                          return FilterChip(
                            label: Text(tag),
                            onSelected: (selected) {
                              _addTag(tag);
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.camera_alt, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Médias (optionnel)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: () {
                                  // Ajouter une photo
                                },
                              ),
                              Text('Photo'),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.color_lens),
                                onPressed: () {
                                  // Ajouter un dessin
                                },
                              ),
                              Text('Dessin'),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.mic),
                                onPressed: () {
                                  // Ajouter un audio
                                },
                              ),
                              Text('Audio'),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Ajoutez des images, dessins ou enregistrements pour enrichir votre rêve',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Sauvegarder en brouillon
                  }
                },
                child: Text('Sauvegarder en brouillon'),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Enregistrer
                  }
                },
                child: Text('Enregistrer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
