import 'package:flutter/material.dart';
import 'student.dart';
import 'database_helper.dart';
import 'students_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _quranController = TextEditingController();
  final TextEditingController _arabicController = TextEditingController();
  final TextEditingController _biologyController = TextEditingController();
  final TextEditingController _chemistryController = TextEditingController();
  final TextEditingController _englishController = TextEditingController();
  final TextEditingController _mathController = TextEditingController();

  int _studentCount = 0;

  @override
  void initState() {
    super.initState();
    _loadStudentCount();
  }

  Future<void> _loadStudentCount() async {
    int count = await DatabaseHelper.instance.getStudentCount();
    setState(() {
      _studentCount = count;
    });
  }

  Future<void> _addStudent() async {
    if (_formKey.currentState!.validate()) {
      Student student = Student(
        stdname: _nameController.text,
        stdphone: _phoneController.text,
        stdaddress: _addressController.text,
        squran: int.parse(_quranController.text),
        sarabic: int.parse(_arabicController.text),
        sbilogy: int.parse(_biologyController.text),
        schimastry: int.parse(_chemistryController.text),
        senglish: int.parse(_englishController.text),
        smathss: int.parse(_mathController.text),
      );
      await DatabaseHelper.instance.insertStudent(student);
      _loadStudentCount();
      _formKey.currentState!.reset();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم إضافة الطالب بنجاح')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نظام مدرستي'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // إعدادات التطبيق
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
               
::contentReference[oaicite:0]{index=0}
 
