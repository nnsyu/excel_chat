import 'dart:html' as html;

import 'package:excel_chat/providers/lock_image_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lockImageProvider = NotifierProvider<LockImageNotifier, LockImage>(() {
  return LockImageNotifier();
});

class SettingTab extends ConsumerStatefulWidget {
  const SettingTab({super.key});

  // Future selectLockImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
  //
  //   if(result != null) {
  //     final bytes = result.files.first.bytes;
  //     final blob = html.Blob([bytes]);
  //     final url = html.Url.createObjectUrlFromBlob(blob);
  //
  //   }
  // }

  @override
  ConsumerState<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends ConsumerState<SettingTab> {
@override
  Widget build(BuildContext context) {


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
                    child: Text(ref.read(lockImageProvider.notifier).getUrl(), style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

                    if(result != null) {
                      final bytes = result.files.first.bytes;
                      final blob = html.Blob([bytes]);
                      final url = html.Url.createObjectUrlFromBlob(blob);

                      ref.read(lockImageProvider.notifier).updateUrl(url);
                    }
                  },
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
