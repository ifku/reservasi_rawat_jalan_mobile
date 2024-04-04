import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/data_sources/news_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/news_model.dart';

class NewsFakeDataSource implements NewsDataSource {
  @override
  Future<Either<Exception, List<NewsModel>>> getNews() async {
    await Future.delayed(const Duration(seconds: 3));
    return Right([
      NewsModel(
          title:
              'Apakah Kopi Hitam Tanpa Gula Bagus untuk Jantung? Ini Penjelasannya…',
          author: 'Ria Apriani Kusumastuti',
          url:
              'https://health.kompas.com/read/24C04180000568/apakah-kopi-hitam-tanpa-gula-bagus-untuk-jantung-ini-penjelasannya-',
          urlToImage:
              'https://asset.kompas.com/crops/P7c2p6UWq78UV14YEGJxWREOVuE=/0x0:1000x667/750x500/data/photo/2023/07/14/64b0bc1c9ab1d.jpg',
          publishedAt: DateTime.now(),
          content:
              """Minum kopi hitam tanpa gula secara rutin ternyata bagus untuk kesehatan jantung. Dilansir dari Health, minum 
          dua hingga tiga cangkir kopi hitam setiap hari sudah terbukti dapat menurunkan risiko penyakit jantung dan stroke hingga 
          20 persen dan risiko artimia hingga 17 persen. Kafein di dalam kopi juga telah terbukti dapat menurunkan risiko aritmia, 
          yang merupakan gangguan irama denyut jantung. Meskipun begitu, belum diketahui secara pasti mengenai efek kopi terhadap 
          kesehatan jantung. Beberapa ahli percaya bahwa kandungan polifenol pada kafein di dalam kopi dapat mengubah metabolisme 
          di dalam tubuh, seperti meningkatkan sensitivitas insulin dan meningkatkan flora usus. Efek tersebut dapat menurunkan 
          risiko penyakit jantung koroner, gagal jantung kongestif, dan stroke. Kafein juga dapat menghentikan reseptor tubuh yang 
          mengikat adenosine, atau molekul yang dapat memengaruhi sel jantung dan meningkatkan risiko aritmia. Mengingat manfaat yang 
          didapatkan tersebut, Anda dapat minum kopi hitam tanpa gula secara rutin, termasuk jika memiliki riwayat penyakit jantung. 
          Minum kopi hitam tanpa tambahan gula bisa menjadi bagian dari diet sehat yang akan mendukung fungsi tubuh secara maksimal.
          Artikel ini telah tayang di Kompas.com dengan judul "Apakah Kopi Hitam Tanpa Gula Bagus untuk Jantung? Ini Penjelasannya…", 
          """),
      NewsModel(
          title: 'Tips Puasa Agar Badan Tidak Lemas Sampai Waktu Buka Tiba',
          author: 'Shintaloka Pradita Sicca',
          url:
              'https://health.kompas.com/read/24C05070000168/tips-puasa-agar-badan-tidak-lemas-sampai-waktu-buka-tiba',
          urlToImage:
              'https://asset.kompas.com/crops/Jjhn4_m1gxxP2EKu2HjjfkATb_Q=/57x29:961x632/750x500/data/photo/2023/03/18/64158c5116274.jpg',
          publishedAt: DateTime.parse('2024-03-05'),
          content:
              """Selama puasa Ramadhan, sejumlah pola hidup seseorang berubah, meliputi makan dan tidur. Itu bisa membuat Anda 
              menjadi merasa kekurangan energi. Namun, masalah ini bisa diatasi dengan mengatur pola makan dan aktivitas agar lebih bugar. 
              Artikel ini akan menunjukkan tips agar tetap berenergi saat menjalani puasa Ramadhan.
              Anda tidak boleh melewatkan waktu sahur saat puasa. Tubuh Anda bergantung pada makanan terakhir yang Anda makan untuk memberi semua 
              nutrisi dan energi hingga berbuka puasa. Sehingga, sahur memperpanjang ketahanan Anda untuk puasa. Selama puasa Ramadhan, sahur seperti 
              sarapan yang sangat penting karena menjadi sumber energi untuk mengawali hari Anda dan mencegah lemas di siang hari. Selain itu, melewatkan 
              sahur juga mendorong makan berlebihan saat berbuka, yang dapat menyebabkan penambahan berat badan yang tidak sehat.
          """),
      NewsModel(
          title:
              'Penyakit Obesitas seperti Apa? Kenali Gejala dan Penyebabnya...',
          author: 'Elizabeth Ayudya Ratna Rininta',
          url:
              'https://health.kompas.com/read/24C04160000368/penyakit-obesitas-seperti-apa-kenali-gejala-dan-penyebabnya',
          urlToImage:
              'https://asset.kompas.com/crops/bYU4CY1VuRB-GxLuDW7n1u9GO24=/0x0:501x334/750x500/data/photo/2023/03/18/64155bc328456.png',
          publishedAt: DateTime.parse('2024-03-04'),
          content:
              """Obesitas dapat memicu kondisi kronis, seperti hipertensi, diabetes, sakit jantung, dan stroke. Namun, tahukah Anda penyakit 
              obesitas seperti apa? Penyakit obesitas adalah kondisi ketika seseorang memiliki penumpukan lemak berlebihan karena asupan energi 
              yang masuk dan yang digunakan tidak seimbang. Individu dengan obesitas cenderung mengonsumsi asupan tinggi kalori sebelum merasa 
              kenyang, lebih cepat lapar, atau konsumsi makanan secara berlebihan akibat stres atau gangguan cemas. Seseorang dikatakan mengidap obesitas 
              apabila indeks massa tubuhnya lebih dari 27,0. Makanan menjadi faktor utama yang menyebabkan obesitas. Kemudian diikuti faktor-faktor lain, 
              seperti aktivitas fisik, gaya hidup, dan riwayat genetik. Untuk mengetahui lebih lanjut penyakit obesitas seperti apa, simak gejala dan 
              penyebabnya berikut.
          """),
    ]);
  }
}
