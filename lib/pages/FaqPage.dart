import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/PusatBantuanPage.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqPage extends StatelessWidget {
  final List<Map<String, String>> faqList = [
    {
      'question':
          'Apakah pest control aman untuk keluarga dan hewan peliharaan?',
      'answer':
          'Ya, kami menggunakan bahan kimia yang telah disetujui dan aman untuk lingkungan, manusia, serta hewan peliharaan, selama petunjuk keamanan diikuti dengan benar.'
    },
    {
      'question':
          'Berapa lama waktu yang dibutuhkan untuk proses pest control?',
      'answer':
          'Waktu pengerjaan tergantung pada jenis hama dan tingkat infestasi. Umumnya, pengerjaan membutuhkan waktu antara 1-3 jam per sesi.'
    },
    {
      'question':
          'Bagaimana cara mempersiapkan rumah sebelum layanan pest control?',
      'answer': 'Persiapan yang perlu dilakukan meliputi:\n'
          '- Menyimpan makanan di tempat tertutup.\n'
          '- Menyingkirkan barang-barang yang mudah terpapar bahan kimia.\n'
          '- Memberikan akses mudah ke area yang terinfestasi, seperti dapur, kamar mandi, atau gudang.'
    },
    {
      'question': 'Pest Control Umum?',
      'answer':
          'Pengendalian hama umum yang sering ditemukan di rumah, kantor, dan lingkungan lainnya.\nHama yang ditangani meliputi:\n'
              '- kecoa\n'
              '- tikus\n'
              '- semut\n'
              '- nyamuk\n'
              '- Serangga lainnya'
    },
    {
      'question': 'Rodent Control?',
      'answer':
          'Pengendalian khusus untuk tikus atau hewan pengerat lainnya yang dapat menyebabkan kerusakan fisik dan menyebarkan penyakit.\n'
              'Hama yang ditangani:\n'
              '- Tikus rumah\n'
              '- Tikus got\n'
              '- Tikus atap'
    },
    {
      'question': 'Termite Control (Pengendalian Rayap)?',
      'answer':
          'Layanan untuk mencegah dan membasmi rayap yang dapat merusak struktur bangunan dan furnitur.\n'
              'Hama yang ditangani:\n'
              '- Rayap tanah\n'
              '- Rayap kayu kering'
    },
    {
      'question': 'Bagaimana cara memesan layanan pest control?',
      'answer': 'Anda dapat menghubungi kami melalui:\n'
          '- Telepon: (021) 83701276\n'
          '- Email: infopest@aag.co.id\n'
          '- Website: https://aag.co.id\n'
          '- WhatsApp: https://wa.me/+6281237419002'
    },
  ];

  FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize =
        screenWidth * 0.04; // Font responsif berdasarkan lebar layar
    final double paddingSize = screenWidth * 0.05;
    double screenWidthIcon = MediaQuery.of(context).size.width * 0.05;
    double screenWidtAppBar = MediaQuery.of(context).size.width * 0.08;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidtAppBar,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: screenWidthIcon,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Pusatbantuanpage(),
              ),
              (route) => false, // Hapus semua halaman sebelumnya
            );
          },
        ),
        title: Text(
          'FAQ',
          style: TextStyle(fontSize: fontSize),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(paddingSize * 0.5),
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final question = faqList[index]['question']!;
          final answer = faqList[index]['answer']!;
          return Card(
            margin: EdgeInsets.symmetric(vertical: paddingSize * 0.3),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  question,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                ),
                children: [
                  Divider(
                    color: Colors.grey[500],
                    thickness: 2,
                    indent: 16,
                    endIndent: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.all(paddingSize * 0.6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildAnswerContent(answer, context, fontSize),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildAnswerContent(
      String answer, BuildContext context, double fontSize) {
    return answer.split('\n').map((line) {
      if (line.trim().startsWith('-')) {
        final trimmedLine = line.substring(1).trim();

        if (trimmedLine.contains('Email:')) {
          final email = trimmedLine.replaceFirst('Email:', '').trim();
          return _buildLinkRow(
              '• Email:    ', email, 'mailto:$email', fontSize);
        } else if (trimmedLine.contains('Website:')) {
          final url = trimmedLine.replaceFirst('Website:', '').trim();
          return _buildLinkRow('• Website: ', url, url, fontSize);
        } else if (trimmedLine.contains('WhatsApp:')) {
          final url = trimmedLine.replaceFirst('WhatsApp:', '').trim();
          return _buildLinkRow('• WhatsApp:', url, url, fontSize);
        }

        return Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• ', style: TextStyle(fontSize: fontSize)),
              Expanded(
                child: Text(
                  trimmedLine,
                  style: TextStyle(fontSize: fontSize, height: 1.5),
                ),
              ),
            ],
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            line,
            style: TextStyle(fontSize: fontSize, height: 1.5),
          ),
        );
      }
    }).toList();
  }

  Widget _buildLinkRow(
      String label, String value, String url, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label ',
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => _launchUrl(url),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2, // Agar tidak memakan banyak tempat di layar kecil
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
