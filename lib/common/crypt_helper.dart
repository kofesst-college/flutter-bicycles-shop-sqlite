import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

abstract class CryptHelper {
  static const String _key = "pandapovpandapovpandapovpandapov";

  static String encrypt(String value) {
    final cipherKey = Key.fromUtf8(_key);
    final service = Encrypter(AES(cipherKey, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(_key.substring(0, 16));

    return service.encrypt(value, iv: initVector).base64;
  }

  static String decrypt(String value) {
    final cipherKey = Key.fromUtf8(_key);
    final service = Encrypter(AES(cipherKey, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(_key.substring(0, 16));
    final encrypted = Encrypted(Uint8List.fromList(value.codeUnits));

    return service.decrypt(encrypted, iv: initVector);
  }
}
