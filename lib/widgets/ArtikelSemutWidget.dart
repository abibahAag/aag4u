import 'package:flutter/material.dart';

class ArtikelSemutwidget extends StatelessWidget {
  // const BennerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Container(
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width * 1,
            child: Text(
              "Semut Api Kecil, Bahaya Besar",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Image.asset(
            "images/blog/artikel3.jpg",
            // width: 500,
            // height: 150,
            width:
                MediaQuery.of(context).size.width * 0.9, // 90% of screen width
            // height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Container(
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width * 1,
            child: Text(
              """Hewan Kecil yang Membawa Maut 
              Sebuah kisah tragis kembali menggemparkan Amerika Serikat. Cathy Weed, seorang perempuan yang tinggal di Lawrenceville, Georgia, meninggal dunia setelah digigit semut api di dekat rumahnya pada 24 Juni 2024. Kejadian ini diberitakan oleh USAtoday dan menjadi pengingat bagi kita semua tentang bahaya hewan kecil yang seringkali  dianggap remeh: semut api.""",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
          child: Container(
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width * 1,
            child: Text(
              """Semut api, meskipun terlihat kecil dan tidak berbahaya, dapat membawa racun mematikan bagi orang yang alergi. Sengatan mereka dapat memicu reaksi alergi parah yang disebut anafilaksis, yang dapat menyebabkan kematian dalam hitungan menit. Cathy Weed bukan satu-satunya korban semut api. Setiap tahun, ribuan orang di Amerika Serikat harus dilarikan ke rumah sakit karena sengatan semut api.""",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
          child: Container(
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width * 1,
            child: Text(
              """Bagaimana Semut Api Menjadi Ancaman?              Semut api adalah sejenis semut penyengat yang biasanya  hidup di gundukan lumpur di dalam tanah. Mereka dapat ditemukan di beberapa negara bagian AS dan terkadang menjadi invasif. Semut api menyerang dengan cara menggigit dan menyengat mangsanya. Mereka sangat agresif saat menyengat dan dapat menyuntikkan racun berulang kali ke dalam tubuh manusia. Bagi kebanyakan orang, gigitan semut api hanya menyebabkan rasa sakit dan bengkak ringan. Namun, bagi orang dengan alergi semut api, sengatan mereka dapat berakibat fatal.""",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
