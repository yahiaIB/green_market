import 'dart:convert';
import 'dart:io';
import 'package:Vio_Telehealth/models/area.dart';
import 'package:Vio_Telehealth/models/region.dart';
import '../web_services/endpoints.dart';
import '../web_services/http_client.dart';

class AreaRegionRepository {

  Future<List<Area>> getAreas({String userId}) async {
    try{
      final response = await HttpClient.getInstance().get(EndPoints.areasEndpoint);
      List<Area> areas = response.data.map<Area>((area)=> Area().fromJson(area)).toList();
      return areas;
    }catch(e){
      throw e;
    }

  }

  Future<List<Region>> getRegions(areaId) async {
    try {
      var response = await HttpClient.getInstance().get(EndPoints.regionsEndpoint(areaId));
      List<Region> regions = response.data.map<Region>((region)=> Region().fromJson(region)).toList();
      return regions;
    } catch (e) {
      throw e;
    }
  }

}
