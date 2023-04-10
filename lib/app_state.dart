import 'package:flutter/material.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _fwn = await secureStorage.getInt('ff_fwn') ?? _fwn;
    _fwns = await secureStorage.getStringList('ff_fwns') ?? _fwns;
    _bw = await secureStorage.getStringList('ff_bw') ?? _bw;
    _hw = await secureStorage.getStringList('ff_hw') ?? _hw;
    _fwnD = await secureStorage.getDouble('ff_fwnD') ?? _fwnD;
    _fRNI = (await secureStorage.getStringList('ff_fRNI'))
            ?.map(int.parse)
            .toList() ??
        _fRNI;
    _fRNS = await secureStorage.getStringList('ff_fRNS') ?? _fRNS;
    _nickname = await secureStorage.getString('ff_nickname') ?? _nickname;
    _random1 = await secureStorage.getInt('ff_random1') ?? _random1;
    _random2 = await secureStorage.getInt('ff_random2') ?? _random2;
    _isGod = await secureStorage.getInt('ff_isGod') ?? _isGod;
    _mONO = (await secureStorage.getStringList('ff_mONO'))
            ?.map(int.parse)
            .toList() ??
        _mONO;
    _moNOR = await secureStorage.getStringList('ff_moNOR') ?? _moNOR;
    _fL1 = await secureStorage.getInt('ff_fL1') ?? _fL1;
    _fL2 = await secureStorage.getInt('ff_fL2') ?? _fL2;
    _fL3 = await secureStorage.getInt('ff_fL3') ?? _fL3;
    _fL4 = await secureStorage.getInt('ff_fL4') ?? _fL4;
    _fR =
        (await secureStorage.getStringList('ff_fR'))?.map(int.parse).toList() ??
            _fR;
    _fL1B = await secureStorage.getInt('ff_fL1B') ?? _fL1B;
    _fL2B = await secureStorage.getInt('ff_fL2B') ?? _fL2B;
    _fL3B = await secureStorage.getInt('ff_fL3B') ?? _fL3B;
    _fL4B = await secureStorage.getInt('ff_fL4B') ?? _fL4B;
    _GR =
        (await secureStorage.getStringList('ff_GR'))?.map(int.parse).toList() ??
            _GR;
    _fG1B = await secureStorage.getInt('ff_fG1B') ?? _fG1B;
    _fG2B = await secureStorage.getInt('ff_fG2B') ?? _fG2B;
    _fG3B = await secureStorage.getInt('ff_fG3B') ?? _fG3B;
    _fG4B = await secureStorage.getInt('ff_fG4B') ?? _fG4B;
    _wordTemp = await secureStorage.getString('ff_wordTemp') ?? _wordTemp;
    _payed = await secureStorage.getInt('ff_payed') ?? _payed;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _fwn = 0;
  int get fwn => _fwn;
  set fwn(int _value) {
    _fwn = _value;
    secureStorage.setInt('ff_fwn', _value);
  }

  void deleteFwn() {
    secureStorage.delete(key: 'ff_fwn');
  }

  List<String> _fwns = [];
  List<String> get fwns => _fwns;
  set fwns(List<String> _value) {
    _fwns = _value;
    secureStorage.setStringList('ff_fwns', _value);
  }

  void deleteFwns() {
    secureStorage.delete(key: 'ff_fwns');
  }

  void addToFwns(String _value) {
    _fwns.add(_value);
    secureStorage.setStringList('ff_fwns', _fwns);
  }

  void removeFromFwns(String _value) {
    _fwns.remove(_value);
    secureStorage.setStringList('ff_fwns', _fwns);
  }

  void removeAtIndexFromFwns(int _index) {
    _fwns.removeAt(_index);
    secureStorage.setStringList('ff_fwns', _fwns);
  }

  List<String> _bw = [];
  List<String> get bw => _bw;
  set bw(List<String> _value) {
    _bw = _value;
    secureStorage.setStringList('ff_bw', _value);
  }

  void deleteBw() {
    secureStorage.delete(key: 'ff_bw');
  }

  void addToBw(String _value) {
    _bw.add(_value);
    secureStorage.setStringList('ff_bw', _bw);
  }

  void removeFromBw(String _value) {
    _bw.remove(_value);
    secureStorage.setStringList('ff_bw', _bw);
  }

  void removeAtIndexFromBw(int _index) {
    _bw.removeAt(_index);
    secureStorage.setStringList('ff_bw', _bw);
  }

  List<String> _hw = [];
  List<String> get hw => _hw;
  set hw(List<String> _value) {
    _hw = _value;
    secureStorage.setStringList('ff_hw', _value);
  }

  void deleteHw() {
    secureStorage.delete(key: 'ff_hw');
  }

  void addToHw(String _value) {
    _hw.add(_value);
    secureStorage.setStringList('ff_hw', _hw);
  }

  void removeFromHw(String _value) {
    _hw.remove(_value);
    secureStorage.setStringList('ff_hw', _hw);
  }

  void removeAtIndexFromHw(int _index) {
    _hw.removeAt(_index);
    secureStorage.setStringList('ff_hw', _hw);
  }

  double _fwnD = 0.0;
  double get fwnD => _fwnD;
  set fwnD(double _value) {
    _fwnD = _value;
    secureStorage.setDouble('ff_fwnD', _value);
  }

  void deleteFwnD() {
    secureStorage.delete(key: 'ff_fwnD');
  }

  List<int> _fRNI = [];
  List<int> get fRNI => _fRNI;
  set fRNI(List<int> _value) {
    _fRNI = _value;
    secureStorage.setStringList(
        'ff_fRNI', _value.map((x) => x.toString()).toList());
  }

  void deleteFRNI() {
    secureStorage.delete(key: 'ff_fRNI');
  }

  void addToFRNI(int _value) {
    _fRNI.add(_value);
    secureStorage.setStringList(
        'ff_fRNI', _fRNI.map((x) => x.toString()).toList());
  }

  void removeFromFRNI(int _value) {
    _fRNI.remove(_value);
    secureStorage.setStringList(
        'ff_fRNI', _fRNI.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromFRNI(int _index) {
    _fRNI.removeAt(_index);
    secureStorage.setStringList(
        'ff_fRNI', _fRNI.map((x) => x.toString()).toList());
  }

  List<String> _fRNS = [];
  List<String> get fRNS => _fRNS;
  set fRNS(List<String> _value) {
    _fRNS = _value;
    secureStorage.setStringList('ff_fRNS', _value);
  }

  void deleteFRNS() {
    secureStorage.delete(key: 'ff_fRNS');
  }

  void addToFRNS(String _value) {
    _fRNS.add(_value);
    secureStorage.setStringList('ff_fRNS', _fRNS);
  }

  void removeFromFRNS(String _value) {
    _fRNS.remove(_value);
    secureStorage.setStringList('ff_fRNS', _fRNS);
  }

  void removeAtIndexFromFRNS(int _index) {
    _fRNS.removeAt(_index);
    secureStorage.setStringList('ff_fRNS', _fRNS);
  }

  String _nickname = '';
  String get nickname => _nickname;
  set nickname(String _value) {
    _nickname = _value;
    secureStorage.setString('ff_nickname', _value);
  }

  void deleteNickname() {
    secureStorage.delete(key: 'ff_nickname');
  }

  int _random1 = 0;
  int get random1 => _random1;
  set random1(int _value) {
    _random1 = _value;
    secureStorage.setInt('ff_random1', _value);
  }

  void deleteRandom1() {
    secureStorage.delete(key: 'ff_random1');
  }

  int _random2 = 0;
  int get random2 => _random2;
  set random2(int _value) {
    _random2 = _value;
    secureStorage.setInt('ff_random2', _value);
  }

  void deleteRandom2() {
    secureStorage.delete(key: 'ff_random2');
  }

  int _isGod = 0;
  int get isGod => _isGod;
  set isGod(int _value) {
    _isGod = _value;
    secureStorage.setInt('ff_isGod', _value);
  }

  void deleteIsGod() {
    secureStorage.delete(key: 'ff_isGod');
  }

  List<int> _mONO = [];
  List<int> get mONO => _mONO;
  set mONO(List<int> _value) {
    _mONO = _value;
    secureStorage.setStringList(
        'ff_mONO', _value.map((x) => x.toString()).toList());
  }

  void deleteMONO() {
    secureStorage.delete(key: 'ff_mONO');
  }

  void addToMONO(int _value) {
    _mONO.add(_value);
    secureStorage.setStringList(
        'ff_mONO', _mONO.map((x) => x.toString()).toList());
  }

  void removeFromMONO(int _value) {
    _mONO.remove(_value);
    secureStorage.setStringList(
        'ff_mONO', _mONO.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromMONO(int _index) {
    _mONO.removeAt(_index);
    secureStorage.setStringList(
        'ff_mONO', _mONO.map((x) => x.toString()).toList());
  }

  List<String> _moNOR = [];
  List<String> get moNOR => _moNOR;
  set moNOR(List<String> _value) {
    _moNOR = _value;
    secureStorage.setStringList('ff_moNOR', _value);
  }

  void deleteMoNOR() {
    secureStorage.delete(key: 'ff_moNOR');
  }

  void addToMoNOR(String _value) {
    _moNOR.add(_value);
    secureStorage.setStringList('ff_moNOR', _moNOR);
  }

  void removeFromMoNOR(String _value) {
    _moNOR.remove(_value);
    secureStorage.setStringList('ff_moNOR', _moNOR);
  }

  void removeAtIndexFromMoNOR(int _index) {
    _moNOR.removeAt(_index);
    secureStorage.setStringList('ff_moNOR', _moNOR);
  }

  int _fL1 = 0;
  int get fL1 => _fL1;
  set fL1(int _value) {
    _fL1 = _value;
    secureStorage.setInt('ff_fL1', _value);
  }

  void deleteFL1() {
    secureStorage.delete(key: 'ff_fL1');
  }

  int _fL2 = 0;
  int get fL2 => _fL2;
  set fL2(int _value) {
    _fL2 = _value;
    secureStorage.setInt('ff_fL2', _value);
  }

  void deleteFL2() {
    secureStorage.delete(key: 'ff_fL2');
  }

  int _fL3 = 0;
  int get fL3 => _fL3;
  set fL3(int _value) {
    _fL3 = _value;
    secureStorage.setInt('ff_fL3', _value);
  }

  void deleteFL3() {
    secureStorage.delete(key: 'ff_fL3');
  }

  int _fL4 = 0;
  int get fL4 => _fL4;
  set fL4(int _value) {
    _fL4 = _value;
    secureStorage.setInt('ff_fL4', _value);
  }

  void deleteFL4() {
    secureStorage.delete(key: 'ff_fL4');
  }

  List<int> _fR = [];
  List<int> get fR => _fR;
  set fR(List<int> _value) {
    _fR = _value;
    secureStorage.setStringList(
        'ff_fR', _value.map((x) => x.toString()).toList());
  }

  void deleteFR() {
    secureStorage.delete(key: 'ff_fR');
  }

  void addToFR(int _value) {
    _fR.add(_value);
    secureStorage.setStringList('ff_fR', _fR.map((x) => x.toString()).toList());
  }

  void removeFromFR(int _value) {
    _fR.remove(_value);
    secureStorage.setStringList('ff_fR', _fR.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromFR(int _index) {
    _fR.removeAt(_index);
    secureStorage.setStringList('ff_fR', _fR.map((x) => x.toString()).toList());
  }

  int _fL1B = 0;
  int get fL1B => _fL1B;
  set fL1B(int _value) {
    _fL1B = _value;
    secureStorage.setInt('ff_fL1B', _value);
  }

  void deleteFL1B() {
    secureStorage.delete(key: 'ff_fL1B');
  }

  int _fL2B = 0;
  int get fL2B => _fL2B;
  set fL2B(int _value) {
    _fL2B = _value;
    secureStorage.setInt('ff_fL2B', _value);
  }

  void deleteFL2B() {
    secureStorage.delete(key: 'ff_fL2B');
  }

  int _fL3B = 0;
  int get fL3B => _fL3B;
  set fL3B(int _value) {
    _fL3B = _value;
    secureStorage.setInt('ff_fL3B', _value);
  }

  void deleteFL3B() {
    secureStorage.delete(key: 'ff_fL3B');
  }

  int _fL4B = 0;
  int get fL4B => _fL4B;
  set fL4B(int _value) {
    _fL4B = _value;
    secureStorage.setInt('ff_fL4B', _value);
  }

  void deleteFL4B() {
    secureStorage.delete(key: 'ff_fL4B');
  }

  List<int> _GR = [];
  List<int> get GR => _GR;
  set GR(List<int> _value) {
    _GR = _value;
    secureStorage.setStringList(
        'ff_GR', _value.map((x) => x.toString()).toList());
  }

  void deleteGR() {
    secureStorage.delete(key: 'ff_GR');
  }

  void addToGR(int _value) {
    _GR.add(_value);
    secureStorage.setStringList('ff_GR', _GR.map((x) => x.toString()).toList());
  }

  void removeFromGR(int _value) {
    _GR.remove(_value);
    secureStorage.setStringList('ff_GR', _GR.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromGR(int _index) {
    _GR.removeAt(_index);
    secureStorage.setStringList('ff_GR', _GR.map((x) => x.toString()).toList());
  }

  int _fG1B = 0;
  int get fG1B => _fG1B;
  set fG1B(int _value) {
    _fG1B = _value;
    secureStorage.setInt('ff_fG1B', _value);
  }

  void deleteFG1B() {
    secureStorage.delete(key: 'ff_fG1B');
  }

  int _fG2B = 0;
  int get fG2B => _fG2B;
  set fG2B(int _value) {
    _fG2B = _value;
    secureStorage.setInt('ff_fG2B', _value);
  }

  void deleteFG2B() {
    secureStorage.delete(key: 'ff_fG2B');
  }

  int _fG3B = 0;
  int get fG3B => _fG3B;
  set fG3B(int _value) {
    _fG3B = _value;
    secureStorage.setInt('ff_fG3B', _value);
  }

  void deleteFG3B() {
    secureStorage.delete(key: 'ff_fG3B');
  }

  int _fG4B = 0;
  int get fG4B => _fG4B;
  set fG4B(int _value) {
    _fG4B = _value;
    secureStorage.setInt('ff_fG4B', _value);
  }

  void deleteFG4B() {
    secureStorage.delete(key: 'ff_fG4B');
  }

  String _wordTemp = '';
  String get wordTemp => _wordTemp;
  set wordTemp(String _value) {
    _wordTemp = _value;
    secureStorage.setString('ff_wordTemp', _value);
  }

  void deleteWordTemp() {
    secureStorage.delete(key: 'ff_wordTemp');
  }

  int _payed = 0;
  int get payed => _payed;
  set payed(int _value) {
    _payed = _value;
    secureStorage.setInt('ff_payed', _value);
  }

  void deletePayed() {
    secureStorage.delete(key: 'ff_payed');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
