'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "07efec4482152d4679edefe5a7ffba34",
"assets/AssetManifest.bin.json": "c7a0d934dce56521e6b1cbb1805bc7a8",
"assets/AssetManifest.json": "7161817c6a672515b2c70faa3fef5384",
"assets/FontManifest.json": "66375ba3256f03e3c6f45371f8c7c704",
"assets/fonts/Anjoman-Black.ttf": "6afd62f1c618671872e349892854e390",
"assets/fonts/Anjoman-Bold.ttf": "833ff965237b53f0a3b8eedd2a2d289b",
"assets/fonts/Anjoman-ExtraBold.ttf": "b52786ebd0db0841171231143472945e",
"assets/fonts/Anjoman-ExtraLight.ttf": "3d92f29b1493998076cb8fe84e1209c4",
"assets/fonts/Anjoman-Light.ttf": "8a578c846795bea072a02dc56af95bd4",
"assets/fonts/Anjoman-Medium.ttf": "cbbb58bc613076b4ae5ba6575c3c5d96",
"assets/fonts/Anjoman-Regular.ttf": "495a9397120d1e28e15b5958d0c6344e",
"assets/fonts/Anjoman-SemiBold.ttf": "584e0990bd45e72c20b36062936f3af8",
"assets/fonts/Anjoman-UltraBold.ttf": "16a8daa553b920a5228703d04939ecca",
"assets/fonts/MaterialIcons-Regular.otf": "2aaf4b05eefd2ad0ea6df86b5c82c152",
"assets/fonts/MaterialIcons-Regular.ttf": "4e85bc9ebe07e0340c9c4fc2f6c38908",
"assets/images/azole.png": "09fbbbc0d0a5e31403d6667cf6590d37",
"assets/images/background.png": "661a38595a8389ebdd577e4123cd0030",
"assets/images/background2.png": "36566d37df416eaaadac4aea114d9468",
"assets/images/calories.jpg": "962afbcb559d8a4046a3f0b2400147a3",
"assets/images/dumble.png": "242250627ad9af73e8f144b7e051eb18",
"assets/images/fitnes.png": "748c53c6904071e7c407e79183cfecb1",
"assets/images/food.png": "f1ccb04ec5fb97914d3c1fd016b2514a",
"assets/images/gym.png": "a8970a13b8164fcbcb5d01a66eb644d8",
"assets/images/havazi.webp": "5481cc09a475aa2ae564f2a3e9565134",
"assets/images/instagram.png": "5efd7bca33cb8c3354c6216b3cbdccc3",
"assets/images/jolobazoo.jpg": "748be9b1a8d93a0816f248a58e03e8f0",
"assets/images/jolopa.jpg": "0a8493d45e359c6593b703f69b01a005",
"assets/images/kool.jpg": "63f50954cbe0e06942e4145061afb8ba",
"assets/images/logo.png": "c23c0cd0280c9dd624c821c935fb8167",
"assets/images/logotype.png": "903fa5063c3a55478140683b43c52978",
"assets/images/manage.png": "a9672ef1f94e48dd8aa0ddce5f7b7732",
"assets/images/pahloo.jpg": "65ce166a20efcc8552783dbfb34f550d",
"assets/images/pdf.jpg": "56d6f3f0972c7e1ad281a3e69c3571d1",
"assets/images/place.png": "03aa2fa1366a31d59ae6789d6c1b3987",
"assets/images/poshtbazoo.jpg": "0a36dafcab85a0f6bc9730db9a8caed6",
"assets/images/poshtpa.jpg": "48368520dd490b527e037fd562437366",
"assets/images/render-min.png": "1bce77304ff601b53b7eeffd03d3f653",
"assets/images/saeed.jpg": "1033d265048151cdfaa6ce6bf04894f1",
"assets/images/saq.jpg": "e007109a0d3441d183665bd6d60a0aa5",
"assets/images/sarshoone.jpg": "9f261f073c89dc05e7550b6f021375b6",
"assets/images/shahabbg.png": "50728c6011e517718535d98fd7e801fe",
"assets/images/shekam.jpg": "9daf336611c4d550f6270568166cbea7",
"assets/images/sine.jpg": "c8d41b15b177dca290c6563742d1caef",
"assets/images/splash.jpg": "31bfee96109fcd5450b81758e2024c93",
"assets/images/splash.png": "0f317086dc691cd84666fbb0522ea875",
"assets/images/telegram.png": "106eeeb7ec745cef1dca305cf6235f44",
"assets/images/zirbaqal.jpg": "57a6e04718d4de4b8683932ebbe8a710",
"assets/NOTICES": "823c8c806fe8aec37fe4e85dd1bd64b9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/web/assets/fonts/Anjoman-Black.ttf": "6afd62f1c618671872e349892854e390",
"assets/web/assets/fonts/Anjoman-Bold.ttf": "833ff965237b53f0a3b8eedd2a2d289b",
"assets/web/assets/fonts/Anjoman-ExtraBold.ttf": "b52786ebd0db0841171231143472945e",
"assets/web/assets/fonts/Anjoman-ExtraLight.ttf": "3d92f29b1493998076cb8fe84e1209c4",
"assets/web/assets/fonts/Anjoman-Light.ttf": "8a578c846795bea072a02dc56af95bd4",
"assets/web/assets/fonts/Anjoman-Medium.ttf": "cbbb58bc613076b4ae5ba6575c3c5d96",
"assets/web/assets/fonts/Anjoman-Regular.ttf": "495a9397120d1e28e15b5958d0c6344e",
"assets/web/assets/fonts/Anjoman-SemiBold.ttf": "584e0990bd45e72c20b36062936f3af8",
"assets/web/assets/fonts/Anjoman-UltraBold.ttf": "16a8daa553b920a5228703d04939ecca",
"auth.js": "1d1df90d2bb379893a14be462168c455",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "c8af057465ec048a698965b34706797d",
"index.html": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"/": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "8f77d758b9b555d221bb128fef0e0344",
"main.dart.js_1.part.js": "5e163b69d24fc78cbcd24e7669723574",
"main.dart.js_10.part.js": "4030d9edac950fd5f4b932ddae97223f",
"main.dart.js_100.part.js": "a2636b74feb67150d14037079cf56325",
"main.dart.js_101.part.js": "cc0cf2043bbab481371e5c8513a71742",
"main.dart.js_102.part.js": "2ddc33c79c0b1055b215c25206511d29",
"main.dart.js_103.part.js": "e2ca0c803daae1c71d5057665beef1d3",
"main.dart.js_104.part.js": "b9df102b17fa0a571e2870fbf2d18ebe",
"main.dart.js_105.part.js": "5026e401b163989663639db126cd6214",
"main.dart.js_106.part.js": "cbb2dfca3eb1d865557b0a927cfd3b34",
"main.dart.js_107.part.js": "9685b25d902cb5c336661211488cf1e2",
"main.dart.js_108.part.js": "f99043999cffe149a33bb6631c545027",
"main.dart.js_109.part.js": "5620b8c1ea288c60fb46704a8d9ceffc",
"main.dart.js_11.part.js": "a1c609f3f571e20c8c1399c09b0d6590",
"main.dart.js_110.part.js": "479d7fbe9f1cfb5d1da1f2e4053da899",
"main.dart.js_111.part.js": "f5ac3c76506dffd62f125f93edf0794f",
"main.dart.js_112.part.js": "bb6e05d60e9aa1d265c5cfa3071abae1",
"main.dart.js_113.part.js": "622afb69ee856c84d85a5fd8d5356032",
"main.dart.js_114.part.js": "62a56ddbd841ba874dff06e0499bbc9e",
"main.dart.js_115.part.js": "615356a8b4b46d2e335adb8a7d309360",
"main.dart.js_116.part.js": "1364664630fc2101a008bba602a3bc4f",
"main.dart.js_117.part.js": "2b492f3f4f03f6b84404f3fea428d6d7",
"main.dart.js_118.part.js": "74d791b6ab3fee96b8571b0866be5069",
"main.dart.js_119.part.js": "23b0d2ab262de508476d41d4229c141e",
"main.dart.js_12.part.js": "6f19295c0e4af179c15b939a3fec3dc4",
"main.dart.js_120.part.js": "e7ccbe53a99a9a3c0fee0310b1f087c9",
"main.dart.js_121.part.js": "1641b119a66bf3efd28e8b369c93ada0",
"main.dart.js_122.part.js": "2bb4a47463fee5eb5cdf1869a4cab09c",
"main.dart.js_123.part.js": "cb254568b1d2775896225f8515ba343b",
"main.dart.js_124.part.js": "1114cd860d55ed95c6a929cb3396920c",
"main.dart.js_125.part.js": "e929dc3a0a4a85001045c4ede2c7425f",
"main.dart.js_126.part.js": "1623d416720ab28c269f2870dfb30b2a",
"main.dart.js_127.part.js": "717181197d50309a70e978970c869385",
"main.dart.js_128.part.js": "81e49cf9163d43dc6a517ec9e122c697",
"main.dart.js_129.part.js": "ce3accd87b1ae57dd3166d543f1a0ff5",
"main.dart.js_13.part.js": "65fb7bc03cf0a14ebb2587124b5e33f0",
"main.dart.js_130.part.js": "51539b9ee10d83945b9e8c6aa0a1d3c4",
"main.dart.js_131.part.js": "da144be2a52006e16e2431d00ea57111",
"main.dart.js_132.part.js": "63513baf3e2b8fc2475e47ba4236439c",
"main.dart.js_133.part.js": "651af698956b19deedb3b468019e7268",
"main.dart.js_134.part.js": "50d7637afc925555d3348c04e02aac43",
"main.dart.js_135.part.js": "9bbc3515a83f469b21b04c7a00288c77",
"main.dart.js_136.part.js": "927e317ca22f60b16283c1b8443ddf6a",
"main.dart.js_137.part.js": "a8850f8e37bc984aec7f3d3a8d727044",
"main.dart.js_138.part.js": "aa2a7eec4443d0b612ff68fe7b2f0460",
"main.dart.js_139.part.js": "d9f6152926e81e0081a3dc0e91249f66",
"main.dart.js_14.part.js": "3e93f27c4abb8f0af905f8afc98b89d8",
"main.dart.js_140.part.js": "9004894780ca220b87e0a7bdae5dc84f",
"main.dart.js_141.part.js": "c15f914577b6f816690fc5a517c13967",
"main.dart.js_142.part.js": "b047216136b1ac3cb03e065bfdd810d2",
"main.dart.js_143.part.js": "05309fc6b2fb7bf0d1a68baf2408c016",
"main.dart.js_144.part.js": "34eda854415d7c08023a5627c4b8a313",
"main.dart.js_145.part.js": "09e926ca6a8e6b79ea65b6e02672caaf",
"main.dart.js_146.part.js": "9c3254804da6377fc8996159cc971c18",
"main.dart.js_147.part.js": "784055ae5479a81702fa08c28af3288e",
"main.dart.js_148.part.js": "e72c0a261a8774392000d2bff5a0b9db",
"main.dart.js_149.part.js": "f9e59e6125f11041d193c02c0070d282",
"main.dart.js_15.part.js": "c7c86f26bbfdf2ae805060e141f9e082",
"main.dart.js_150.part.js": "bbe8f451d3ebe0c248e15db861e91fdf",
"main.dart.js_151.part.js": "1cbc9902888c586b75fc42cea59dcc92",
"main.dart.js_152.part.js": "da9c79885c5a2e7c189869c2a6def301",
"main.dart.js_153.part.js": "95505206eed1216c88428644961061f6",
"main.dart.js_154.part.js": "c783cea80ea240a9dc5eeef2cf44a148",
"main.dart.js_155.part.js": "50a56c86ad463a1a3615398b2c1616a4",
"main.dart.js_156.part.js": "c6e9cddf630ba352812e7af5d2f161ec",
"main.dart.js_157.part.js": "4dcfe61f88dd9056a7b8460d6f2b4ee3",
"main.dart.js_158.part.js": "350b6b36ff863bdfc21553b586965fb3",
"main.dart.js_16.part.js": "639101d38e844046a8c2a1ce2d8e1df0",
"main.dart.js_17.part.js": "9d7844dba7ba75a486344a3bda17908b",
"main.dart.js_18.part.js": "bee870726c92d86b9e3c533dd4e5c475",
"main.dart.js_19.part.js": "cc083bf2e7a2d58994f9c1b8a0f28d50",
"main.dart.js_2.part.js": "9363e04d002951cb32de42fdfe0f2337",
"main.dart.js_20.part.js": "3efa6639e1e62d26cafb395d98994e30",
"main.dart.js_21.part.js": "85eab511756ae7052635c2dc010790e4",
"main.dart.js_22.part.js": "fe2ddf8c4a6094294c2408d5da8e814b",
"main.dart.js_23.part.js": "b5b5a4bfc27f0eec92b79a1916446307",
"main.dart.js_24.part.js": "f4d8f35f57ff5a26e2de488aa9d078fa",
"main.dart.js_25.part.js": "6f3edd9b060b416d6a0df621d30a04de",
"main.dart.js_26.part.js": "7da7d8366bab8f39f240b6c10d25d66a",
"main.dart.js_27.part.js": "ade58dc1d1850f1f62eff9f74b17e9b0",
"main.dart.js_28.part.js": "600b25ffabbc9cf1c206712b81acb1f2",
"main.dart.js_29.part.js": "2af4b82dc5246d2c6f0cc05fca4e97e9",
"main.dart.js_30.part.js": "f48da587396837477c78418d94afe93b",
"main.dart.js_31.part.js": "720effda2fc1269028e39f82e77fd634",
"main.dart.js_32.part.js": "260fcba79997d057da6b864e1ddb19f0",
"main.dart.js_33.part.js": "7b0e7c8d852ac807525b83d1ebd0b13d",
"main.dart.js_34.part.js": "fe8604c2e709c516c7919f01687d92a4",
"main.dart.js_35.part.js": "2b76949b2f7e4c5717e01c615da493ca",
"main.dart.js_36.part.js": "d52b2624db734a69367429a2cf2cd61d",
"main.dart.js_37.part.js": "e86674f5e1aa7bffd61908d150453392",
"main.dart.js_38.part.js": "e2179ff6f7d3b706cba2e8d5462442fb",
"main.dart.js_39.part.js": "1759fc6890e892cfc628f00f9676803d",
"main.dart.js_40.part.js": "9f6594a001ff93677b5655050f84a923",
"main.dart.js_41.part.js": "30a7fe4c5b061a676dec6b09672b79a0",
"main.dart.js_42.part.js": "599e510ef4ea1a0758f3d29589e15611",
"main.dart.js_43.part.js": "5597d18d30a66ea721806107719312da",
"main.dart.js_44.part.js": "51f278b3041af8665ecd2d537851afad",
"main.dart.js_45.part.js": "d43bc68737d3b423ba25eb1355bccaae",
"main.dart.js_46.part.js": "9588cd70a5dd5433088d5ae95ae55004",
"main.dart.js_47.part.js": "58718e6c327e0d542ace1c9d34bfbd37",
"main.dart.js_48.part.js": "cd3cf0d8f475d8f65f8c937ea6dea601",
"main.dart.js_49.part.js": "9f0a36a282925c1905e3d2b06b7fce96",
"main.dart.js_50.part.js": "1122e991007a4a5d03bc3b4ea5913652",
"main.dart.js_51.part.js": "a20c609a2c97e8244c389e36045846d1",
"main.dart.js_52.part.js": "c78f2fb6bd6e4b36be34fdf95086caaf",
"main.dart.js_53.part.js": "d1e0af58426307e6b313448384f8f0df",
"main.dart.js_54.part.js": "0b4a4aea4ee382f946156d00a2921c75",
"main.dart.js_55.part.js": "c229158eda8ae837146fe8adad847ddb",
"main.dart.js_56.part.js": "5a6af003ada7241de8230c2ea839947e",
"main.dart.js_57.part.js": "bb64853621749f387f05da408996c846",
"main.dart.js_58.part.js": "0fa83dd553394c88d5f523e6f0771662",
"main.dart.js_59.part.js": "e325d3b440ed4b1a1c016f89ef2af383",
"main.dart.js_60.part.js": "a505954e3b54da754b40a15297777b31",
"main.dart.js_61.part.js": "cba75dc90eaef4fa2bee5017a3c12c34",
"main.dart.js_62.part.js": "b863ef108d6837f175d036374270ea59",
"main.dart.js_63.part.js": "6c07dc97befa38658b11fbfbd3ada459",
"main.dart.js_64.part.js": "ba265bed63c876526a8e2e33cd392158",
"main.dart.js_65.part.js": "0fb727a1cb3dbea2718f0e83631a2d57",
"main.dart.js_66.part.js": "8f65ba86cf96b58c05c3a6047d4c6a73",
"main.dart.js_67.part.js": "49cf6b6a63fdee4992555038e85d838e",
"main.dart.js_68.part.js": "18af5503630b808d56ab56f69b13ea18",
"main.dart.js_69.part.js": "5babed759ffacb763476ebb875d915aa",
"main.dart.js_70.part.js": "1b79c833e35504dfd1f5c22d2be9d61b",
"main.dart.js_71.part.js": "ad4cf0138212c41d02ee9ace459689a5",
"main.dart.js_72.part.js": "60fbb5f7eca6a83b980269759129bdf9",
"main.dart.js_73.part.js": "216bc8cfaccb496e7b921642e4141456",
"main.dart.js_74.part.js": "5eb3c4a70cca906b933093bf05d14e92",
"main.dart.js_75.part.js": "c0af320a538cbc6959cd257805b7571f",
"main.dart.js_76.part.js": "c009022c7824b73095f07aeab223cd89",
"main.dart.js_77.part.js": "0323f3bbb5aceba485d86b7f636d2d53",
"main.dart.js_78.part.js": "95056a3345194f1cdbfa3908aab4455c",
"main.dart.js_79.part.js": "c589e3e1c1398164918267c8a9106601",
"main.dart.js_8.part.js": "aca535a280686bcc2f7e3aa78a208b76",
"main.dart.js_80.part.js": "1449cc0d9e3b620b6dac267cb8c6e583",
"main.dart.js_81.part.js": "0eb28cbeeb53e9265863285069113db2",
"main.dart.js_82.part.js": "8e95e6234563068d5c289480a7b98e98",
"main.dart.js_83.part.js": "d0a989ed066428908bb2995fbaf566df",
"main.dart.js_84.part.js": "050f02684fd284dbd10d38f05879abbd",
"main.dart.js_85.part.js": "780c96d187c5a7fd7e32d73b6456261b",
"main.dart.js_86.part.js": "3c8b2d27805c5b4ac446bc30fc1cf16a",
"main.dart.js_87.part.js": "39883bcf22ce185afaec01afb97dd0d3",
"main.dart.js_88.part.js": "141c5f5ca35d5f152419a81da5346486",
"main.dart.js_89.part.js": "191189b1c754cb8a0d11b53d5c1c12cc",
"main.dart.js_90.part.js": "e6168c91b050d6902e7ff7c260476979",
"main.dart.js_91.part.js": "5422ce4eda845ed7ab6e218f93b84709",
"main.dart.js_92.part.js": "a088c76759f4ca2c1ba73fa8f9fa1a03",
"main.dart.js_93.part.js": "b3b726851fa18d17f11b3f803c574f80",
"main.dart.js_94.part.js": "f0fcb69d694ecc451b754f3ac446f93a",
"main.dart.js_95.part.js": "da613ebcbd72c6a5e04403226b18181f",
"main.dart.js_96.part.js": "9cb189f0f07dca65fb0b6ceb7ed4b130",
"main.dart.js_97.part.js": "669afb7177279781e02ecc4d5088510c",
"main.dart.js_98.part.js": "8e9e62fbd18386849e14aa508f25cbd8",
"main.dart.js_99.part.js": "4192d52dbaabc84ec62560d66fc312e5",
"manifest.json": "6dcedccaee5b39c99f8ac5f2020acf95",
"version.json": "8a1b4594ef7492e0e8b4c40f046bef6b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
