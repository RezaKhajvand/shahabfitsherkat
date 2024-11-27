import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/OldVersion/hivemodel/shagerd/shagerd.dart';
import 'package:shahabfit/main.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Future<String> getVersion() async {
    var resault = await Future.wait([
      PackageInfo.fromPlatform(),
      shorebirdCodePush.currentPatchNumber(),
    ]);
    final PackageInfo packageInfo = resault.first as PackageInfo;
    final int? patchNumber = resault.last as int?;
    return 'Version : ${packageInfo.version}  ${patchNumber ?? 'No Patch'}';
  }

  @override
  Widget build(BuildContext context) {
    final String? location = GoRouterState.of(context).path;
    return SafeArea(
      child: Drawer(
        backgroundColor: background,
        elevation: 0,
        width: 240,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text("شهاب حسینی"),
                    const SizedBox(height: 6),
                    Text("ShahabHoseini",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            getDrawerItem(
              title: "برنامه تمرین",
              icon: Icons.pause_presentation,
              isActive: location == activitiesPage,
              onTap: () => context.pushReplacement(activitiesPage),
              context: context,
            ),
            const SizedBox(height: 10),
            getDrawerItem(
              title: "لیست برنامه ها",
              icon: Icons.shopping_basket_outlined,
              isActive: location == basketListPage,
              onTap: () => context.pushReplacement(basketListPage),
              context: context,
            ),
            const SizedBox(height: 10),
            getDrawerItem(
              title: "لیست سیستم ها",
              icon: Icons.sports_outlined,
              isActive: location == systemPage,
              onTap: () => context.pushReplacement(systemPage),
              context: context,
            ),
            const Spacer(),
            FutureBuilder(
              future: getVersion(),
              builder: (context, snapshot) => Text(
                snapshot.data.toString(),
                textDirection: TextDirection.ltr,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: primary),
                    onPressed: () async {
                      AndroidDeviceInfo deviceInfo =
                          await DeviceInfoPlugin().androidInfo;
                      int sdkversion = deviceInfo.version.sdkInt;
                      print(sdkversion);
                      if (sdkversion > 29) {
                        if (await Permission.photos.request().isGranted) {
                          getBackup(context);
                        }
                      } else {
                        if (await Permission.storage.request().isGranted) {
                          getBackup(context);
                        }
                      }
                    },
                    child: const Text('تهیه بکاپ')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: primary),
                    onPressed: () => restoreBackup(context),
                    child: const Text('بارگذاری بکاپ')),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Padding getDrawerItem({
  required final String title,
  required final IconData icon,
  required bool isActive,
  required BuildContext context,
  void Function()? onTap,
}) {
  Color listTileColor = !isActive ? Colors.white : Colors.black;
  return Padding(
    padding: const EdgeInsets.only(left: 30),
    child: Stack(
      alignment: Alignment.center,
      children: [
        isActive
            ? Container(
                height: 55,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: primary, borderRadius: oneSideBorderRadius),
              )
            : const SizedBox(),
        ListTile(
          shape:
              const RoundedRectangleBorder(borderRadius: oneSideBorderRadius),
          textColor: listTileColor,
          iconColor: listTileColor,
          titleTextStyle: Theme.of(context).textTheme.labelSmall,
          leading: Icon(icon),
          title: Text(title),
          onTap: onTap,
        ),
      ],
    ),
  );
}

getBackup(BuildContext context) async {
  var shagerdbox = Hive.box<HiveShagerd>('shagerdbox');
  try {
    const String folderName = "shahabfit";
    const String path = "storage/emulated/0/$folderName";
    await Directory(path).create();
    File backupFile = File('$path/${DateTime.now().hashCode}.json');
    Map<String, dynamic> map =
        shagerdbox.toMap().map((key, value) => MapEntry(key.toString(), value));
    String json = jsonEncode(map);
    backupFile = await backupFile.writeAsString(json);
    Scaffold.of(context).closeDrawer();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: primary,
        content: Text(
          'بکاپ با موفقیت ذخیره شد',
          style: TextStyle(color: Colors.black),
        )));
  } catch (e) {
    print(e);
    Scaffold.of(context).closeDrawer();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          e.toString(),
          style: const TextStyle(color: Colors.black),
        )));
  }
}

restoreBackup(BuildContext context) async {
  var shagerdbox = Hive.box<HiveShagerd>('shagerdbox');
  try {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (file != null) {
      shagerdbox.clear();
      File files = File(file.files.single.path.toString());
      Map<String, dynamic> map = jsonDecode(await files.readAsString());
      for (var i = 0; i < map.length; i++) {
        HiveShagerd shagerd = HiveShagerd.fromJson(map.values.toList()[i]);
        shagerdbox.put(shagerd.id, shagerd);
        print('puted');
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: primary,
        content: Text(
          'بکاپ با موفقیت بارگذاری شد',
          style: TextStyle(color: Colors.black),
        )));
  } catch (e) {
    Scaffold.of(context).closeDrawer();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          e.toString(),
          style: const TextStyle(color: Colors.black),
        )));
  }
}
