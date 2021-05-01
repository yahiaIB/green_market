import 'package:Blwahda/models/area.dart';
import 'package:Blwahda/models/region.dart';
import 'package:Blwahda/repositories/region_area_repository.dart';
import 'package:Blwahda/view_models/base_model.dart';
import 'package:flutter/cupertino.dart';

class RegionAreaViewModel extends BaseViewModel {


  AreaRegionRepository _repository = AreaRegionRepository();

  List<Area> _areas = [];
  List<Region> _regions= [];

  List<Area>get  areas => _areas;

  List<Region>get  regions => _regions;

  Area selectedArea;
  Region selectedRegion;


  Future getAreas() async {
    List<Area> areasList = await _repository.getAreas();
    _areas = areasList;
    notifyListeners();
  }


  onAreaChange({@required Area area}) async {
    selectedArea = area;
    selectedRegion = null;
    await _getRegionsOnSpecificArea(areaId: area.sId);
    notifyListeners();
  }

  Future _getRegionsOnSpecificArea({@required String areaId}) async {
    List<Region> regionsList = await _repository.getRegions(areaId);
    _regions = regionsList;
    notifyListeners();
  }

  onChangeRegion(Region region){
    selectedRegion = region;
    notifyListeners();
  }

  resetSelected(){
    selectedRegion = null;
    selectedArea = null;
  }

}