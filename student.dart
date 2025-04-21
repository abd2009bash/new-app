class Student {
  int? id;
  String stdname;
  String stdphone;
  String stdaddress;
  int squran;
  int sarabic;
  int sbilogy;
  int schimastry;
  int senglish;
  int smathss;

  Student({
    this.id,
    required this.stdname,
    required this.stdphone,
    required this.stdaddress,
    required this.squran,
    required this.sarabic,
    required this.sbilogy,
    required this.schimastry,
    required this.senglish,
    required this.smathss,
  });

  factory Student.fromMap(Map<String, dynamic> json) => Student(
        id: json['id'],
        stdname: json['stdname'],
        stdphone: json['stdphone'],
        stdaddress: json['stdaddress'],
        squran: json['squran'],
        sarabic: json['sarabic'],
        sbilogy: json['sbilogy'],
        schimastry: json['schimastry'],
        senglish: json['senglish'],
        smathss: json['smathss'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'stdname': stdname,
        'stdphone': stdphone,
        'stdaddress': stdaddress,
        'squran': squran,
        'sarabic': sarabic,
        'sbilogy': sbilogy,
        'schimastry': schimastry,
        'senglish': senglish,
        'smathss': smathss,
      };
}
