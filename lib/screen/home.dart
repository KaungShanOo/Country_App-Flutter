import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi/api/apiservice.dart';
import 'package:restapi/model/country.dart';
import 'package:dio/dio.dart';
import 'package:restapi/screen/detail_screen.dart';

class Home extends StatelessWidget {
  ApiService apiService = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries List')),
      body: FutureBuilder<List<Country>>(
          future: apiService.getCountries(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Country>? country = snapshot.data;
              return ListView.builder(
                  itemCount: country!.length,
                  itemBuilder: (context, position) {
                    return item(country[position], context);
                  });
            } else if (snapshot.hasError) return Text('Error');
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget item(Country country, context) {
    return Card(
      child: ListTile(
        onTap: () {
              Get.to(DetailScreen(country.name));
        },
        leading: CachedNetworkImage(
          imageUrl: 'https://countryflagsapi.com/png/${country.alpha2Code}',
          width: 100,
          height: 100,
          placeholder: (_, __) => Center(child: CircularProgressIndicator()),
        ),
        title: Text(
          country.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          country.region,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
