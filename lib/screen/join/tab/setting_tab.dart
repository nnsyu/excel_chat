import 'dart:html' as html;

import 'package:excel_chat/main.dart';
import 'package:excel_chat/providers/lock_image_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final lockImageProvider = NotifierProvider<LockImageNotifier, LockImage>(() {
//   return LockImageNotifier();
// });

class SettingTab extends ConsumerStatefulWidget {
  const SettingTab({super.key});

  @override
  ConsumerState<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends ConsumerState<SettingTab> {

  saveBinary(String binary) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('lock_binary', binary);
  }

  saveUrl(String url) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('lock_url', url);
  }

  Future<LockImage> loadUrl() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String url = pref.getString('lock_url') ?? '';
    String binary = pref.getString('lock_binary') ?? '';
    return LockImage(url: url, binary: binary);
  }

  selectLockImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      final bytes = result.files.single.bytes;
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      String binary = String.fromCharCodes(bytes!);
      ref.read(lockImageProvider.notifier).updateInfo(url, binary);
      ref.read(lockImageProvider.notifier).updateIsChange(true);
      print('에우지1 ${ref.read(lockImageProvider.notifier).getIsChange()}');
      saveUrl(url);
      saveBinary(binary);
    }
  }


  @override
  void initState() {
    //ref.read(lockImageProvider.notifier).updateIsChange(false);

    Future<LockImage> info = loadUrl();
    info.then((value) {
      setState(() {
        ref.read(lockImageProvider.notifier).updateInfo(value.url, value.binary);
      });
      //print('info : ${value.url} , ${value.binary}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final LockImage lockImage = ref.watch(lockImageProvider);

    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '설정',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "잠금이미지 설정",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Text(
                      lockImage.url,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: selectLockImage,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Text(
                        '이미지 불러오기',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
