import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_mbtiles_provider/flutter_map_mbtiles_provider.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(FlutterMapApp());
}

class FlutterMapApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OfflineMBTilesMapPage(),
    );
  }
}

class OfflineMBTilesMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offline Map (using MBTiles)')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text('This is an offline map of Berlin, Germany using a single MBTiles file. The file was built from the Stamen toner map data (http://maps.stamen.com).\n\n'
                  '(Map tiles by Stamen Design, under CC BY 3.0. Data by OpenStreetMap, under ODbL.)'),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(6.849574, -0.715688),
                  minZoom: 10.0,
                  maxZoom: 18.0,
                  zoom: 12.0,
                  // swPanBoundary: LatLng(52.492205, 13.282081),
                  // nePanBoundary: LatLng(52.540084, 13.527795),
                ),
                children: [
                  TileLayer(
                    tileProvider: MBTilesImageProvider.fromAsset('assets/berlin.mbtiles'),
                    maxZoom: 18.0,
                    backgroundColor: Colors.white,
                    tms: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
