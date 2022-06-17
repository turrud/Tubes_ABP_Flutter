// ignore: file_names, camel_case_types
class Kendaraan {
  final int id;
  final String harga;
  final String penumpang;
  final String nama;
  final String imageURL;
  final String decription;

  Kendaraan(
      {required this.id,
      required this.harga,
      required this.nama,
      required this.penumpang,
      required this.imageURL,
      required this.decription});

  //List of Plants data
  static List<Kendaraan> kendaraanList = [
    Kendaraan(
        id: 0,
        harga: 'Rp 1.800.000',
        nama: 'Jazz',
        penumpang: '5',
        imageURL: 'assets/images/jazz.webp',
        decription:
            'Mobil rongsok berkualitas tinggi dengan kapasitas 5 orang. Kapasitasnya bisa diubah sesuai kebutuhan. Mobil ini bisa dibawa kemana saja.'),
    Kendaraan(
        id: 1,
        harga: 'Rp 2.000.000',
        nama: 'Fortuner',
        penumpang: '6',
        imageURL: 'assets/images/fortuner.webp',
        decription:
            'Mobil rongsok berkualitas tinggi dengan kapasitas 5 orang. Kapasitasnya bisa diubah sesuai kebutuhan. Mobil ini bisa dibawa kemana saja.'),
    Kendaraan(
        id: 2,
        harga: 'Rp 2.500.000',
        nama: 'Pajeroo',
        penumpang: '6',
        imageURL: 'assets/images/pajeroo.webp',
        decription:
            'Mobil rongsok berkualitas tinggi dengan kapasitas 5 orang. Kapasitasnya bisa diubah sesuai kebutuhan. Mobil ini bisa dibawa kemana saja.'),
    Kendaraan(
        id: 3,
        harga: 'Rp 5.000.000',
        nama: 'Mobillio',
        penumpang: '4-5',
        imageURL: 'assets/images/mobillio.webp',
        decription:
            'Mobil rongsok berkualitas tinggi dengan kapasitas 5 orang. Kapasitasnya bisa diubah sesuai kebutuhan. Mobil ini bisa dibawa kemana saja.'),
    Kendaraan(
        id: 4,
        harga: 'Rp 3.000.000',
        nama: 'Brio',
        penumpang: '4-5',
        imageURL: 'assets/images/brio.webp',
        decription:
            'Mobil rongsok berkualitas tinggi dengan kapasitas 5 orang. Kapasitasnya bisa diubah sesuai kebutuhan. Mobil ini bisa dibawa kemana saja.'),
    Kendaraan(
        id: 5,
        harga: 'Rp 1.500.000',
        nama: 'Avanza',
        penumpang: '5-6',
        imageURL: 'assets/images/avanza.png',
        decription:
            'Mobil rongsok berkualitas tinggi dengan kapasitas 5 orang. Kapasitasnya bisa diubah sesuai kebutuhan. Mobil ini bisa dibawa kemana saja.'),
    Kendaraan(
        id: 6,
        harga: 'Rp 5.000.000',
        nama: 'Camry',
        penumpang: '4-5',
        imageURL: 'assets/images/camry.webp',
        decription:
            'Mobil rongsok berkualitas tinggi dengan kapasitas 5 orang. Kapasitasnya bisa diubah sesuai kebutuhan. Mobil ini bisa dibawa kemana saja.'),
    Kendaraan(
        id: 7,
        harga: 'Rp 500.000',
        nama: 'Scoopy',
        penumpang: '1-2',
        imageURL: 'assets/images/scoopy.webp',
        decription:
            'Motor rongsok berkualitas tinggi dengan kapasitas 5 orang. Kapasitasnya bisa diubah sesuai kebutuhan. Mobil ini bisa dibawa kemana saja.'),
    Kendaraan(
        id: 8,
        harga: 'Rp 250.000',
        nama: 'Supra',
        penumpang: '1-2',
        imageURL: 'assets/images/supra.webp',
        decription:
            'Mobil rongsok berkualitas tinggi dengan kapasitas 5 orang. Kapasitasnya bisa diubah sesuai kebutuhan. Mobil ini bisa dibawa kemana saja.'),
  ];

}
