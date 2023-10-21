import 'package:flutter/material.dart';
import 'package:fire_guardian/core.dart';
import '../view/history_view.dart';

class HistoryController extends State<HistoryView> {
  static late HistoryController instance;
  late HistoryView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  List<Map<String, dynamic>> historyData = [
    {
      "name": "aisyah",
      "address": "Jl. Mawar No. 123, Jakarta",
      "date": "20:12 22/01/2023",
      "tim": "timA",
      "pemicu": "lupa mematikan kompor"
    },
    {
      "name": "aisyah",
      "address": "Jl. Mawar No. 123, Jakarta",
      "date": "20:12 22/01/2023",
      "tim": "timA",
      "pemicu": "lupa mematikan kompor"
    },
    {
      "name": "budi",
      "address": "Jl. Anggrek No. 456, Surabaya",
      "date": "12:45 19/03/2023",
      "tim": "timB",
      "pemicu": "kerusakan kabel listrik"
    },
    {
      "name": "citra",
      "address": "Jl. Kamboja No. 789, Bandung",
      "date": "08:30 05/06/2023",
      "tim": "timC",
      "pemicu": "pemakaian listrik berlebihan"
    },
    {
      "name": "david",
      "address": "Jl. Dahlia No. 101, Medan",
      "date": "16:50 11/09/2023",
      "tim": "timD",
      "pemicu": "korsleting pada stop kontak"
    },
    {
      "name": "emily",
      "address": "Jl. Tulip No. 202, Makassar",
      "date": "22:15 30/10/2023",
      "tim": "timE",
      "pemicu": "penggunaan alat elektronik rusak"
    },
    {
      "name": "ferdi",
      "address": "Jl. Mawar No. 345, Semarang",
      "date": "17:20 08/12/2023",
      "tim": "timF",
      "pemicu": "hubungan pendek pada kabel"
    },
    {
      "name": "gita",
      "address": "Jl. Anggrek No. 567, Yogyakarta",
      "date": "10:40 25/01/2024",
      "tim": "timG",
      "pemicu": "overload pada sirkuit"
    },
    {
      "name": "harry",
      "address": "Jl. Kamboja No. 678, Palembang",
      "date": "18:05 07/04/2024",
      "tim": "timH",
      "pemicu": "arcing pada switch"
    },
    {
      "name": "intan",
      "address": "Jl. Dahlia No. 909, Surabaya",
      "date": "13:30 15/07/2024",
      "tim": "timI",
      "pemicu": "kelebihan daya pada panel listrik"
    },
  ];
}
