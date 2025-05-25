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
"assets/fonts/MaterialIcons-Regular.otf": "4b1f6ff1f1753095605b01dd7ccf9053",
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
"flutter_bootstrap.js": "5667c9101d23dd23c863b607f52483e3",
"index.html": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"/": "e8d0b066d7f24afa3eaa65c8e35fe8c7",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "bbc0662543c5422f38fa5e189b95b655",
"main.dart.js_1.part.js": "cd366b19e06be48adf594ed7e4b0b039",
"main.dart.js_10.part.js": "2660538fd9429326d976907c0bbb6285",
"main.dart.js_100.part.js": "15dead7f159f76a807306d2fe55fdbb9",
"main.dart.js_101.part.js": "9b7bcdaccd4f84afb684f6ebbbb34906",
"main.dart.js_102.part.js": "6b2ab4db3d5a17e1dd3ed63ae40ebedf",
"main.dart.js_103.part.js": "e5c117de4498f449cc2344fc6fd7e9e0",
"main.dart.js_104.part.js": "f84f1c001f78697da1eb9a05028cdc7b",
"main.dart.js_105.part.js": "ae03fbc2d8f0fd6a2d9471be4834fd43",
"main.dart.js_106.part.js": "c73ad228a8a141a8868afb0e626adeb0",
"main.dart.js_107.part.js": "c1d3dfb93869cbda2967763803fbaff7",
"main.dart.js_108.part.js": "de6b7e930f1c5af18184f990ecdb5000",
"main.dart.js_109.part.js": "1013ed88cae2933907c7325809797a8c",
"main.dart.js_11.part.js": "33314482d2ec4e83b131d648363ec2b0",
"main.dart.js_110.part.js": "bc3bd3582f7110b0d4fb4730cc45615d",
"main.dart.js_111.part.js": "212ad1ce938089a81df328b8c4245048",
"main.dart.js_112.part.js": "8aa459d0b27f063cec1e143447d82f7d",
"main.dart.js_113.part.js": "99bcd88a4f9a1d80f27bdf8ce97163fb",
"main.dart.js_114.part.js": "7d1846e7ebd03707fecf2b657ae700f0",
"main.dart.js_115.part.js": "11d05fc6974cc0a3497bb10e0fa2ca69",
"main.dart.js_116.part.js": "c5d07239de285eb9c69a7a650b3635ed",
"main.dart.js_117.part.js": "cd160e9600da38a3b4f5bce305202bed",
"main.dart.js_118.part.js": "6a20043d88e6d2530a9d05c763f5ba88",
"main.dart.js_119.part.js": "5d1a1054f0c51cd34d000e8cdddec7be",
"main.dart.js_12.part.js": "6cd325ca7b88ec6f020781cf782a7ed5",
"main.dart.js_120.part.js": "7126c88a33c48464f459e1017435eec5",
"main.dart.js_121.part.js": "87e7185bfcab78e267d03a0bf2334a4d",
"main.dart.js_122.part.js": "7dce3c20c10cb61a60af8321344e0a42",
"main.dart.js_123.part.js": "00526fcb400e6d0d32d05923bd9e53f5",
"main.dart.js_124.part.js": "d67d3176311b470f52000fd593b7ad4a",
"main.dart.js_125.part.js": "ef118bdcd06266cd3c59055e28896a67",
"main.dart.js_126.part.js": "1623d416720ab28c269f2870dfb30b2a",
"main.dart.js_127.part.js": "80c08a5a31785bb507b035c73c4a102f",
"main.dart.js_128.part.js": "eebeaef1ea5133b2c9aa97d40261c441",
"main.dart.js_129.part.js": "107a893dcae4c7e98b5eab1dcc9eb497",
"main.dart.js_13.part.js": "84ac0d8b7e02661da8020ff44746586a",
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
"main.dart.js_14.part.js": "6ad68f9ce87b9cf6ed75d20d53810119",
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
"main.dart.js_15.part.js": "2357a3f46f849bc0964063a4131e0a95",
"main.dart.js_150.part.js": "61053dc835aa271166c4c8c6b7da4710",
"main.dart.js_151.part.js": "d61d23862c54ff52e19049b715090dab",
"main.dart.js_152.part.js": "b161221183d54db780e02186bb6cbbab",
"main.dart.js_153.part.js": "0aefaf934ad4e224db88a5800b101134",
"main.dart.js_154.part.js": "7a9ab0ce4c1d132e5fd71eb0fdd91fd2",
"main.dart.js_155.part.js": "4571ab3aa177fd45b441988a874bc8d8",
"main.dart.js_156.part.js": "ffa5287a3edafa4a0f2415558844724e",
"main.dart.js_157.part.js": "e76718a5aab25a926ddfed7488505945",
"main.dart.js_158.part.js": "5927f49723659928695541eac184d822",
"main.dart.js_16.part.js": "d34f6fa956144aaa8dbecb25aa2dad91",
"main.dart.js_17.part.js": "affa237824a44903e24261bd37baa263",
"main.dart.js_18.part.js": "35f36210aa8369bbf1838e2314192ec8",
"main.dart.js_19.part.js": "813f211b1e67cb03a626cdfa48180d17",
"main.dart.js_2.part.js": "56ad3dbeab82ee15df18fb82b72c8114",
"main.dart.js_20.part.js": "ce71ff7a73d10d70ca9bc23f16f04625",
"main.dart.js_21.part.js": "922645105f65024e34435a613575f237",
"main.dart.js_22.part.js": "58c42f336cd18bd40f6f1d26c4aff7b2",
"main.dart.js_23.part.js": "d26a49ae054a3536b09ae34a756ff007",
"main.dart.js_24.part.js": "357c14f24cc2fb19b7cf49d78161cf1f",
"main.dart.js_25.part.js": "a80d8195ef98c8460da58cc4048ad7f2",
"main.dart.js_26.part.js": "80e1f4c1ac499417a9b29f8c648707ff",
"main.dart.js_27.part.js": "e6f0174f4bd0f90525e489914bdc3fe4",
"main.dart.js_28.part.js": "0ee5c3e2dfb22ac039571e217719e2ff",
"main.dart.js_29.part.js": "50b8dc25acbcacd3aedc17f6f7c35a68",
"main.dart.js_30.part.js": "cf753a3b8e3dca03ecded1e2849425b3",
"main.dart.js_31.part.js": "21022b0d2bbf5d6c11fc06348562f6eb",
"main.dart.js_32.part.js": "a80317eeb167720ec7f0359953e447fa",
"main.dart.js_33.part.js": "0b389d8224711211d815a5bf1c060805",
"main.dart.js_34.part.js": "d9bd352338bf0f517d3473af68efa389",
"main.dart.js_35.part.js": "ba4b19b09f730f36c190c0b6587e6e97",
"main.dart.js_36.part.js": "a30ba660776c9cc8c6f8a244f9b2b433",
"main.dart.js_37.part.js": "85780ecb1fb5edaa575d16173f7bc818",
"main.dart.js_38.part.js": "6679746ed36b19c36c397d28e0ee34ff",
"main.dart.js_39.part.js": "e2bc084e02aa357c375a5a08923ab04e",
"main.dart.js_4.part.js": "c7326c33b7e1eecd9f9e9e3b2b48c967",
"main.dart.js_40.part.js": "90006bd59ff048cd16d95f18d20a70b0",
"main.dart.js_41.part.js": "49fe8fe63a04c302e842be035f6a2d0a",
"main.dart.js_42.part.js": "80d2e510e4bc779402e404b70c9ea6ae",
"main.dart.js_43.part.js": "498a8ab97ea6a4ab899ad5cf249874a4",
"main.dart.js_44.part.js": "5e5d58a62505eaef03edbc606c7d81c8",
"main.dart.js_45.part.js": "02768fb7ea76328978beeea39d91fa9c",
"main.dart.js_46.part.js": "5f97aed14499f464146ad06b07ca2e7c",
"main.dart.js_47.part.js": "2643581bae0a53f651bf6df95e0777d8",
"main.dart.js_48.part.js": "d2929508e760132d14e858a46011ec67",
"main.dart.js_49.part.js": "446a506bddcf288343b4c06e2ca22860",
"main.dart.js_5.part.js": "edfdcc5141391819f42c50d18d5454f7",
"main.dart.js_50.part.js": "1cf4efce250bd01bf6b4154136f24dda",
"main.dart.js_51.part.js": "f977cc17ec1d54ef988cd91bfb7031f1",
"main.dart.js_52.part.js": "1986b52ad2617aba13053142fb2dee7d",
"main.dart.js_53.part.js": "715e1fbdcc3b1280b7b3ada098a6dd09",
"main.dart.js_54.part.js": "04c8155fc79643e636109913c34b7fa3",
"main.dart.js_55.part.js": "a240c2d29fd9d828eb684466c0627061",
"main.dart.js_56.part.js": "5a6af003ada7241de8230c2ea839947e",
"main.dart.js_57.part.js": "5cf0121f5432ff17df59a0f9b6910828",
"main.dart.js_58.part.js": "00323b9e6be1c3868d75c90b160f2f3f",
"main.dart.js_59.part.js": "8ca05758373f48c7d7087fcebd922d84",
"main.dart.js_6.part.js": "ab98fbcac2e6a99477c3ab2fbbce391d",
"main.dart.js_60.part.js": "1639dcd02131a64e2028269c5c6aa492",
"main.dart.js_61.part.js": "d22bbe3055993cd75aa4635e828b44fa",
"main.dart.js_62.part.js": "60d8d4997d7ff58303f7d651d816e04b",
"main.dart.js_63.part.js": "589899538632210863785c8254b51871",
"main.dart.js_64.part.js": "a1bd99616aec677f10cc086c8c288d87",
"main.dart.js_65.part.js": "23368df0ef208012a8cd1723e3330a58",
"main.dart.js_66.part.js": "fedfe9f1f5fc125821f0c1a101dc4c6e",
"main.dart.js_67.part.js": "39d8af313274f61437ec81105683295d",
"main.dart.js_68.part.js": "8bdbe92f97fb0b14fcd6a2d8e2d6c2ef",
"main.dart.js_69.part.js": "3d1ce122a2c0bed34580ac32d7029203",
"main.dart.js_7.part.js": "69bc3052b419f63ba597ca04998226d1",
"main.dart.js_70.part.js": "559dd8894c95e34ffde5079e528562c4",
"main.dart.js_71.part.js": "d92895748ad931bca5b78eecd53cef26",
"main.dart.js_72.part.js": "70e941c504cf0774936a517e66cc133f",
"main.dart.js_73.part.js": "752b1c094c288c43a6ce2866f627ce36",
"main.dart.js_74.part.js": "76372b741278837a49c30a847ca5396a",
"main.dart.js_75.part.js": "1d04a3135b52c75075f89abe0acdf63e",
"main.dart.js_76.part.js": "8bd23910fcb6f5797ef9b27881168dd0",
"main.dart.js_77.part.js": "bc8d2cd338d488fe63c7e5af23517c6e",
"main.dart.js_78.part.js": "db20674232cc37e1e89cffddf63d22d6",
"main.dart.js_79.part.js": "c6e3fdeb29b5fc4431703155a379e408",
"main.dart.js_8.part.js": "d3e1eaeee722229dea999f7c17e1bea2",
"main.dart.js_80.part.js": "afd626af2739acceaf82a5a02b569f10",
"main.dart.js_81.part.js": "1c394c8ba231f9f95fbfac82b2fe43e0",
"main.dart.js_82.part.js": "039d51d69b8fd4619e7bfb8740802822",
"main.dart.js_83.part.js": "097f6dc6596ec27b871d38431169a32f",
"main.dart.js_84.part.js": "98f10d3fce0c1df7fd5d6e336397f34a",
"main.dart.js_85.part.js": "4431f7120d502b7dcf9c62947fbd31ee",
"main.dart.js_86.part.js": "5c3e60efcb7a0ae949441440aeec71c9",
"main.dart.js_87.part.js": "3845b9d69b41d9889e28207600447051",
"main.dart.js_88.part.js": "f6ce418206d96d253c497704e0bab422",
"main.dart.js_89.part.js": "a0ddae4e62e7c83095c80bf625155184",
"main.dart.js_9.part.js": "2209d4c0ec91df032ef6689ac8989166",
"main.dart.js_90.part.js": "ba6bc90f74a0a47296f71719afb1d8ec",
"main.dart.js_91.part.js": "cc61980126fb4c5233d115300dc19a6a",
"main.dart.js_92.part.js": "44339d002309e44052606dcf9152aecf",
"main.dart.js_93.part.js": "aed500b377aa1beaf0eb1eb5f661170d",
"main.dart.js_94.part.js": "04e6fb2666cd5316c609ac43c40b5649",
"main.dart.js_95.part.js": "f559b8ceda69ebb977eb017b97d395c1",
"main.dart.js_96.part.js": "b3ae18c91f98f84634829d8dc4e2e308",
"main.dart.js_97.part.js": "f4f4478c962f647dd242a09e9578791c",
"main.dart.js_98.part.js": "14bedbf48f25befef627916610c3ab96",
"main.dart.js_99.part.js": "d56bbc721abd7dd6e9ae07c472084005",
"manifest.json": "71920cf7ba7ac8df30be14f35e0e0231",
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
