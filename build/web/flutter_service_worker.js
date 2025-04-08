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
"assets/fonts/MaterialIcons-Regular.otf": "347151c60a1f06b392304c8751d35e46",
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
"auth.js": "5352f378b032984b2ef5ead3d0295ad3",
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
"flutter_bootstrap.js": "f8a2428ae60a034008edabb60b6c19ab",
"index.html": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"/": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "beb76b75b2e90f77b70c91e1bc68e8da",
"main.dart.js_1.part.js": "a70ef2967312bbbf27eabcda822b8f6f",
"main.dart.js_10.part.js": "7b89159c2de5fbf219fdf98feb43962b",
"main.dart.js_100.part.js": "cc30d924e3f62b3bea6aeea489f74481",
"main.dart.js_101.part.js": "dfbbeaff2e05ef9d93dd10891ed45136",
"main.dart.js_102.part.js": "da9e5f1d8aabb33575d0b6ea981d9064",
"main.dart.js_103.part.js": "6e1d9cce410efb0c4a64182c2a50a434",
"main.dart.js_104.part.js": "b9df102b17fa0a571e2870fbf2d18ebe",
"main.dart.js_105.part.js": "d8896a5a8af6c295c47dee72ea0c1936",
"main.dart.js_106.part.js": "3a4a812ce79bcaa4939fb7605cc22268",
"main.dart.js_107.part.js": "336abfcb8250820e052cc2f856befe2f",
"main.dart.js_108.part.js": "34dbf0726465666c9c9c2408d2f8917f",
"main.dart.js_109.part.js": "096bc4258c1d6a0c019e97399073c8ae",
"main.dart.js_11.part.js": "367ae562a9213b159f5af976cefa689a",
"main.dart.js_110.part.js": "717deba1c3c53bf62600e0382d72f94a",
"main.dart.js_111.part.js": "f5ac3c76506dffd62f125f93edf0794f",
"main.dart.js_112.part.js": "b81e4d19d841d404932d8c713df23539",
"main.dart.js_113.part.js": "4b2a42c42ab63526d5426815565c633c",
"main.dart.js_114.part.js": "2ce7dd1f2706ab14279de473c0fc5c1e",
"main.dart.js_115.part.js": "addaa294b8a5e41fc39f0fe18efcf646",
"main.dart.js_116.part.js": "78b3f4e85f4f9d657a06af11ddba7f37",
"main.dart.js_117.part.js": "ff1b751d2a0d5a5e66caad262dc92079",
"main.dart.js_118.part.js": "1358caed0a7b8a4b5a063a6954a78c83",
"main.dart.js_119.part.js": "f901c30f755a0c140928c17a98331258",
"main.dart.js_12.part.js": "bf71eb96079912d70f000a36690a3c10",
"main.dart.js_120.part.js": "3ebb7efa02c16d519a360705c3b35a59",
"main.dart.js_121.part.js": "513b97abb70b87435662292aba3af79c",
"main.dart.js_122.part.js": "2bb4a47463fee5eb5cdf1869a4cab09c",
"main.dart.js_123.part.js": "e709b3c28bf0834b1b4c10689d6165e6",
"main.dart.js_124.part.js": "0a48d3fa7df3418141a4e74ffe52b298",
"main.dart.js_125.part.js": "94d49cf842978dac453c251749a83e16",
"main.dart.js_126.part.js": "1623d416720ab28c269f2870dfb30b2a",
"main.dart.js_127.part.js": "717181197d50309a70e978970c869385",
"main.dart.js_128.part.js": "be00c213735311c5bfbf57c3a48f2ac8",
"main.dart.js_129.part.js": "c64a6c59d1dff2c16716dbce6549382a",
"main.dart.js_13.part.js": "81f3f64b637dc83e9f7c1fb2c4972f35",
"main.dart.js_130.part.js": "51539b9ee10d83945b9e8c6aa0a1d3c4",
"main.dart.js_131.part.js": "467e4f7de1456fe89da2ea02a0243952",
"main.dart.js_132.part.js": "59fbe2ff8b33ef9e96e728ed8ddc0a5e",
"main.dart.js_133.part.js": "552393dbb685bcdc36c53cd77f92dd4a",
"main.dart.js_134.part.js": "d44f3a9a279f5fbbcb1184df215fa79c",
"main.dart.js_135.part.js": "ac26aa1049b52dd4e104e81ed7cf2615",
"main.dart.js_136.part.js": "77968b584e21f441766bf96909800c4d",
"main.dart.js_137.part.js": "6b359f6ef994642516b6a0ecbd20a08c",
"main.dart.js_138.part.js": "aa2a7eec4443d0b612ff68fe7b2f0460",
"main.dart.js_139.part.js": "573685bc9086da0518b5bfc88e63a026",
"main.dart.js_14.part.js": "6234dfddd667cf8902cbb20088427856",
"main.dart.js_140.part.js": "3a0913fa777078aea7e1ec44f033f611",
"main.dart.js_141.part.js": "c15f914577b6f816690fc5a517c13967",
"main.dart.js_142.part.js": "6b2129035bda410f491d42a2ed74fa53",
"main.dart.js_143.part.js": "cb0f1723fb438f217625675393153281",
"main.dart.js_144.part.js": "0f040f478208160ef6dd6b187db8e70f",
"main.dart.js_145.part.js": "09e926ca6a8e6b79ea65b6e02672caaf",
"main.dart.js_146.part.js": "02898f02babd80b61d71021d2bd6a59c",
"main.dart.js_147.part.js": "8f66134901d3c2734c63a22ec3e58ae4",
"main.dart.js_148.part.js": "b25ca9a2df303270722102deceffa506",
"main.dart.js_149.part.js": "336b9179b0ff9ee3c54bb139279a66d8",
"main.dart.js_15.part.js": "0906abcd5f8bcf47d40d01ebd426fe8b",
"main.dart.js_150.part.js": "c70e0baa94b933ce3283a1558d98b096",
"main.dart.js_151.part.js": "de9cbcf1a6290c8e4304c40c5d6a15a9",
"main.dart.js_152.part.js": "f9ad8066a1a241a76da298fcfe6dbf67",
"main.dart.js_153.part.js": "c900be31095ac8a4c61e3fa4e04e413c",
"main.dart.js_154.part.js": "9935f9e8a52d391767faa4d3aa23176a",
"main.dart.js_155.part.js": "9325afc5b7b446e1d44687b48041908e",
"main.dart.js_156.part.js": "867633990f71edb70afd3c595e45f440",
"main.dart.js_16.part.js": "4e18ee9c1ad64218bd4cf9daa0787bb7",
"main.dart.js_17.part.js": "1a648e27295f5db3b78d4884b798b20b",
"main.dart.js_18.part.js": "888ebb9b87cc96336b6ff90ef49c912b",
"main.dart.js_19.part.js": "468b6a7b2a6f612e10b8777290d0ac91",
"main.dart.js_2.part.js": "5824f23dcba6387e1cd81be993171e32",
"main.dart.js_20.part.js": "47361a48f6b5f0d4db6481563ba21a64",
"main.dart.js_21.part.js": "b4e6bdf1a3acdcfd7de1999ce471cd5c",
"main.dart.js_22.part.js": "c5fbc3209bdb909dbd32619b7e145596",
"main.dart.js_23.part.js": "463a8926f89b41362fb983b9b942d25a",
"main.dart.js_24.part.js": "78597099a5ea15b727b3d96187add7da",
"main.dart.js_25.part.js": "98709c08932378ee96a41430839482b9",
"main.dart.js_26.part.js": "a10ab45b75f106dc327a05ce53b79cb6",
"main.dart.js_27.part.js": "bf55272acfcdfb3a782e802ca33ffae2",
"main.dart.js_28.part.js": "688037303970e203852d786c43a52b13",
"main.dart.js_29.part.js": "4a0f5081674e06a0dc3b1f70387339e6",
"main.dart.js_30.part.js": "41ce081ef31ec942b70c977064eeb8f4",
"main.dart.js_31.part.js": "27d6af47dc7777504e5bb02a06bd7a32",
"main.dart.js_32.part.js": "e72e2bb50aff6e7b924fd13d08c4be10",
"main.dart.js_33.part.js": "7b0e7c8d852ac807525b83d1ebd0b13d",
"main.dart.js_34.part.js": "ac7f8940fe8858993768e689dbbe7944",
"main.dart.js_35.part.js": "5d741ca216546eb5b4e4a3956834a602",
"main.dart.js_36.part.js": "5bdca6ec800dd3e39fce164d5ea9a253",
"main.dart.js_37.part.js": "2b2d74e215c74771d774f1647c3d49e5",
"main.dart.js_38.part.js": "23b1dfdcfc7db6544466674697554829",
"main.dart.js_39.part.js": "bb297d997f1072479001f25903d949d0",
"main.dart.js_40.part.js": "9f6594a001ff93677b5655050f84a923",
"main.dart.js_41.part.js": "1f76c8203b70eaf8faf835118fb81e23",
"main.dart.js_42.part.js": "5dbb81d27cd87df4f4b5d402145327b1",
"main.dart.js_43.part.js": "5597d18d30a66ea721806107719312da",
"main.dart.js_44.part.js": "139668051adf6d078665d4dc76585ad4",
"main.dart.js_45.part.js": "d599244944719344ec2a74b6f9c5c4ae",
"main.dart.js_46.part.js": "9588cd70a5dd5433088d5ae95ae55004",
"main.dart.js_47.part.js": "397059862a3680aa3413b8dd16db4382",
"main.dart.js_48.part.js": "7980d82fd5516a3b03cef16c35d92e65",
"main.dart.js_49.part.js": "64ec55c711f077d73b527283607c760f",
"main.dart.js_50.part.js": "3664ad26459ce98bd7ce3c4147dba8ac",
"main.dart.js_51.part.js": "473066e3aad66d3f1fb946da8f510d44",
"main.dart.js_52.part.js": "c78f2fb6bd6e4b36be34fdf95086caaf",
"main.dart.js_53.part.js": "d1e0af58426307e6b313448384f8f0df",
"main.dart.js_54.part.js": "6b7138efb21dd9e6e69a85c4275bf1a6",
"main.dart.js_55.part.js": "24d59ddd191fc1e9187a90c14eba9c2c",
"main.dart.js_56.part.js": "7c93f05c91373f32ac9646e6f044dec0",
"main.dart.js_57.part.js": "bb64853621749f387f05da408996c846",
"main.dart.js_58.part.js": "c531aaf929eeef1701bf04fb0cef5bdd",
"main.dart.js_59.part.js": "474818511944d1344919fc08864253fd",
"main.dart.js_60.part.js": "752a218afc6499b21e10ffdbf9df8817",
"main.dart.js_61.part.js": "c463f7c6a24d9361ca5249a99a4f532b",
"main.dart.js_62.part.js": "7c5d47724012da63f777b10d7d0835c8",
"main.dart.js_63.part.js": "6c07dc97befa38658b11fbfbd3ada459",
"main.dart.js_64.part.js": "ae4a934f0ad4fa4d3710cd6c079bbdee",
"main.dart.js_65.part.js": "4058ca6242b72bca3f406f910a0b4f01",
"main.dart.js_66.part.js": "ee805aee38b9ca69d1324381f7cf01d4",
"main.dart.js_67.part.js": "4baef996bd69ef2144502896e5442f73",
"main.dart.js_68.part.js": "633d9499c3675d7c3088278bf983774f",
"main.dart.js_69.part.js": "fd2c33cd14dfd31dcae7e9f64732965c",
"main.dart.js_70.part.js": "0102fb27e51d0584471d7c83d2c9ac32",
"main.dart.js_71.part.js": "b6f24679856f761882d33b28cb3d7dde",
"main.dart.js_72.part.js": "60fbb5f7eca6a83b980269759129bdf9",
"main.dart.js_75.part.js": "c0af320a538cbc6959cd257805b7571f",
"main.dart.js_76.part.js": "c009022c7824b73095f07aeab223cd89",
"main.dart.js_77.part.js": "0323f3bbb5aceba485d86b7f636d2d53",
"main.dart.js_78.part.js": "de4d3c14d8e4825c8663658a82cc03d3",
"main.dart.js_79.part.js": "fd37f20d72870fba422060db279accf5",
"main.dart.js_8.part.js": "5dad1f003efdfb72727ff6b800c87160",
"main.dart.js_80.part.js": "ed6af1b0925d5cac5f1992309b928108",
"main.dart.js_81.part.js": "984867f767529a90ff97fc9ac7bc3b2f",
"main.dart.js_82.part.js": "d2a83c82e605c9eb16175c57286a2d52",
"main.dart.js_83.part.js": "ff802906235e4eb240d31c626ad00131",
"main.dart.js_84.part.js": "050f02684fd284dbd10d38f05879abbd",
"main.dart.js_85.part.js": "24adb12c0168949eb35cf0c1dc910919",
"main.dart.js_86.part.js": "ab351e1dfc6a7a21e745b4f6cfefeaa6",
"main.dart.js_88.part.js": "41650560b6c32d2869bcca278df7d334",
"main.dart.js_89.part.js": "191189b1c754cb8a0d11b53d5c1c12cc",
"main.dart.js_90.part.js": "43536c39ebdaa90e4b8618104fdd6f2c",
"main.dart.js_91.part.js": "b5b9db2e15e1849844d732be5f9b116f",
"main.dart.js_92.part.js": "57005156004096cfdc9f95adb5dad78e",
"main.dart.js_93.part.js": "aa0212f26c8fed9f3bdfe1c65a3ca120",
"main.dart.js_94.part.js": "f0fcb69d694ecc451b754f3ac446f93a",
"main.dart.js_95.part.js": "7935208bc61dc0c2534564be96efb9b6",
"main.dart.js_96.part.js": "46801e4552502d935a340a18821d040e",
"main.dart.js_97.part.js": "f9be4358995bd0e39ba8e46047185a1d",
"main.dart.js_98.part.js": "e22b7acf855ce8d77469925a3bcdefb1",
"main.dart.js_99.part.js": "e726cfef2b008964c7385df68d3a93b1",
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
