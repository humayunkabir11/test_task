import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../di/init_dependencies.dart';
import '../storage/secure_keys.dart';
import '../storage/secure_storage_service.dart';
import '../utils/dev_log.dart';

class SocketService {
  IO.Socket? _socket;
  final StreamController<dynamic> _messageController =
      StreamController<dynamic>.broadcast();

  Stream<dynamic> get messages => _messageController.stream;

  Future<void> connect(String url) async {
    try {
      final token = await sl<SecureStorageService>().read(
        SecureKeys.accessToken,
      );

      // Socket.io initialization
      _socket = IO.io(
        url,
        IO.OptionBuilder()
            .setTransports(['websocket']) // Forces websocket transport
            // If your backend uses the newer 'auth' object:
            .setAuth({'token': '$token'})
            .enableAutoConnect()
            .build(),
      );

      _setupListeners();
    } catch (e) {
      _messageController.addError(e);
    }
  }

  void _setupListeners() {
    _socket?.onConnect((_) {
      print('✅ Connected to Socket.io');
    });

    _socket?.onConnectError((data) {
      print('❌ Connection Error: $data');
      _messageController.addError(data);
    });

    /*debug_rooms ,

    message_sent ,
    `join_chat ,

    chat_list_update,

    new_message*/

    // Listen to a specific event (Socket.io is event-based)
    _socket?.on('debug_rooms', (data) {
      devLog(tag: "IO-LISTENER", payload: {"debug_rom": "$data"});
      _messageController.add(data);
    });

    //message_sent
    _socket?.on('message_sent', (data) {
      devLog(tag: "IO-LISTENER", payload: {"message_sent": "$data"});
      _messageController.add(data);
    });

    //join_chat
    _socket?.on('join_chat', (data) {
      devLog(tag: "IO-LISTENER", payload: {"join_chat": "$data"});
      _messageController.add(data);
    });

    //chat_list_update
    _socket?.on('chat_list_update', (data) {
      devLog(tag: "IO-LISTENER", payload: {"chat_list_update": "$data"});
      _messageController.add(data);
    });

    //new_message
    _socket?.on('new_message', (data) {
      devLog(tag: "IO-LISTENER", payload: {"new_message": "$data"});
      _messageController.add(data);
    });

    _socket?.onDisconnect((_) => print('Disconnected'));
  }

  void emit(String event, dynamic data) {
    _socket?.emit(event, data);
  }

  void dispose() {
    _socket?.dispose();
    _messageController.close();
  }
}
