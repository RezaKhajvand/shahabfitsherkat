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
"assets/fonts/MaterialIcons-Regular.otf": "6080a4990d553e43ca3e1b472842ff03",
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
"assets/NOTICES": "16061dc954aefd257bd316cd165041b5",
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
"auth.js": "d7569c27fb704b91088c29c673ca9cfb",
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
"flutter_bootstrap.js": "2da07fbfdb25dfd120a0947af92b7542",
"index.html": "e3224ca41446a99c7d2b1134ab98663d",
"/": "e3224ca41446a99c7d2b1134ab98663d",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "0adc044a8b5d15f05bb8cf3d86357db5",
"main.dart.js_1.part.js": "49d9b05c08e7d7735142768bc8c3a161",
"main.dart.js_10.part.js": "f32c74a8060ffc0ef0a1e6bb9c12829f",
"main.dart.js_100.part.js": "1576573aa8f92cb4115c60210d4dea86",
"main.dart.js_101.part.js": "eef88e315be824394e859a0b31bb322e",
"main.dart.js_102.part.js": "50e9db6dbae929525dc7a89820a87dfe",
"main.dart.js_103.part.js": "a4a22894a321ecc2ad628f27b22935de",
"main.dart.js_104.part.js": "8ca0c60f4e725362d95cc6b1e82989d9",
"main.dart.js_105.part.js": "ae03fbc2d8f0fd6a2d9471be4834fd43",
"main.dart.js_106.part.js": "996aa8223d6571bab1c3b24f1f346d96",
"main.dart.js_107.part.js": "c1d3dfb93869cbda2967763803fbaff7",
"main.dart.js_108.part.js": "ddcb26b37eaf0624717144627eadad55",
"main.dart.js_109.part.js": "62e6cafa51001ac007fd73b4d888532d",
"main.dart.js_11.part.js": "0b72af404885c2e3b44b02be4a6021a7",
"main.dart.js_110.part.js": "bc3bd3582f7110b0d4fb4730cc45615d",
"main.dart.js_111.part.js": "3b60e273edf9e026e02dfd28d4a9b793",
"main.dart.js_112.part.js": "df23a3a452bec6c0aef737cc3ed73040",
"main.dart.js_113.part.js": "655e630231c7f5c97283ef262e03dfb9",
"main.dart.js_114.part.js": "cab86193f2cd249f1001a41e20fa9df4",
"main.dart.js_115.part.js": "ada97c795b5ad045d0d7fd14967806e0",
"main.dart.js_116.part.js": "edbb2d7a59208828bb8a7c6fabeb3233",
"main.dart.js_117.part.js": "078fe7b66b589f4381c83638c2c1bace",
"main.dart.js_118.part.js": "4388d42321f7cec6573de3c21420202e",
"main.dart.js_119.part.js": "19cfcbad75dd10a549037805f504ebc7",
"main.dart.js_12.part.js": "668579d4f4c73a610e8b5fb9d5047808",
"main.dart.js_120.part.js": "2b8e965222a16c025d3c5d29316c63ba",
"main.dart.js_121.part.js": "2da7698160c2ea6ada2b201c40086016",
"main.dart.js_122.part.js": "2b7d8182f175312795f2d411d990dbc1",
"main.dart.js_123.part.js": "00526fcb400e6d0d32d05923bd9e53f5",
"main.dart.js_124.part.js": "d67d3176311b470f52000fd593b7ad4a",
"main.dart.js_125.part.js": "ef118bdcd06266cd3c59055e28896a67",
"main.dart.js_126.part.js": "1623d416720ab28c269f2870dfb30b2a",
"main.dart.js_127.part.js": "80c08a5a31785bb507b035c73c4a102f",
"main.dart.js_128.part.js": "eebeaef1ea5133b2c9aa97d40261c441",
"main.dart.js_129.part.js": "107a893dcae4c7e98b5eab1dcc9eb497",
"main.dart.js_13.part.js": "00fa8bd4db06b9651921bcbbad4d18b0",
"main.dart.js_130.part.js": "9e8c22bd5f341c4b2ca9b9fa21328078",
"main.dart.js_131.part.js": "cc419955977d23fb985ef6428d54482c",
"main.dart.js_132.part.js": "80879c91e69ea2a8f98adf79b793d743",
"main.dart.js_133.part.js": "274619e5e29d3cb469fd310d405ca2be",
"main.dart.js_134.part.js": "32088f095faf0f70144359d201104c31",
"main.dart.js_135.part.js": "de99a91d561717fc14c525b6f0ad22b5",
"main.dart.js_136.part.js": "fe5a86f74e7e2bba2154a1354bf99e02",
"main.dart.js_137.part.js": "d07b459dac9184a8b446b7a657eda600",
"main.dart.js_138.part.js": "1ffe45579899db0d178036dfb1246f06",
"main.dart.js_139.part.js": "5fcc0cf611c58e9694547dfa557ba580",
"main.dart.js_14.part.js": "aee7f538c789191f2e014a26fd6cadd3",
"main.dart.js_140.part.js": "9004894780ca220b87e0a7bdae5dc84f",
"main.dart.js_141.part.js": "9fa1394331f125db4b411e6d2d898f08",
"main.dart.js_142.part.js": "4a26b31b305e51fe30b8c145837ed371",
"main.dart.js_143.part.js": "1f5e2cd408334a723989cfa1efa0c51d",
"main.dart.js_144.part.js": "33d9058a77ce6e5a4a34570d136c5d6e",
"main.dart.js_145.part.js": "09e926ca6a8e6b79ea65b6e02672caaf",
"main.dart.js_146.part.js": "777d791cbb2f21906af57cecb24e1c53",
"main.dart.js_147.part.js": "7c6af68fc28bb2cfe1ba5f4cb6bacb8a",
"main.dart.js_148.part.js": "308e1f9d8dd3f463a615ca5f1b4d1814",
"main.dart.js_149.part.js": "b38f669824dc20d281e9afec6447cdfc",
"main.dart.js_15.part.js": "0b1ae92c7767abe9872bd820a6102bbd",
"main.dart.js_150.part.js": "61053dc835aa271166c4c8c6b7da4710",
"main.dart.js_151.part.js": "d61d23862c54ff52e19049b715090dab",
"main.dart.js_152.part.js": "b161221183d54db780e02186bb6cbbab",
"main.dart.js_153.part.js": "0aefaf934ad4e224db88a5800b101134",
"main.dart.js_154.part.js": "7a9ab0ce4c1d132e5fd71eb0fdd91fd2",
"main.dart.js_155.part.js": "4571ab3aa177fd45b441988a874bc8d8",
"main.dart.js_156.part.js": "ffa5287a3edafa4a0f2415558844724e",
"main.dart.js_157.part.js": "e76718a5aab25a926ddfed7488505945",
"main.dart.js_158.part.js": "5927f49723659928695541eac184d822",
"main.dart.js_16.part.js": "33fc45a77ac8af06bd04993da159ce47",
"main.dart.js_17.part.js": "9cb16f698a89bc189854cea45a9727fb",
"main.dart.js_18.part.js": "1a5b18d07f83b70b31663a90448e63ad",
"main.dart.js_19.part.js": "794478a519b7f0781510a3931ada088e",
"main.dart.js_2.part.js": "335658be1ebffd6bcf10f2898ff5ec66",
"main.dart.js_20.part.js": "9cc8d8e6c9a4dd428dabae5e395bfb71",
"main.dart.js_21.part.js": "391fb9a254f01c3991d9f80a1d4ab609",
"main.dart.js_22.part.js": "50cef7d8cbe62c87744686ce2b2d6b6d",
"main.dart.js_23.part.js": "d16659119f9683de75eaeee7b1f93699",
"main.dart.js_24.part.js": "dd9fd2df39c314da6f4373217e59025c",
"main.dart.js_25.part.js": "ee63a6579dbf3493925b49c47b3d863a",
"main.dart.js_26.part.js": "882abb71c587bb198688b2230a7d81c4",
"main.dart.js_27.part.js": "062488227f62250d279bb917c24c410a",
"main.dart.js_28.part.js": "372542ada719134d3465fb2180c1c1af",
"main.dart.js_29.part.js": "802975cd2e036b58ed0904fff2e3af0b",
"main.dart.js_30.part.js": "5c189518d9a4bbb6c133e49d934673fc",
"main.dart.js_31.part.js": "dfefba821d318128d45c413e73d6cecb",
"main.dart.js_32.part.js": "7ebb00ffd267a83e3015395b0c0b9de3",
"main.dart.js_33.part.js": "38ec409f10127ebdddee925ad6140447",
"main.dart.js_34.part.js": "3ae011e262de76f72ae14c201b18615e",
"main.dart.js_35.part.js": "1a81b4d030bcba6ae308a77e8a32aea8",
"main.dart.js_36.part.js": "1191549c7fdef1747e3cfd08735ce688",
"main.dart.js_37.part.js": "f30778fb89cd5ff2b1812d65307192db",
"main.dart.js_38.part.js": "b322ce728a7abb7fd4a8b75507d767e6",
"main.dart.js_39.part.js": "fceca4bdfba3aaa14770e33558966cf6",
"main.dart.js_40.part.js": "5aea3ecb432d20f4d2ddd2f2a39bb7ea",
"main.dart.js_41.part.js": "66fe8962999623099089e59bfd325f0b",
"main.dart.js_42.part.js": "b2962974f4866cc4a148996a50610c7d",
"main.dart.js_43.part.js": "2e00724b3b819d7be51401d83a81571c",
"main.dart.js_44.part.js": "d5d3edc03259b4956135e5c47ee1d559",
"main.dart.js_45.part.js": "e7a938fdab32a15a192824927cf343e7",
"main.dart.js_46.part.js": "75c04717545f94b83ddada59c1840e23",
"main.dart.js_47.part.js": "e7fcca4ee7b0c9fb7f575443809b0fb1",
"main.dart.js_48.part.js": "5dfff0b0a0ac02c1efbc386973c0cbad",
"main.dart.js_49.part.js": "7b00d18b40e3449f94f984cddc25a7d3",
"main.dart.js_50.part.js": "9dd308a1e90ddc240b54f03e2c7fa00f",
"main.dart.js_51.part.js": "f977cc17ec1d54ef988cd91bfb7031f1",
"main.dart.js_52.part.js": "e09e9b264b0db806706f109926cba46b",
"main.dart.js_53.part.js": "f592dd7568c991adb553efa98af0fd79",
"main.dart.js_54.part.js": "04c8155fc79643e636109913c34b7fa3",
"main.dart.js_55.part.js": "a240c2d29fd9d828eb684466c0627061",
"main.dart.js_56.part.js": "5a6af003ada7241de8230c2ea839947e",
"main.dart.js_57.part.js": "10d5a7e03d0af7fa4e12bc99d325558a",
"main.dart.js_58.part.js": "aceda02cea80f3eb06688c21903f7cef",
"main.dart.js_59.part.js": "8ca05758373f48c7d7087fcebd922d84",
"main.dart.js_60.part.js": "1639dcd02131a64e2028269c5c6aa492",
"main.dart.js_61.part.js": "90034afbfb5885c31f42dd9e9bebd46e",
"main.dart.js_62.part.js": "369733bc58360935bbe1c955bdd2977f",
"main.dart.js_63.part.js": "589899538632210863785c8254b51871",
"main.dart.js_64.part.js": "06992d950e2c1d9ff408600e4ec821c2",
"main.dart.js_65.part.js": "23368df0ef208012a8cd1723e3330a58",
"main.dart.js_66.part.js": "0c96042cced7251467fca6b3e628ce1a",
"main.dart.js_67.part.js": "1613319d5c6dc9bd56fa45193cc888a4",
"main.dart.js_68.part.js": "8bdbe92f97fb0b14fcd6a2d8e2d6c2ef",
"main.dart.js_69.part.js": "3d1ce122a2c0bed34580ac32d7029203",
"main.dart.js_70.part.js": "3e7e601e4b65e987a14d22489d361609",
"main.dart.js_71.part.js": "d0b6b0840bfad6e126c1afa2165f0df9",
"main.dart.js_72.part.js": "70e941c504cf0774936a517e66cc133f",
"main.dart.js_73.part.js": "752b1c094c288c43a6ce2866f627ce36",
"main.dart.js_74.part.js": "da4f9b0d91148a03915682b60f6cd1d5",
"main.dart.js_75.part.js": "d8202fd3fe9fc1d82653f2f370ec388e",
"main.dart.js_76.part.js": "8bd23910fcb6f5797ef9b27881168dd0",
"main.dart.js_77.part.js": "8318712b2ad4360c51c50cead44f3c26",
"main.dart.js_78.part.js": "db20674232cc37e1e89cffddf63d22d6",
"main.dart.js_79.part.js": "c6e3fdeb29b5fc4431703155a379e408",
"main.dart.js_8.part.js": "a6356f90bca7f67457cab21f03ec4e56",
"main.dart.js_80.part.js": "6695cfe0531c30303bc99c27c102aaeb",
"main.dart.js_81.part.js": "3735d55303cb26153973a512855ada96",
"main.dart.js_82.part.js": "c2e6861af7dcaca767dd45dbe0e04dc3",
"main.dart.js_83.part.js": "4fb1dc9e8f746f27aec8d4b720359e1b",
"main.dart.js_84.part.js": "fba5a3f418cfc10654903c376cd026d7",
"main.dart.js_85.part.js": "e6a45772b0e9ec225c037196f6e2fa68",
"main.dart.js_86.part.js": "428dd93c4bfd1014700dcf63ecb9f952",
"main.dart.js_87.part.js": "3845b9d69b41d9889e28207600447051",
"main.dart.js_88.part.js": "7490f45138c35dbb618014a3cabc27ef",
"main.dart.js_89.part.js": "d8edd4ca2f8bf654e910a149bd1acaac",
"main.dart.js_90.part.js": "3673bd2b7a8964c1904ccb0914604713",
"main.dart.js_91.part.js": "cc61980126fb4c5233d115300dc19a6a",
"main.dart.js_92.part.js": "9da6167d2038d19b08705a1334aa5866",
"main.dart.js_93.part.js": "95a98e67a281cb0f1a18d5b4237acd90",
"main.dart.js_94.part.js": "a1b4111f171de3dad31c93d0d6b96a59",
"main.dart.js_95.part.js": "f559b8ceda69ebb977eb017b97d395c1",
"main.dart.js_96.part.js": "95e32f373bb051f8e70708dfeb24bf98",
"main.dart.js_97.part.js": "65bb886a45497b08234d1da58d96bf18",
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
