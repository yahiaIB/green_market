import '../utils/preference_utils.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../config/config.dart';


class SocketManager {
  IO.Socket socketInstance;
  static SocketManager _instance;

  static SocketManager getInstance() {
    if (_instance == null) {
      _instance = new SocketManager._();
    }
    if (_instance.socketInstance == null) {
      _instance.init();
    }
    return _instance;
  }

  SocketManager._() {}

  void init() {
    PreferenceUtils pref = PreferenceUtils.getInstance();
    var userId = pref.getData(PreferenceUtils.UserId);
    var token = pref.getData(PreferenceUtils.UserToken);
    if (userId == null) {
      return;
    }
    var url =
        '${Configuration.config['socketUrl']}?authorization=${token}id--$userId';
    socketInstance = IO.io(url, <String, dynamic>{
      'transports': ['websocket'],
      'path': '/io',
    });
    socketInstance.on('error', (error) {
      print('error');
      print(error);
    });
    socketInstance.on('disconnect', (data) {
      print("Disconnet");
      print(data.toString());
    });
    socketInstance.connect();
  }

  void subscribe(String roomId, {type}) {
    try {
      if (_instance.socketInstance == null) {
        this.init();
      }
      if (!socketInstance.connected) {
        print("Socket is not connected, connect again");
        socketInstance.connect();
      }
      var data = {"room": roomId};
      if (type != null) data['type'] = type;
      socketInstance.emit(
        'subscribe',
        data
      );
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void unsubscribe(roomId) {
    this.socketInstance.emit('unsubscribe', {"room": roomId});
  }
}
