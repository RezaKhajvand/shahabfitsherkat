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
"auth.js": "b51d402ef8c34a8d7144b95a86d30e3c",
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
"flutter_bootstrap.js": "9fec4c1e3e407d850705178ce86fe14b",
"index.html": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"/": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "54a68c8d642930bc376aa8dad8803353",
"main.dart.js_1.part.js": "ac0fd10d2d4141ff16a7ab5cb758c770",
"main.dart.js_10.part.js": "64eca60e6358cc9690dd21639e7cb5c3",
"main.dart.js_100.part.js": "a2636b74feb67150d14037079cf56325",
"main.dart.js_101.part.js": "d453839460569341ac1f9ef40cd68445",
"main.dart.js_102.part.js": "2ddc33c79c0b1055b215c25206511d29",
"main.dart.js_103.part.js": "e2ca0c803daae1c71d5057665beef1d3",
"main.dart.js_104.part.js": "b9df102b17fa0a571e2870fbf2d18ebe",
"main.dart.js_105.part.js": "5026e401b163989663639db126cd6214",
"main.dart.js_106.part.js": "cbc690473242dbbe898f02c086894963",
"main.dart.js_107.part.js": "5d07036882b69f82abe0db70195567a5",
"main.dart.js_108.part.js": "8c56be3161f847ba0f4f15ad69a000bd",
"main.dart.js_109.part.js": "6648eb316c7e9cc03809ef1a872501a8",
"main.dart.js_11.part.js": "ac7a1386e76fc9865436b70d0ec661e3",
"main.dart.js_110.part.js": "982b4aea3fd794e825ebdd0651dfeb7d",
"main.dart.js_111.part.js": "f5ac3c76506dffd62f125f93edf0794f",
"main.dart.js_112.part.js": "e450e7596b1ef8eaf8aa6ab7fd6e69f4",
"main.dart.js_113.part.js": "25e6f4916f2f3f55490636f26b8fc3ed",
"main.dart.js_114.part.js": "db4d2cbfea13e660434cc2421eaa24da",
"main.dart.js_115.part.js": "615356a8b4b46d2e335adb8a7d309360",
"main.dart.js_116.part.js": "5d372438e15c7538c3bd1c5392646555",
"main.dart.js_117.part.js": "cc0119ba3e2eb0c58b1591e72eed34c3",
"main.dart.js_118.part.js": "ea60d8b65fd597d51526ecb691b376c8",
"main.dart.js_119.part.js": "23b0d2ab262de508476d41d4229c141e",
"main.dart.js_12.part.js": "87e4afa62fc6c80a83c74fdb0af93d53",
"main.dart.js_120.part.js": "e7ccbe53a99a9a3c0fee0310b1f087c9",
"main.dart.js_121.part.js": "1641b119a66bf3efd28e8b369c93ada0",
"main.dart.js_122.part.js": "2bb4a47463fee5eb5cdf1869a4cab09c",
"main.dart.js_123.part.js": "cb254568b1d2775896225f8515ba343b",
"main.dart.js_124.part.js": "616d6da247d6b0f2d950fe9f5e6225b3",
"main.dart.js_125.part.js": "8335ee3c1c5ed0e2dad7eef27041e2ec",
"main.dart.js_126.part.js": "1623d416720ab28c269f2870dfb30b2a",
"main.dart.js_127.part.js": "717181197d50309a70e978970c869385",
"main.dart.js_128.part.js": "645432a85eba2230397e1025b92d44da",
"main.dart.js_129.part.js": "0feebdbf4e24d09bf55eac3f42d2d9e5",
"main.dart.js_13.part.js": "ddac80ad35f43fc1a9ae91f3d22c4cb7",
"main.dart.js_130.part.js": "51539b9ee10d83945b9e8c6aa0a1d3c4",
"main.dart.js_131.part.js": "203cc31662f32dcacc073a6525d0245f",
"main.dart.js_132.part.js": "c6236b9b6a1f5f77b51d72574281616d",
"main.dart.js_133.part.js": "651af698956b19deedb3b468019e7268",
"main.dart.js_134.part.js": "164e7bc8cd4ebd1c632daea70b115947",
"main.dart.js_135.part.js": "b06ce4f07e4c6e8320281b51c1a8b6ee",
"main.dart.js_136.part.js": "2e041a1c8bd0f0033b51adedd623db93",
"main.dart.js_137.part.js": "6eaebc61f1b108155a243339c9d1db17",
"main.dart.js_138.part.js": "aa2a7eec4443d0b612ff68fe7b2f0460",
"main.dart.js_139.part.js": "6bc94388ba1183d733d0a38dbdb5f7e5",
"main.dart.js_14.part.js": "94f035df65c45f688b3ec8c22f1bc0a3",
"main.dart.js_140.part.js": "9004894780ca220b87e0a7bdae5dc84f",
"main.dart.js_141.part.js": "c15f914577b6f816690fc5a517c13967",
"main.dart.js_142.part.js": "e246af3b64fc252c65c747be0e4a3bc7",
"main.dart.js_143.part.js": "48a7ce216af04cf60e040c10ec777dee",
"main.dart.js_144.part.js": "3910a91dba864ecdc1d65b3d5be5ab68",
"main.dart.js_145.part.js": "09e926ca6a8e6b79ea65b6e02672caaf",
"main.dart.js_146.part.js": "f09cd491b30e9b2e3e8858a248c29d6e",
"main.dart.js_147.part.js": "784055ae5479a81702fa08c28af3288e",
"main.dart.js_148.part.js": "aeaa599452e4e810408f6219b07a902c",
"main.dart.js_149.part.js": "a2aa2df0fcc11e5a288d41da02375b2b",
"main.dart.js_15.part.js": "e007ebcfc650377378956bb6a496e99a",
"main.dart.js_150.part.js": "4e882779cc04af158892f7e033dd88b6",
"main.dart.js_151.part.js": "c9e69eca14e11b4b597a107113e8deba",
"main.dart.js_152.part.js": "f48a58682b9f8de8b75f7ff6c56cbb0a",
"main.dart.js_153.part.js": "a19bcf1a98afd156d1499313d9e4d2a9",
"main.dart.js_154.part.js": "733af2cd41d516ece0d58b802bb57715",
"main.dart.js_155.part.js": "ead8cc1ee8dffc06d21b7dd8a15b0e85",
"main.dart.js_156.part.js": "24454ec1017c7af0a721ae1e80cde82b",
"main.dart.js_157.part.js": "75f2146c406286a6696fe1283cb5f9de",
"main.dart.js_158.part.js": "975e67b269af3113cb6069ee2c31f477",
"main.dart.js_16.part.js": "5e07481b50381f25c4edf6218ad151ff",
"main.dart.js_17.part.js": "2d1557b33bced1579ade2fe7e7896bea",
"main.dart.js_18.part.js": "3b6c6185cea66eac4e97c6af63511ac3",
"main.dart.js_19.part.js": "18426d4717efd0cca459616120fb125b",
"main.dart.js_2.part.js": "c322038c4aba108aecb49160644729a5",
"main.dart.js_20.part.js": "7ebe4fc3b938105f774de7ae9eacb1b7",
"main.dart.js_21.part.js": "f59152879d20490a3e191195746e4946",
"main.dart.js_22.part.js": "960a9cc55dd6d4259b947346e3e8a854",
"main.dart.js_23.part.js": "88d49e2994a1132b41810f125fe6758a",
"main.dart.js_24.part.js": "7dbbe83527b9c7feb8464b2d7c8b09f5",
"main.dart.js_25.part.js": "cf2025c6df5891545e45380a20f9575a",
"main.dart.js_26.part.js": "d4815227f59a01c931a5e3667b45fc32",
"main.dart.js_27.part.js": "ade58dc1d1850f1f62eff9f74b17e9b0",
"main.dart.js_28.part.js": "a9c16dfb288ddc3735f05aebc3dcd8b3",
"main.dart.js_29.part.js": "bfab90c4704478c0b99098477901f31c",
"main.dart.js_30.part.js": "f48da587396837477c78418d94afe93b",
"main.dart.js_31.part.js": "720effda2fc1269028e39f82e77fd634",
"main.dart.js_32.part.js": "19e432cb0a9e91e2eb2816f4bba9ab64",
"main.dart.js_33.part.js": "7b0e7c8d852ac807525b83d1ebd0b13d",
"main.dart.js_34.part.js": "17a9f7f15c694320ce6171fca6f5b72f",
"main.dart.js_35.part.js": "6be13cc2cfd6d999dac0bdcb2369130b",
"main.dart.js_36.part.js": "4c8c3ddd28de73046474cc9dbcf281f2",
"main.dart.js_37.part.js": "e86674f5e1aa7bffd61908d150453392",
"main.dart.js_38.part.js": "d0124ed83b54b740769fc60ddfb641ee",
"main.dart.js_39.part.js": "edbbed3b775419ca53da8a0ba8e1df9b",
"main.dart.js_40.part.js": "9f6594a001ff93677b5655050f84a923",
"main.dart.js_41.part.js": "126bd62e9bd83333ae0b82a26ad0d5f2",
"main.dart.js_42.part.js": "cf7ce6b99551bc73146ce76c3b895199",
"main.dart.js_43.part.js": "5597d18d30a66ea721806107719312da",
"main.dart.js_44.part.js": "843d310070fd41b67588ba442bbd76ea",
"main.dart.js_45.part.js": "ac4406964b6d5b6bd099c21a002e507c",
"main.dart.js_46.part.js": "9588cd70a5dd5433088d5ae95ae55004",
"main.dart.js_47.part.js": "3f18d1e026375f8ff8134afb44774d89",
"main.dart.js_48.part.js": "58619d379600725209b214147b741e5c",
"main.dart.js_49.part.js": "6d6a7899843f5f30c6c7eeb75e018fd8",
"main.dart.js_50.part.js": "fb05f0d9d33d582c9eb585a19c2da5bf",
"main.dart.js_51.part.js": "3f9917bfaf780d082e6a02f96d4d84ce",
"main.dart.js_52.part.js": "c78f2fb6bd6e4b36be34fdf95086caaf",
"main.dart.js_53.part.js": "d1e0af58426307e6b313448384f8f0df",
"main.dart.js_54.part.js": "98a3c3060876605332d34a317015b8d6",
"main.dart.js_55.part.js": "c229158eda8ae837146fe8adad847ddb",
"main.dart.js_56.part.js": "5a6af003ada7241de8230c2ea839947e",
"main.dart.js_57.part.js": "bb64853621749f387f05da408996c846",
"main.dart.js_58.part.js": "f8d567cae81273adc7e562ff941482c1",
"main.dart.js_59.part.js": "4fb08e64f938b32cf3848285b099db16",
"main.dart.js_60.part.js": "21f0a7642ffffb19b02d1e3a0ea61279",
"main.dart.js_61.part.js": "61b1a98c84189f7eff90773370ab92ab",
"main.dart.js_62.part.js": "b863ef108d6837f175d036374270ea59",
"main.dart.js_63.part.js": "6c07dc97befa38658b11fbfbd3ada459",
"main.dart.js_64.part.js": "78661895f7aaf247de4843861949e981",
"main.dart.js_65.part.js": "c90b6aac606505c678ccdc60cdaab1d2",
"main.dart.js_66.part.js": "a444e6031b16dfd34626e867eeafca9f",
"main.dart.js_67.part.js": "293faaa1b363ce1a723e0cfde186d1c5",
"main.dart.js_68.part.js": "0f817d140f1e4832193a0c4fe9cbc5a2",
"main.dart.js_69.part.js": "9f62e5de0a6d0e740196fb9bb664a58a",
"main.dart.js_70.part.js": "430c8b02b639ea6c46e8a139dbc9c4f3",
"main.dart.js_71.part.js": "4559633117547127246991f3b6d4a264",
"main.dart.js_72.part.js": "60fbb5f7eca6a83b980269759129bdf9",
"main.dart.js_73.part.js": "3b80327f173631c4988d4ecebf0efc2e",
"main.dart.js_74.part.js": "a98790754dcc352b63a3853d49d38fd0",
"main.dart.js_75.part.js": "c0af320a538cbc6959cd257805b7571f",
"main.dart.js_76.part.js": "c009022c7824b73095f07aeab223cd89",
"main.dart.js_77.part.js": "0323f3bbb5aceba485d86b7f636d2d53",
"main.dart.js_78.part.js": "1b69cbbfafecdeb6fc5ee5faf6f4fa45",
"main.dart.js_79.part.js": "c28f6dd06d6408a414b0864e1eb1cb6d",
"main.dart.js_8.part.js": "aca535a280686bcc2f7e3aa78a208b76",
"main.dart.js_80.part.js": "f2c8d8c4318b9bd0822cab19e166c54b",
"main.dart.js_81.part.js": "0eb28cbeeb53e9265863285069113db2",
"main.dart.js_82.part.js": "8e95e6234563068d5c289480a7b98e98",
"main.dart.js_83.part.js": "d0a989ed066428908bb2995fbaf566df",
"main.dart.js_84.part.js": "050f02684fd284dbd10d38f05879abbd",
"main.dart.js_85.part.js": "6ee78f67c3492d72ceec035102486484",
"main.dart.js_86.part.js": "3c8b2d27805c5b4ac446bc30fc1cf16a",
"main.dart.js_87.part.js": "39883bcf22ce185afaec01afb97dd0d3",
"main.dart.js_88.part.js": "141c5f5ca35d5f152419a81da5346486",
"main.dart.js_89.part.js": "191189b1c754cb8a0d11b53d5c1c12cc",
"main.dart.js_90.part.js": "e6168c91b050d6902e7ff7c260476979",
"main.dart.js_91.part.js": "440eaf7e0dc089b23199cce4e367a313",
"main.dart.js_92.part.js": "30bdcba0bbae362e4498ea1e6cc46d92",
"main.dart.js_93.part.js": "17a1d7d7865856bf830aeec68a9c6bfe",
"main.dart.js_94.part.js": "f0fcb69d694ecc451b754f3ac446f93a",
"main.dart.js_95.part.js": "462ac6b3111c20ccb53f7fd3cdd73bb2",
"main.dart.js_96.part.js": "ca79bd6340891163fe38b2d529508f88",
"main.dart.js_97.part.js": "669afb7177279781e02ecc4d5088510c",
"main.dart.js_98.part.js": "1d4955865d955e2c928881576db4e89e",
"main.dart.js_99.part.js": "6b25edb4885b644f5cca0fa8b1bd02b7",
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
