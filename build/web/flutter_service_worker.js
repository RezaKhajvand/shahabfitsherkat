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
"auth.js": "eb6e4ffd30d6060ba4fcc8aaae8786f5",
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
"flutter_bootstrap.js": "b7706f834a30bb39b1733de94d04034a",
"index.html": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"/": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "ba0ee7fa43a5c73ea47e898bddedc3da",
"main.dart.js_1.part.js": "7888621db06833cbd797b697aa4eea85",
"main.dart.js_10.part.js": "8ec5f6b3f7640fdd2e968a70bc3fd19c",
"main.dart.js_100.part.js": "264d1d22331f02a46fe42488868d8684",
"main.dart.js_101.part.js": "a8ee4264dbaccb9de44348ccfde3de3e",
"main.dart.js_102.part.js": "b84a6db1572da2947961c0b1434e7270",
"main.dart.js_103.part.js": "e2ca0c803daae1c71d5057665beef1d3",
"main.dart.js_104.part.js": "2d9fee6068ba63a4989fd4b9485feff5",
"main.dart.js_105.part.js": "3728c79891b5a19c1a4978e821064fd4",
"main.dart.js_106.part.js": "9e3a360a0076d160e52eb6661442f0b7",
"main.dart.js_107.part.js": "645ad397123dea1f07157c0261930798",
"main.dart.js_108.part.js": "e6cd808839413112640bec7437e19416",
"main.dart.js_109.part.js": "098db795b2d6a85f5c050f777eb99d94",
"main.dart.js_11.part.js": "b3940bf2a88939d5e8bd3e17b012fd74",
"main.dart.js_110.part.js": "bc3bd3582f7110b0d4fb4730cc45615d",
"main.dart.js_111.part.js": "252db99c2a1b6ff083fd65557ea68036",
"main.dart.js_112.part.js": "9cb39173908890db031e6e6bf40523c9",
"main.dart.js_113.part.js": "bba158ad7fb719413393323a977b6b38",
"main.dart.js_114.part.js": "c32e7281a865677f764a7e1747d117a2",
"main.dart.js_115.part.js": "0207feb9d1a2a72799bdccc05d434a5c",
"main.dart.js_116.part.js": "aa74b9d1056f680a2a2188ce3707c0bd",
"main.dart.js_117.part.js": "37f2b2e6baae92e2f6865bea0e1f711c",
"main.dart.js_118.part.js": "792beb020857a2dfd7103c47d7d7ecdf",
"main.dart.js_119.part.js": "6c41b98b27a361ad470bb4c1395696de",
"main.dart.js_12.part.js": "d8f4a8bf08cb459d4d15ebe1b22a4410",
"main.dart.js_120.part.js": "5f6c36cdbbe7542c97153201241edbe1",
"main.dart.js_121.part.js": "1641b119a66bf3efd28e8b369c93ada0",
"main.dart.js_122.part.js": "44ca9b6778f24fe2bff732487909ab28",
"main.dart.js_123.part.js": "3bb39c391f9ea6122a2224b3673330ea",
"main.dart.js_124.part.js": "d131a29a33628f6789a74f4838bb4697",
"main.dart.js_125.part.js": "ef118bdcd06266cd3c59055e28896a67",
"main.dart.js_126.part.js": "1623d416720ab28c269f2870dfb30b2a",
"main.dart.js_127.part.js": "80c08a5a31785bb507b035c73c4a102f",
"main.dart.js_128.part.js": "f471ef271203f4c121f2b3b9bb400ddc",
"main.dart.js_129.part.js": "107a893dcae4c7e98b5eab1dcc9eb497",
"main.dart.js_13.part.js": "39e7fd012dff700f2108fc57ff11e06e",
"main.dart.js_130.part.js": "9e8c22bd5f341c4b2ca9b9fa21328078",
"main.dart.js_131.part.js": "5942767b51ede00e9de32d63fe0fdc86",
"main.dart.js_132.part.js": "80879c91e69ea2a8f98adf79b793d743",
"main.dart.js_133.part.js": "da10a00471cf331c166976dd217f0cbb",
"main.dart.js_134.part.js": "32088f095faf0f70144359d201104c31",
"main.dart.js_135.part.js": "5ef5b166e3b4357a533310ec3e857343",
"main.dart.js_136.part.js": "7e3df7c9b95fd4b7cbcd4f98807b990c",
"main.dart.js_137.part.js": "d07b459dac9184a8b446b7a657eda600",
"main.dart.js_138.part.js": "1ffe45579899db0d178036dfb1246f06",
"main.dart.js_139.part.js": "5fcc0cf611c58e9694547dfa557ba580",
"main.dart.js_14.part.js": "3cd346cc4860d37406e0e25aac6f4bb3",
"main.dart.js_140.part.js": "9004894780ca220b87e0a7bdae5dc84f",
"main.dart.js_141.part.js": "7043807f7d9863333ce4304f8ae010f8",
"main.dart.js_142.part.js": "4a26b31b305e51fe30b8c145837ed371",
"main.dart.js_143.part.js": "cb3904e5cc84e639ac3c826ba71d1b07",
"main.dart.js_144.part.js": "33d9058a77ce6e5a4a34570d136c5d6e",
"main.dart.js_145.part.js": "09e926ca6a8e6b79ea65b6e02672caaf",
"main.dart.js_146.part.js": "90c1606b3891fcf9ec1e232d9c3cfac6",
"main.dart.js_147.part.js": "7c6af68fc28bb2cfe1ba5f4cb6bacb8a",
"main.dart.js_148.part.js": "080dca0347d565af4077f38c73dc52ea",
"main.dart.js_149.part.js": "b38f669824dc20d281e9afec6447cdfc",
"main.dart.js_15.part.js": "164336fc73cd1d776bcae1c2f26c46fa",
"main.dart.js_150.part.js": "61053dc835aa271166c4c8c6b7da4710",
"main.dart.js_151.part.js": "2dbf5b6bbca65b17e0750fac25ed18e6",
"main.dart.js_152.part.js": "0099144895732e72261e99c896c193eb",
"main.dart.js_153.part.js": "2a9f4e713ac57a2757a35962410e8f41",
"main.dart.js_154.part.js": "6e1fcfb1676289b6420a8e9f7513f478",
"main.dart.js_155.part.js": "02585a414bdeebaeee515ab841a0b1a2",
"main.dart.js_156.part.js": "e700b368a6172d93d6a2a12ad5b633b8",
"main.dart.js_157.part.js": "d5ddff10dfbc79bdce26615b55ba7312",
"main.dart.js_158.part.js": "950ec573f6a4dea009d30b48242f85f6",
"main.dart.js_16.part.js": "6a0b6897cf85ef285ff521669f60828e",
"main.dart.js_17.part.js": "add6ebb226d2b9da89c55a86d8db6380",
"main.dart.js_18.part.js": "13d5f0165ae41cc12d8822350264aab0",
"main.dart.js_19.part.js": "7dd8f5dcbb5a04d9576223ee1dd084a5",
"main.dart.js_2.part.js": "33d2fffd7299bbf405d5e1c63c907aa9",
"main.dart.js_20.part.js": "1115eb71217c21d911cea6c0b9dc2bc3",
"main.dart.js_21.part.js": "55b076f7dc870cff49fc189e573b4b69",
"main.dart.js_22.part.js": "ea3a494b52422f02501077806e738106",
"main.dart.js_23.part.js": "d8c9188f158a480fb6f44a4b1cea0da5",
"main.dart.js_24.part.js": "dd9fd2df39c314da6f4373217e59025c",
"main.dart.js_25.part.js": "6809d3ff8f6fc2f68cc5e54493e09262",
"main.dart.js_26.part.js": "036d5cbebcab8c45efee4a4cf17841e5",
"main.dart.js_27.part.js": "4c85b8f2e08cb7236cbc784c2b2459a8",
"main.dart.js_28.part.js": "e0b7b68c544d3d59d4a7cfd28600e54f",
"main.dart.js_29.part.js": "1ede48aadd25a4523e79ca4849547bbf",
"main.dart.js_30.part.js": "c69343f32902bee99f099b7ec5c87dff",
"main.dart.js_31.part.js": "27d6af47dc7777504e5bb02a06bd7a32",
"main.dart.js_32.part.js": "93766605953e1bee08ff3be3c5c12b3e",
"main.dart.js_33.part.js": "7b0e7c8d852ac807525b83d1ebd0b13d",
"main.dart.js_34.part.js": "175beb9761d75d658239b4b9b295b31d",
"main.dart.js_35.part.js": "8d18aae4624366131b57011e350fe70f",
"main.dart.js_36.part.js": "68f9389fba426b1e37410fb1b0dbeaad",
"main.dart.js_37.part.js": "fd229ef11b3726f15bfe6fb41cfca5db",
"main.dart.js_38.part.js": "24e011ca18dcca224e4e9cce6c5bf5fe",
"main.dart.js_39.part.js": "083f56e5621672437d71bd6fe20f8625",
"main.dart.js_40.part.js": "9f6594a001ff93677b5655050f84a923",
"main.dart.js_41.part.js": "4613fa8f792259e9696d57ea450c5ce5",
"main.dart.js_42.part.js": "6e2914013764ca351210f6d1068611c4",
"main.dart.js_43.part.js": "6d6c5324bc2190826b0be79d6b503d88",
"main.dart.js_44.part.js": "d5d3edc03259b4956135e5c47ee1d559",
"main.dart.js_45.part.js": "f9a3b12512c0adad057a3feedbba056b",
"main.dart.js_46.part.js": "7d993bc7853947a482237096da7d37ac",
"main.dart.js_47.part.js": "b62de65e9a775a5b82d11c1fa50479f6",
"main.dart.js_48.part.js": "8e8ed136b4872696771801b100ad92d8",
"main.dart.js_49.part.js": "e9742b84e3cf3bfb7ba50ff6b3999a61",
"main.dart.js_50.part.js": "fb05f0d9d33d582c9eb585a19c2da5bf",
"main.dart.js_51.part.js": "f977cc17ec1d54ef988cd91bfb7031f1",
"main.dart.js_52.part.js": "c9ce7d6bdfe7aefb7bb82eb56d7b4d80",
"main.dart.js_53.part.js": "41c372752f0db523a6cd5c712af55254",
"main.dart.js_54.part.js": "04c8155fc79643e636109913c34b7fa3",
"main.dart.js_55.part.js": "a240c2d29fd9d828eb684466c0627061",
"main.dart.js_56.part.js": "5a6af003ada7241de8230c2ea839947e",
"main.dart.js_57.part.js": "a78a1217a201469b44004e76d575e284",
"main.dart.js_58.part.js": "9622c91d1f650a3509043a4a796d7392",
"main.dart.js_59.part.js": "4d3755a892e774f206005620809d6ad6",
"main.dart.js_60.part.js": "8980626cc0e17d0cbe46eb75780802df",
"main.dart.js_61.part.js": "337b1fff4f8781f7705bfa6b2d8601ae",
"main.dart.js_62.part.js": "b71b17a2b1af2d26fa32cc58d9104679",
"main.dart.js_63.part.js": "76be3143eabe4ff1d4a34a0281f5ec78",
"main.dart.js_64.part.js": "4f9fb0a03bfb7d9c333b9bb1f802f5c1",
"main.dart.js_65.part.js": "23368df0ef208012a8cd1723e3330a58",
"main.dart.js_66.part.js": "700d3db04aeb8ec038e9c73d328c859f",
"main.dart.js_67.part.js": "e1c54025fc203efa7cff9fa5b5c43e50",
"main.dart.js_68.part.js": "e4ee88bb565db969cec6736679fb92c2",
"main.dart.js_69.part.js": "3d1ce122a2c0bed34580ac32d7029203",
"main.dart.js_70.part.js": "2edd9025cb67352db84f8ee96a3b85f7",
"main.dart.js_71.part.js": "4559633117547127246991f3b6d4a264",
"main.dart.js_72.part.js": "4f7f1f98c38b5afaa64dd5a72a13d3ab",
"main.dart.js_73.part.js": "ed1ccd898da751bcee833110fe3257f3",
"main.dart.js_74.part.js": "6cf012dfab2852572ff82b04dd71819a",
"main.dart.js_75.part.js": "c0af320a538cbc6959cd257805b7571f",
"main.dart.js_76.part.js": "c009022c7824b73095f07aeab223cd89",
"main.dart.js_77.part.js": "9ecbfc06a386f5fbac85867c28ac948e",
"main.dart.js_78.part.js": "db20674232cc37e1e89cffddf63d22d6",
"main.dart.js_79.part.js": "1b1ad3d053a1f119b98bc8353dcbb6a4",
"main.dart.js_8.part.js": "3d48c25c2da42130c6eb228fce317f48",
"main.dart.js_80.part.js": "1be9c274a61e2cb2d8301e9fe190b611",
"main.dart.js_81.part.js": "eb2f5dbd2b882b8bd6d9f2d8c0e00b78",
"main.dart.js_82.part.js": "cbc08ef6dd2697310fd9d2205e411fb5",
"main.dart.js_83.part.js": "d0a989ed066428908bb2995fbaf566df",
"main.dart.js_84.part.js": "b3e3bc3dbe0205eabe1d412a6609c596",
"main.dart.js_85.part.js": "d6220729cc0dc8c1e65f6d14c1616a17",
"main.dart.js_86.part.js": "a107a4ef1676920f382beae726e6cc7e",
"main.dart.js_87.part.js": "3845b9d69b41d9889e28207600447051",
"main.dart.js_88.part.js": "141c5f5ca35d5f152419a81da5346486",
"main.dart.js_89.part.js": "975e0a611e0b3a09e927b72c29ff369a",
"main.dart.js_90.part.js": "38253e7b9dc31e1ae655fe9a82209582",
"main.dart.js_91.part.js": "bd458f4eccbfa9cfb2c939605f20918b",
"main.dart.js_92.part.js": "b19869a3a2f356c49220fbf57158fba0",
"main.dart.js_93.part.js": "17a1d7d7865856bf830aeec68a9c6bfe",
"main.dart.js_94.part.js": "0be38719593a28e029c18bfa62f4f36c",
"main.dart.js_95.part.js": "b9e7a2abb65574536d3dd3377493ebb3",
"main.dart.js_96.part.js": "19a2b419509f1892c98ce1531d231f63",
"main.dart.js_97.part.js": "a228d485efdc2db94a55718e74b6a2fa",
"main.dart.js_98.part.js": "14bedbf48f25befef627916610c3ab96",
"main.dart.js_99.part.js": "d56bbc721abd7dd6e9ae07c472084005",
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
