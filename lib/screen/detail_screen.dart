import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
//import 'package:get/instance_manager.dart';
import 'package:restapi/api/apiservice.dart';
import 'package:restapi/model/detail.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  final ApiService apiService = Get.find();
  final String country_name;
  DetailScreen(this.country_name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: FutureBuilder<List<Detail>>(
          future: apiService.getDetail(country_name),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Detail detail = snapshot.data![0];
              return ListView(
                children: [
                  Center(
                      child: Text('${detail.name}',
                          style: TextStyle(fontSize: 25))),
                  Text(
                    'region : ${detail.region}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'subregion : ${detail.subregion}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'population : ${detail.population}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Demonym : ${detail.demonym}',
                    style: TextStyle(fontSize: 20),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        'https://countryflagsapi.com/png/${detail.alpha2Code}',
                    width: 300,
                    height: 300,
                    fit: BoxFit.fill,
                    placeholder: (_, __) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
