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
"auth.js": "4d8e3e44ec84af62bda1826b21ff63a8",
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
"flutter_bootstrap.js": "868e88a340fd276671054fe4dca84621",
"index.html": "e3224ca41446a99c7d2b1134ab98663d",
"/": "e3224ca41446a99c7d2b1134ab98663d",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "bd8d438f7dbffdd810fb44093ff6491a",
"main.dart.js_1.part.js": "35a1bfbd6c5f1ee03a8d9401d214f6e0",
"main.dart.js_10.part.js": "059567e3462601adc6d5b7cc4ee90b15",
"main.dart.js_100.part.js": "264d1d22331f02a46fe42488868d8684",
"main.dart.js_101.part.js": "a8ee4264dbaccb9de44348ccfde3de3e",
"main.dart.js_102.part.js": "b84a6db1572da2947961c0b1434e7270",
"main.dart.js_103.part.js": "e2ca0c803daae1c71d5057665beef1d3",
"main.dart.js_104.part.js": "2d9fee6068ba63a4989fd4b9485feff5",
"main.dart.js_105.part.js": "88b8c36d240270b6ec07f33d759ad8d0",
"main.dart.js_106.part.js": "9b30964065431b3bdff32a23ae56a5e2",
"main.dart.js_107.part.js": "26395867c989196a81677b9d4f302224",
"main.dart.js_108.part.js": "acdd91feb8085dbdf9d681eb6e094250",
"main.dart.js_109.part.js": "098db795b2d6a85f5c050f777eb99d94",
"main.dart.js_11.part.js": "d39522814ecbf220b0ca64e613eba6ec",
"main.dart.js_110.part.js": "bc3bd3582f7110b0d4fb4730cc45615d",
"main.dart.js_111.part.js": "252db99c2a1b6ff083fd65557ea68036",
"main.dart.js_112.part.js": "5c06971ce5229f077c9806481ecc9b93",
"main.dart.js_113.part.js": "e525e1e1c0646fd27ebc6c2569314d00",
"main.dart.js_114.part.js": "c32e7281a865677f764a7e1747d117a2",
"main.dart.js_115.part.js": "d9dadbf3743d41f79b95419b1d05a55c",
"main.dart.js_116.part.js": "aa74b9d1056f680a2a2188ce3707c0bd",
"main.dart.js_117.part.js": "37f2b2e6baae92e2f6865bea0e1f711c",
"main.dart.js_118.part.js": "792beb020857a2dfd7103c47d7d7ecdf",
"main.dart.js_119.part.js": "6c41b98b27a361ad470bb4c1395696de",
"main.dart.js_12.part.js": "cd0962dd851fd8516b4a69485f98e2bc",
"main.dart.js_120.part.js": "5f6c36cdbbe7542c97153201241edbe1",
"main.dart.js_121.part.js": "1641b119a66bf3efd28e8b369c93ada0",
"main.dart.js_122.part.js": "44ca9b6778f24fe2bff732487909ab28",
"main.dart.js_123.part.js": "5588d8a0cbd6b99ec863b8afb839b70b",
"main.dart.js_124.part.js": "48c3991cd05621b6abd6cf18ea3ff785",
"main.dart.js_125.part.js": "ef118bdcd06266cd3c59055e28896a67",
"main.dart.js_126.part.js": "1623d416720ab28c269f2870dfb30b2a",
"main.dart.js_127.part.js": "c59f31819602c386adf46e0016177ddc",
"main.dart.js_128.part.js": "714d16e1d553d18e2c419b8878a0bfbc",
"main.dart.js_129.part.js": "107a893dcae4c7e98b5eab1dcc9eb497",
"main.dart.js_13.part.js": "b04a0c5fc8bf0e27aec4fc493297e35d",
"main.dart.js_130.part.js": "7e0f3e91416999788315eceb0fa95eef",
"main.dart.js_131.part.js": "2d44f6febe988c99343a43ac1d27a9d2",
"main.dart.js_132.part.js": "80879c91e69ea2a8f98adf79b793d743",
"main.dart.js_133.part.js": "ffa82f3f82b632a48e3d78c59214fa4c",
"main.dart.js_134.part.js": "841599b8ecea29537d4dd2dd5cdc6def",
"main.dart.js_135.part.js": "da8156f7b29e514f31f4580e761fde83",
"main.dart.js_136.part.js": "fc6e4ec42c1b46c8f77de632f303a21d",
"main.dart.js_137.part.js": "d07b459dac9184a8b446b7a657eda600",
"main.dart.js_138.part.js": "1ffe45579899db0d178036dfb1246f06",
"main.dart.js_139.part.js": "5fcc0cf611c58e9694547dfa557ba580",
"main.dart.js_14.part.js": "bc8da7795713bfe923e878a7825fc24c",
"main.dart.js_140.part.js": "9004894780ca220b87e0a7bdae5dc84f",
"main.dart.js_141.part.js": "6ff2a23bba7b7295d99f83be2b1c8fa7",
"main.dart.js_142.part.js": "4a26b31b305e51fe30b8c145837ed371",
"main.dart.js_143.part.js": "d61ab35aafab786514fa8482403fdd24",
"main.dart.js_144.part.js": "33d9058a77ce6e5a4a34570d136c5d6e",
"main.dart.js_145.part.js": "09e926ca6a8e6b79ea65b6e02672caaf",
"main.dart.js_146.part.js": "af762beadc19ef80e718d57f950ace5d",
"main.dart.js_147.part.js": "7c6af68fc28bb2cfe1ba5f4cb6bacb8a",
"main.dart.js_148.part.js": "ff0c32dd9703c094b00de203eef94cca",
"main.dart.js_149.part.js": "b38f669824dc20d281e9afec6447cdfc",
"main.dart.js_15.part.js": "a75d79e900a1ce0eae9fc97661adb31f",
"main.dart.js_150.part.js": "08730ae9ac711083cdf3df8cebbd5a72",
"main.dart.js_151.part.js": "00c589077bf2f571e75dca2a5e3ff3bf",
"main.dart.js_152.part.js": "6f93532d970b2c7a33196bf3cf818530",
"main.dart.js_153.part.js": "ad822181060674287a931860ce583bdf",
"main.dart.js_154.part.js": "c6c83863ebe541763fbfd7ecc655a81a",
"main.dart.js_155.part.js": "17e09eb28b07ea857411f85a50221796",
"main.dart.js_156.part.js": "e3f70e12acaccef69255b7c89778576c",
"main.dart.js_157.part.js": "70e5fb51a83169ddb299f75285b724d4",
"main.dart.js_158.part.js": "0a43bfd5105b3b539eec7ccfe9f7cf46",
"main.dart.js_16.part.js": "1758b0ccf507ffd4fa107d1bf25f0fcf",
"main.dart.js_17.part.js": "add6ebb226d2b9da89c55a86d8db6380",
"main.dart.js_18.part.js": "d759dce61f6e46b54bc53388c2134de3",
"main.dart.js_19.part.js": "7dd8f5dcbb5a04d9576223ee1dd084a5",
"main.dart.js_2.part.js": "02c611f13c030dca7cbb9f45512757af",
"main.dart.js_20.part.js": "aff82746b3429c2733b54b0f6976a69a",
"main.dart.js_21.part.js": "ad4c89c42f09adfa0659e00ea8c2e3c9",
"main.dart.js_22.part.js": "9102b4d6c5d6a125d7be9766b1fe107b",
"main.dart.js_23.part.js": "09c62c8fb398c5bc4707010563c73c23",
"main.dart.js_24.part.js": "66e23f79f54946a5e23a759076d6a1c8",
"main.dart.js_25.part.js": "b930251ba1243247ddd50f671994bd89",
"main.dart.js_26.part.js": "036d5cbebcab8c45efee4a4cf17841e5",
"main.dart.js_27.part.js": "4c85b8f2e08cb7236cbc784c2b2459a8",
"main.dart.js_28.part.js": "92eca1bf1fbefe2723fb5f1c71f0df19",
"main.dart.js_29.part.js": "09d4f702531641af6da6c79eb6da8978",
"main.dart.js_30.part.js": "c69343f32902bee99f099b7ec5c87dff",
"main.dart.js_31.part.js": "27d6af47dc7777504e5bb02a06bd7a32",
"main.dart.js_32.part.js": "7078daa263ef8792d6166415fa509faa",
"main.dart.js_33.part.js": "7b0e7c8d852ac807525b83d1ebd0b13d",
"main.dart.js_34.part.js": "eb32da9fc6a9028c65d65087d2eac185",
"main.dart.js_35.part.js": "6c7208d79f24355bba2a166855630b63",
"main.dart.js_36.part.js": "68f9389fba426b1e37410fb1b0dbeaad",
"main.dart.js_37.part.js": "fd229ef11b3726f15bfe6fb41cfca5db",
"main.dart.js_38.part.js": "24e011ca18dcca224e4e9cce6c5bf5fe",
"main.dart.js_39.part.js": "6ee8dfe7cd6197c5cda492e60000186c",
"main.dart.js_40.part.js": "9f6594a001ff93677b5655050f84a923",
"main.dart.js_41.part.js": "c9499b391563f09d17500af37084e316",
"main.dart.js_42.part.js": "baca9ae118816ae3847ca03d06a4696d",
"main.dart.js_43.part.js": "c2af705bed682ff31a3669e57832d0c0",
"main.dart.js_44.part.js": "d5d3edc03259b4956135e5c47ee1d559",
"main.dart.js_45.part.js": "f9a3b12512c0adad057a3feedbba056b",
"main.dart.js_46.part.js": "d6ed0ecb17012fa906152fd06357556d",
"main.dart.js_47.part.js": "fd102e1e83fe012ed6e5c85a86e0e239",
"main.dart.js_48.part.js": "8e8ed136b4872696771801b100ad92d8",
"main.dart.js_49.part.js": "fb45b5d72ffb649009d8d577e14f4257",
"main.dart.js_50.part.js": "fb05f0d9d33d582c9eb585a19c2da5bf",
"main.dart.js_51.part.js": "f977cc17ec1d54ef988cd91bfb7031f1",
"main.dart.js_52.part.js": "2a899134a293c7395f2f8ce0182c7339",
"main.dart.js_53.part.js": "41c372752f0db523a6cd5c712af55254",
"main.dart.js_54.part.js": "04c8155fc79643e636109913c34b7fa3",
"main.dart.js_55.part.js": "a240c2d29fd9d828eb684466c0627061",
"main.dart.js_56.part.js": "5a6af003ada7241de8230c2ea839947e",
"main.dart.js_57.part.js": "5ab91ac0d1a0869712941e194880e911",
"main.dart.js_58.part.js": "02f444e37988074a2c0c20f71f3ef133",
"main.dart.js_59.part.js": "526a530702863d71eb68af200f382136",
"main.dart.js_60.part.js": "e9b58e8ac450d8a2155ade8bd2662a12",
"main.dart.js_61.part.js": "337b1fff4f8781f7705bfa6b2d8601ae",
"main.dart.js_62.part.js": "b71b17a2b1af2d26fa32cc58d9104679",
"main.dart.js_63.part.js": "235cc81cbf09abf19ccfce1434b6be38",
"main.dart.js_64.part.js": "8b6ed3b2a44cab035c9afada29edd531",
"main.dart.js_65.part.js": "23368df0ef208012a8cd1723e3330a58",
"main.dart.js_66.part.js": "33c55ba4ba844d8459c09aebf271f8d4",
"main.dart.js_67.part.js": "e1c54025fc203efa7cff9fa5b5c43e50",
"main.dart.js_68.part.js": "70de1a8bd983c82d467de7b7fc824682",
"main.dart.js_69.part.js": "5bf311b2d58f7951f785100c12d8cda8",
"main.dart.js_70.part.js": "01bfea4d7bf2099cec74ee84b6549576",
"main.dart.js_71.part.js": "4559633117547127246991f3b6d4a264",
"main.dart.js_72.part.js": "5f6f3d3be582e14f88feabab287bcab8",
"main.dart.js_73.part.js": "8bfb6aa6f8a16447c6942f6714edb273",
"main.dart.js_74.part.js": "6cf012dfab2852572ff82b04dd71819a",
"main.dart.js_75.part.js": "c0af320a538cbc6959cd257805b7571f",
"main.dart.js_76.part.js": "c009022c7824b73095f07aeab223cd89",
"main.dart.js_77.part.js": "f9e36383ec4a90579cfa62f841eedb8c",
"main.dart.js_78.part.js": "87b3d3ec17e97893cd548e315151e55b",
"main.dart.js_79.part.js": "1d3aee89766056ba58711082b985ef42",
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
"main.dart.js_90.part.js": "25a2e877acc5f963d556178cca3e9e5b",
"main.dart.js_91.part.js": "bd458f4eccbfa9cfb2c939605f20918b",
"main.dart.js_92.part.js": "b19869a3a2f356c49220fbf57158fba0",
"main.dart.js_93.part.js": "17a1d7d7865856bf830aeec68a9c6bfe",
"main.dart.js_94.part.js": "0be38719593a28e029c18bfa62f4f36c",
"main.dart.js_95.part.js": "413a3f344a2c6f3a51a1d2d7b1282f73",
"main.dart.js_96.part.js": "19a2b419509f1892c98ce1531d231f63",
"main.dart.js_97.part.js": "a228d485efdc2db94a55718e74b6a2fa",
"main.dart.js_98.part.js": "e511f04e63ebcf3f2b8a23f3052cf528",
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
