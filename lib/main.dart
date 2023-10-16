import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ZodiacApp(),
    ),
  );
}

class ZodiacApp extends StatefulWidget {
  const ZodiacApp({super.key});

  @override
  _ZodiacAppState createState() => _ZodiacAppState();
}

class _ZodiacAppState extends State<ZodiacApp> {
  String _nama = '';
  String _tanggalLahir = '';
  String _umur = '';
  String _zodiak = '';
  String _zodiacImg = '';
  String _zodiacDesc = '';
  final player = AudioPlayer();
  final tts = FlutterTts();

  void speak() async {
    await tts.setLanguage('en-US');
    await tts.setVolume(1);
    await tts.setPitch(1);

    if (_zodiacDesc.isNotEmpty) await tts.speak(_zodiacDesc);
  }

  void playSound() async {
    await player.setSource(AssetSource('sfx.mp3'));
    await player.play(AssetSource('sfx.mp3'));
  }

  void _hitungUmur() {
    final tanggalLahir = DateTime.parse(_tanggalLahir);
    final sekarang = DateTime.now();
    final umur = sekarang.year - tanggalLahir.year;
    setState(() => _umur = umur.toString());

    final bulan = tanggalLahir.month;
    final tanggal = tanggalLahir.day;

    playSound();
    speak();
    log(_zodiacDesc);

    if ((bulan == 3 && tanggal >= 21) || (bulan == 4 && tanggal <= 19)) {
      _zodiak = 'Aries';
      _zodiacImg = 'aries.png';
      _zodiacDesc =
          'Aries is the first zodiac sign and is known as a leader. They tend to be brave, energetic, and enthusiastic. Aries individuals are often driven by their passion and are not afraid to take risks. They have a strong desire to achieve their goals and can be quite competitive.';
    } else if ((bulan == 4 && tanggal >= 20) || (bulan == 5 && tanggal <= 20)) {
      _zodiak = "Taurus";
      _zodiacImg = 'taurus.png';
      _zodiacDesc =
          'Taurus is the second zodiac sign and is associated with material pleasures. They tend to be reliable, practical, and ambitious. Taurus individuals are often hard-working and enjoy the finer things in life. They are loyal friends and partners who value honesty above all else.';
    } else if ((bulan == 5 && tanggal >= 21) || (bulan == 6 && tanggal <= 20)) {
      _zodiak = "Gemini";
      _zodiacImg = 'gemini.png';
      _zodiacDesc =
          'Gemini is the third zodiac sign and is associated with youth and versatility. They tend to be witty, adaptable, and intellectual. Gemini individuals are often the life of the party and have a childlike curiosity about the world. They are sociable, communicative, and ready for fun.';
    } else if ((bulan == 6 && tanggal >= 21) || (bulan == 7 && tanggal <= 22)) {
      _zodiak = 'Cancer';
      _zodiacImg = 'cancer.png';
      _zodiacDesc =
          'Cancer is the fourth zodiac sign and is characterized by their emotional and nurturing nature. They are known for their strong intuition and sensitivity. Cancer individuals are family-oriented and often take care of others. They are loyal and empathetic.';
    } else if ((bulan == 7 && tanggal >= 23) || (bulan == 8 && tanggal <= 22)) {
      _zodiak = 'Leo';
      _zodiacImg = 'leo.png';
      _zodiacDesc =
          'Leo is the fifth zodiac sign and is associated with creativity and self-expression. They tend to be generous, warm-hearted, and cheerful. Leo individuals are often ambitious and determined. They are natural leaders who enjoy being the center of attention.';
    } else if ((bulan == 8 && tanggal >= 23) || (bulan == 9 && tanggal <= 22)) {
      _zodiak = 'Virgo';
      _zodiacImg = 'virgo.png';
      _zodiacDesc =
          'Virgo is the sixth zodiac sign and is associated with service and duty. They tend to be practical, responsible, and hard-working. Virgo individuals are often intelligent and analytical. They are perfectionists who pay attention to detail and like order.';
    } else if ((bulan == 9 && tanggal >= 23) ||
        (bulan == 10 && tanggal <= 22)) {
      _zodiak = 'Libra';
      _zodiacImg = 'libra.png';
      _zodiacDesc =
          'Libra is the seventh zodiac sign and is associated with justice. They tend to be diplomatic, fair-minded, and social. Libra individuals are often charming and romantic. They are idealistic and strive to create harmony in their relationships.';
    } else if ((bulan == 10 && tanggal >= 23) ||
        (bulan == 11 && tanggal <= 21)) {
      _zodiak = 'Scorpio';
      _zodiacImg = 'scorpio.png';
      _zodiacDesc =
          'Scorpio is the eighth zodiac sign and is associated with intensity and passion. They tend to be brave, focused, and ambitious. Scorpio individuals are often mysterious and sensual. They are determined and loyal, and they will stop at nothing to achieve their goals.';
    } else if ((bulan == 11 && tanggal >= 22) ||
        (bulan == 12 && tanggal <= 21)) {
      _zodiak = 'Sagittarius';
      _zodiacImg = 'sagittarius.png';
      _zodiacDesc =
          'Sagittarius is the ninth zodiac sign and is associated with travel and expansion. They tend to be optimistic, freedom-loving, and adventurous. Sagittarius individuals are often philosophical and wise. They are curious and energetic, and they enjoy exploring new places.';
    } else if ((bulan == 12 && tanggal >= 22) ||
        (bulan == 1 && tanggal <= 19)) {
      _zodiak = 'Capricorn';
      _zodiacImg = 'capricorn.png';
      _zodiacDesc =
          'Capricorn is the tenth zodiac sign and is associated with hard work and achievements. They tend to be ambitious, determined, and practical. Capricorn individuals are often disciplined and responsible. They are goal-oriented and have a strong sense of purpose in life.';
    } else if ((bulan == 1 && tanggal >= 20) || (bulan == 2 && tanggal <= 18)) {
      _zodiak = 'Aquarius';
      _zodiacImg = 'aquarius.png';
      _zodiacDesc =
          'Aquarius is the eleventh zodiac sign and is associated with future ideas and the unusual. They tend to be idealistic, progressive, and independent. Aquarius individuals are often humanitarian and philanthropic. They are original and inventive, and they enjoy being different.';
    } else if ((bulan == 2 && tanggal >= 19) || (bulan == 3 && tanggal <= 20)) {
      _zodiak = 'Pisces';
      _zodiacImg = 'pisces.png';
      _zodiacDesc =
          'Pisces is the twelfth zodiac sign and is associated with creativity and imagination. They tend to be compassionate, intuitive, and gentle. Pisces individuals are often artistic and dreamy. They are romantic and sensitive, and they enjoy the arts.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ramalan Bintang (Zodiak)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          setState(() => _nama = value);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Nama',
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() => _tanggalLahir = value);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Tanggal Lahir (YYYY-MM-DD)',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _hitungUmur();
                        },
                        child: const Text('Hitung Umur dan Zodiac'),
                      ),
                      Text('Halo $_nama!'),
                      Text('Umur kamu $_umur tahun'),
                      Text('Zodiak kamu $_zodiak'),
                      _zodiacImg.isNotEmpty
                          ? Image.asset('assets/$_zodiacImg')
                          : Container(),
                      _zodiacDesc.isNotEmpty ? Text(_zodiacDesc) : Container(),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
