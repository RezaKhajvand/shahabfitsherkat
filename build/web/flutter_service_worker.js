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
"auth.js": "d47d6373cd5b125775d1cd20e998696d",
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
"flutter_bootstrap.js": "0b1488fd3bff4745a9cc2e224c328179",
"index.html": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"/": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "c3629520da75cbf9ca33466832a4a78e",
"main.dart.js_1.part.js": "e300d233f32159fa96b086deb5c7c821",
"main.dart.js_10.part.js": "64eca60e6358cc9690dd21639e7cb5c3",
"main.dart.js_100.part.js": "a2636b74feb67150d14037079cf56325",
"main.dart.js_101.part.js": "2187ef5804fe849bad5db7c7f9f2a754",
"main.dart.js_102.part.js": "2ddc33c79c0b1055b215c25206511d29",
"main.dart.js_103.part.js": "e2ca0c803daae1c71d5057665beef1d3",
"main.dart.js_104.part.js": "b9df102b17fa0a571e2870fbf2d18ebe",
"main.dart.js_105.part.js": "5026e401b163989663639db126cd6214",
"main.dart.js_106.part.js": "408e44777d3da54e1f6503ffeda2a24f",
"main.dart.js_107.part.js": "8f64e4794479d2bb2af0ccf60b29596f",
"main.dart.js_108.part.js": "7799ac3a1aa24ec48b911ea62559abfd",
"main.dart.js_109.part.js": "3afbaa68c4e16afe314a434a34825f20",
"main.dart.js_11.part.js": "0316347a80659ced6b81f8d598b8a848",
"main.dart.js_110.part.js": "bc3bd3582f7110b0d4fb4730cc45615d",
"main.dart.js_111.part.js": "f5ac3c76506dffd62f125f93edf0794f",
"main.dart.js_112.part.js": "211a297da1d2fbf9306259fba2f19275",
"main.dart.js_113.part.js": "607bb6bcc8f7ed2db266d2b5851e87a4",
"main.dart.js_114.part.js": "e20b18a32715bf8b2d5233c8dba85d38",
"main.dart.js_115.part.js": "615356a8b4b46d2e335adb8a7d309360",
"main.dart.js_116.part.js": "5d372438e15c7538c3bd1c5392646555",
"main.dart.js_117.part.js": "2b492f3f4f03f6b84404f3fea428d6d7",
"main.dart.js_118.part.js": "74d791b6ab3fee96b8571b0866be5069",
"main.dart.js_119.part.js": "23b0d2ab262de508476d41d4229c141e",
"main.dart.js_12.part.js": "8acf6cf177786b7745000b5ceac1a200",
"main.dart.js_120.part.js": "e7ccbe53a99a9a3c0fee0310b1f087c9",
"main.dart.js_121.part.js": "1641b119a66bf3efd28e8b369c93ada0",
"main.dart.js_122.part.js": "2bb4a47463fee5eb5cdf1869a4cab09c",
"main.dart.js_123.part.js": "cb254568b1d2775896225f8515ba343b",
"main.dart.js_124.part.js": "2d1f1102f9ab5b2be2b45729ee378597",
"main.dart.js_125.part.js": "9536311bb04382052f1008250fe9f57f",
"main.dart.js_126.part.js": "1623d416720ab28c269f2870dfb30b2a",
"main.dart.js_127.part.js": "717181197d50309a70e978970c869385",
"main.dart.js_128.part.js": "645432a85eba2230397e1025b92d44da",
"main.dart.js_129.part.js": "f615b649f4e6419df34da5c262a4541f",
"main.dart.js_13.part.js": "5fa3ee639f359dc7bdc5a097b6f790aa",
"main.dart.js_130.part.js": "51539b9ee10d83945b9e8c6aa0a1d3c4",
"main.dart.js_131.part.js": "01444a55034d564caae617205644d6bf",
"main.dart.js_132.part.js": "d4484944dac959b67e7c660198c252a0",
"main.dart.js_133.part.js": "651af698956b19deedb3b468019e7268",
"main.dart.js_134.part.js": "164e7bc8cd4ebd1c632daea70b115947",
"main.dart.js_135.part.js": "b63760ffdac29144831ff2431a97857b",
"main.dart.js_136.part.js": "8cf40ad43fa6c5c663f726229153db42",
"main.dart.js_137.part.js": "c9a95e54d89d5926103a66e710d21fc7",
"main.dart.js_138.part.js": "aa2a7eec4443d0b612ff68fe7b2f0460",
"main.dart.js_139.part.js": "d9f6152926e81e0081a3dc0e91249f66",
"main.dart.js_14.part.js": "58d554a0751a8f96a5298a7ec90f94aa",
"main.dart.js_140.part.js": "9004894780ca220b87e0a7bdae5dc84f",
"main.dart.js_141.part.js": "c15f914577b6f816690fc5a517c13967",
"main.dart.js_142.part.js": "4d2027a1b822f02d6a1cddd6b1f9406f",
"main.dart.js_143.part.js": "05309fc6b2fb7bf0d1a68baf2408c016",
"main.dart.js_144.part.js": "927b6fb2fe8ab1b0e1eedaeb02946e29",
"main.dart.js_145.part.js": "09e926ca6a8e6b79ea65b6e02672caaf",
"main.dart.js_146.part.js": "cb1bbe3ebda1e1fc5ee038d5394ca18a",
"main.dart.js_147.part.js": "784055ae5479a81702fa08c28af3288e",
"main.dart.js_148.part.js": "a6d72ec7094c489bece9dac34ab6e342",
"main.dart.js_149.part.js": "f9e59e6125f11041d193c02c0070d282",
"main.dart.js_15.part.js": "f4f375e06a61113f4203242e389604a6",
"main.dart.js_150.part.js": "03912a645e1f959d3ac4f7da7a76aa53",
"main.dart.js_151.part.js": "2339b7ae03fa67f9aeb8e67997349e29",
"main.dart.js_152.part.js": "b4c2a96cb4ff119e4f8c924cc73b4ca2",
"main.dart.js_153.part.js": "55fec04a33e89621a6ee17019ab4fcc8",
"main.dart.js_154.part.js": "5892cea2d42ca21e95c510459b649b10",
"main.dart.js_155.part.js": "801b1ab23a20f5166ca93089e231542e",
"main.dart.js_156.part.js": "66cfee089bafef373be2abbbb5fc4f22",
"main.dart.js_157.part.js": "c5f80a91176f2282a82dcfa108fd104e",
"main.dart.js_158.part.js": "8f8a77989e3bdd78878a88b396749aee",
"main.dart.js_16.part.js": "345715d65f4c9ec2c4704d267b5985d2",
"main.dart.js_17.part.js": "9d7844dba7ba75a486344a3bda17908b",
"main.dart.js_18.part.js": "8714b6c77d4f4510b857dba013b18575",
"main.dart.js_19.part.js": "ab088ea468b501f6dff152b0781aeb70",
"main.dart.js_2.part.js": "6ed22bb1a17ab3292fce718c5c16e9e5",
"main.dart.js_20.part.js": "50c6419ef67d3d217af89f283401d2cf",
"main.dart.js_21.part.js": "b3f804789cd7525a24efb491ad381414",
"main.dart.js_22.part.js": "e2c1ca531cdfcacd2a084c6ff08bf8e4",
"main.dart.js_23.part.js": "3d7c408a31bf101d6d709ef0c8590860",
"main.dart.js_24.part.js": "9df1404cef65d4041e5c3626aca6c727",
"main.dart.js_25.part.js": "80b62f6b10bc5484bee8b97cd9bdd4ca",
"main.dart.js_26.part.js": "2fd51aab8d737384f4ac3177fb77792c",
"main.dart.js_27.part.js": "ade58dc1d1850f1f62eff9f74b17e9b0",
"main.dart.js_28.part.js": "b2c882226bfa4576e060a84096df080c",
"main.dart.js_29.part.js": "230e7af0a6955301656979fcfa23265c",
"main.dart.js_30.part.js": "f48da587396837477c78418d94afe93b",
"main.dart.js_31.part.js": "720effda2fc1269028e39f82e77fd634",
"main.dart.js_32.part.js": "82535fb16de2bd481cf2e5d8e7300f19",
"main.dart.js_33.part.js": "7b0e7c8d852ac807525b83d1ebd0b13d",
"main.dart.js_34.part.js": "bbce1f15ffbda65576ea7dc8111c4c92",
"main.dart.js_35.part.js": "4d3c7cb3b60dc86373c1b423d1787f6c",
"main.dart.js_36.part.js": "4c8c3ddd28de73046474cc9dbcf281f2",
"main.dart.js_37.part.js": "e86674f5e1aa7bffd61908d150453392",
"main.dart.js_38.part.js": "013a4574754b808d9c5cd5cc5f4c6e43",
"main.dart.js_39.part.js": "70fc2e4add6976fb6d459238a2cf9f3b",
"main.dart.js_40.part.js": "9f6594a001ff93677b5655050f84a923",
"main.dart.js_41.part.js": "4d949a56ef7fba40db3c785cef4cc5d3",
"main.dart.js_42.part.js": "407467e1c7dd6a5fe297c9df1711e0b1",
"main.dart.js_43.part.js": "5597d18d30a66ea721806107719312da",
"main.dart.js_44.part.js": "94f62b11d67e6428422a8d84362385bc",
"main.dart.js_45.part.js": "9fffc8b6a189b2cadec71f8a96fb7790",
"main.dart.js_46.part.js": "9588cd70a5dd5433088d5ae95ae55004",
"main.dart.js_47.part.js": "bd7bb78e27e3e1c7240119e6dfff68b7",
"main.dart.js_48.part.js": "374520d3577bd40f1d6c34753c7e6398",
"main.dart.js_49.part.js": "a0311b41371119770e4ed263b7b70ddb",
"main.dart.js_50.part.js": "fb05f0d9d33d582c9eb585a19c2da5bf",
"main.dart.js_51.part.js": "2de3a0e97ae28d927632a054c6213584",
"main.dart.js_52.part.js": "c78f2fb6bd6e4b36be34fdf95086caaf",
"main.dart.js_53.part.js": "d1e0af58426307e6b313448384f8f0df",
"main.dart.js_54.part.js": "a594898b596514693894228f59efb735",
"main.dart.js_55.part.js": "c229158eda8ae837146fe8adad847ddb",
"main.dart.js_56.part.js": "5a6af003ada7241de8230c2ea839947e",
"main.dart.js_57.part.js": "bb64853621749f387f05da408996c846",
"main.dart.js_58.part.js": "d52938c22c5398e4ec88b1820b983281",
"main.dart.js_59.part.js": "00d62a4436da6883edb3e55c8db5fa10",
"main.dart.js_60.part.js": "2130fdc4bb24fa6488901f9675932b56",
"main.dart.js_61.part.js": "a79e765d0529d76cda4ddf3d3488fd9d",
"main.dart.js_62.part.js": "b863ef108d6837f175d036374270ea59",
"main.dart.js_63.part.js": "6c07dc97befa38658b11fbfbd3ada459",
"main.dart.js_64.part.js": "cb531c514b8d022591c0fe05cf73cf48",
"main.dart.js_65.part.js": "1bbf53310e80175ebed476fd934042ae",
"main.dart.js_66.part.js": "e67a2bb1f4ad55f40ba859ddce1be1bd",
"main.dart.js_67.part.js": "64860f34b751195d00610a621ba336b6",
"main.dart.js_68.part.js": "18af5503630b808d56ab56f69b13ea18",
"main.dart.js_69.part.js": "0c6cbb25db59da41334a04cd2e1d0f30",
"main.dart.js_70.part.js": "f0149f9b7b39bc13be27d5d4917b3543",
"main.dart.js_71.part.js": "4559633117547127246991f3b6d4a264",
"main.dart.js_72.part.js": "60fbb5f7eca6a83b980269759129bdf9",
"main.dart.js_73.part.js": "c93785ec6094301426827e7befb64fe1",
"main.dart.js_74.part.js": "10c12af045f7eee364cebe2175dd2d81",
"main.dart.js_75.part.js": "c0af320a538cbc6959cd257805b7571f",
"main.dart.js_76.part.js": "c009022c7824b73095f07aeab223cd89",
"main.dart.js_77.part.js": "0323f3bbb5aceba485d86b7f636d2d53",
"main.dart.js_78.part.js": "f08f3cc7f3b36d6f822d3db487e20aba",
"main.dart.js_79.part.js": "f7a7d8eaf70a0d5751031d04ef909060",
"main.dart.js_8.part.js": "aca535a280686bcc2f7e3aa78a208b76",
"main.dart.js_80.part.js": "91930154a4261acfbd5c4d9071bce462",
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
"main.dart.js_91.part.js": "14c359f27768648f4f05a83d3102200e",
"main.dart.js_92.part.js": "a088c76759f4ca2c1ba73fa8f9fa1a03",
"main.dart.js_93.part.js": "74c4d92ccb1a689d25f10a65ae6c3c0b",
"main.dart.js_94.part.js": "f0fcb69d694ecc451b754f3ac446f93a",
"main.dart.js_95.part.js": "da613ebcbd72c6a5e04403226b18181f",
"main.dart.js_96.part.js": "47689f93dbe1ab590f727d8974644e87",
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
