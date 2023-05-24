import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
import 'secondpage.dart';
import 'bottomnav.dart';
// import 'radio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const appTitle = '';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.indigo,
        ),
        body: SingleChildScrollView(
          child: const MyForm(),
        ),
        bottomNavigationBar: BottomNavigationMenu(),
      ),
    );
  }
}

class MyForm extends StatefulWidget{
  const MyForm({super.key});

  @override
  MyFormState createState(){
    return MyFormState();
  }
}

class MyFormState extends State<MyForm>{
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _selectedOption = '';
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final firstController  = TextEditingController();
    final secondController = TextEditingController();
    final threeController = TextEditingController();

    return Form(
      key: _formKey,
      child:Container(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Container(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                style: TextStyle(fontSize: 24),
                decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.grey
                        )
                    ),
                  labelText: 'Nama barang',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    // child: Icon(Icons.email),
                  )
                ),
                controller: firstController,
                validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                maxLines: 4,
                style: TextStyle(fontSize: 24),
                decoration: new InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3, color: Colors.grey,
                    )
                  ),
                  labelText: 'Deskripsi\n\n\n',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      // child: Icon(Icons.password),
                    ),
                ),
                controller: secondController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                  },
              )
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                style: TextStyle(fontSize: 24),
                decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.grey
                        )
                    ),
                    labelText: 'Harga',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      // child: Icon(Icons.email),
                    )
                ),
                controller: threeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text('Kondisi Barang'),
            RadioListTile(
              title: Text('Bekas'),
              value: 'Bekas',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('Baru'),
              value: 'Baru',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value.toString();
                });
              },
            ),

            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('Pengiriman dalam kota saja'),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Menerima retur'),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),

            Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: ElevatedButton(
                    onPressed: (){

                      print('Kondisi Barang: $_selectedOption');
                      print('Pengiriman dalam kota saja: $_isChecked');
                      print('Menerima retur: $_isChecked');

                      List<String> formData = [];

                      String kirim1 = firstController.text;
                      String kirim2 = secondController.text;
                      String kirim3 = threeController.text;

                      formData.add(kirim1);
                      formData.add(kirim2);

                      /*AlertDialog alert = AlertDialog(
                        title: Text("Coba get data"),
                        content: Text(kirim1+" - "+kirim2),
                      );

                      showDialog(context: context,
                          builder:(BuildContext context){
                            return alert;
                          }
                      );*/

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondPage(data: formData)
                          )
                      );
                    },
                      // Perform form submission or validation
                      // You can access the form values here
                    child: const Text("Submit"))
            )
          ], // Menampilkan konten dari file_tampilan.dart
        ),
      ),
    );
  }
}

