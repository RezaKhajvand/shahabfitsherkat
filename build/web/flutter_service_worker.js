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
"assets/fonts/MaterialIcons-Regular.otf": "07cde29262bf5e9f291f2987c521d30a",
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
"assets/NOTICES": "84c84186ec59dc9167809cd620d66b2d",
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
"firebase-messaging-sw.js": "c341a6f1e5b82cc80415e49cadad636b",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "a72005a3c5b0dedcd3f6360cd7b4886f",
"index.html": "364f150fac6a1ed0245b7da23cac9780",
"/": "364f150fac6a1ed0245b7da23cac9780",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "d983a3556c0dea3545f16c5cc66bc298",
"main.dart.js_1.part.js": "8fa13294490b8c18a30ef9407ac310ff",
"main.dart.js_10.part.js": "0512773aa37a69d1c9d8afb5a6fa5581",
"main.dart.js_100.part.js": "5ecb35f7a0f3ed006261dbfe6fa94217",
"main.dart.js_101.part.js": "02a4c4a62703160007783182a7e43f4c",
"main.dart.js_102.part.js": "d1aa27a894633d181c1e1ea782f72fc6",
"main.dart.js_103.part.js": "425b13b6e757e48e04e60a099ae5e59f",
"main.dart.js_104.part.js": "c066e0c7adb5ed6390f352eea51d6a75",
"main.dart.js_105.part.js": "1a60b125272b8eb4186bc0e021d7e921",
"main.dart.js_106.part.js": "104cddc8af74ec1ac245ca2c6829569c",
"main.dart.js_107.part.js": "e4a9f39f3a4c6d5710d574d2bef7b4ba",
"main.dart.js_108.part.js": "80b29ec27c1185a1494d80d39c88eb02",
"main.dart.js_109.part.js": "a080a4bcc9ab634e1feb7a82ba8a96da",
"main.dart.js_11.part.js": "2dc170d34f89635cfd47efd72c4ee804",
"main.dart.js_110.part.js": "1aa2673fcb8172d73383cea16246feb2",
"main.dart.js_111.part.js": "0df28433e81ec9fecc85e8f2aa8fa087",
"main.dart.js_112.part.js": "aeacf5d08ca2914b72f7a4f7227ed714",
"main.dart.js_113.part.js": "6b040254828bb560a0ea65c4f6eceb6b",
"main.dart.js_114.part.js": "fde32237e3c69d31d002103362726394",
"main.dart.js_115.part.js": "cd44c254cef189fc108b26c191df21a9",
"main.dart.js_116.part.js": "bff8d22911f8c88be7a5a1f695ec5fb6",
"main.dart.js_117.part.js": "bce0479e5b8fe1c25b34da5804adb1a3",
"main.dart.js_118.part.js": "51910acd0af261bc6bcfd9a7da876714",
"main.dart.js_119.part.js": "2a9029ade95eb4a7e4cd3880586f7b7e",
"main.dart.js_12.part.js": "8246fabcf7268074c5531baae360b2a0",
"main.dart.js_120.part.js": "da160e30b0976886dd6beb1bbe7acbf2",
"main.dart.js_121.part.js": "da2f9d755319351014972e4ca11a0cf3",
"main.dart.js_122.part.js": "87ff3aadc50cff7a93bf3664632d4f1f",
"main.dart.js_123.part.js": "ce2ee0be0816b00ce9c315e2d833598c",
"main.dart.js_124.part.js": "505c6476b55d3efde5f4dc37323f57e8",
"main.dart.js_125.part.js": "5ccd2a6507390a0341158124b8d2a5a6",
"main.dart.js_126.part.js": "cc7daefeab09d3b514469188cdef1631",
"main.dart.js_127.part.js": "e2c5c9dbb93b41c7780dc1a04a9570d0",
"main.dart.js_128.part.js": "abaf01a8107f00d60eebddc470dc224b",
"main.dart.js_129.part.js": "0ed5f746c2fbb882a469e39b3aae4f02",
"main.dart.js_13.part.js": "d3a98babb41099d89a67fb55b99d67f1",
"main.dart.js_130.part.js": "a73692b1aa8ca92e8a9cba036497b569",
"main.dart.js_131.part.js": "7f85d60f4c55fa0dead671718687e090",
"main.dart.js_132.part.js": "de846d1977be7f5dfeead685d581b561",
"main.dart.js_133.part.js": "ad399cb1b322cd939411f125b5a0f021",
"main.dart.js_134.part.js": "8e880aacce70a6edc1bd3bb417be6dc1",
"main.dart.js_135.part.js": "73f7ff1139344d9cae5a8c8349e152de",
"main.dart.js_136.part.js": "66282810498f31efb1c892fad3daf088",
"main.dart.js_137.part.js": "ab85a07545e09374e760276fb650011f",
"main.dart.js_138.part.js": "0a977445e00333e5fe8d95f5af92dc90",
"main.dart.js_139.part.js": "68d39471f2ce34e17eac20483336cbac",
"main.dart.js_14.part.js": "5279b1287a3d1dc4ce1cf0d500aecb53",
"main.dart.js_140.part.js": "f166a4c2c3996ae2cbf1cae14c72fb2d",
"main.dart.js_141.part.js": "35b76021e854e52c0ff447c21a745c08",
"main.dart.js_142.part.js": "eb8ad429d430fbfad10140013e385457",
"main.dart.js_143.part.js": "336278a923c31843bc4335d1292b7dbf",
"main.dart.js_144.part.js": "4e5fc696afadff9301f779b3b17ed373",
"main.dart.js_145.part.js": "cc7f89c88a4331acdeafbda4a331b1f9",
"main.dart.js_146.part.js": "d8428c938acda11152d5057a3b5896b2",
"main.dart.js_147.part.js": "680bcc5bd6f29f9e7e042b4ab09061d8",
"main.dart.js_148.part.js": "4a02a95217500d86f7e8ea2d3b86ee7c",
"main.dart.js_149.part.js": "45ff62928dc8969f778180f17c8f1330",
"main.dart.js_15.part.js": "6007e0021e0cb9d207c1916f76d8a68c",
"main.dart.js_150.part.js": "940f4653a3c3184cf2590d18f95b9bc2",
"main.dart.js_151.part.js": "fd5a02bce98165326f70ebcca784eba2",
"main.dart.js_152.part.js": "590f391aecc2ad13c8748b307e96df50",
"main.dart.js_153.part.js": "ceeadba7feaf16cdd94e37ad4811fbce",
"main.dart.js_154.part.js": "a8f380d4756e31176150cebae55bd067",
"main.dart.js_155.part.js": "4ee84bd00c6729e37698fd6ec0f33a86",
"main.dart.js_156.part.js": "617b08496e87df46bdc761a1d547e0ba",
"main.dart.js_157.part.js": "00dacb5dcf83a80277f76efc503b3edf",
"main.dart.js_158.part.js": "9cce6e14d15f993604af3a506fcde10e",
"main.dart.js_16.part.js": "540de8bd93ed834a567887fb527288ce",
"main.dart.js_17.part.js": "c8133d6ecbf9d989b0c1955b92b3a49a",
"main.dart.js_18.part.js": "0d373b9c11acbadf824a16f00fb6c222",
"main.dart.js_19.part.js": "57def2334fd4c6b7ce799c9b2ec45cf6",
"main.dart.js_2.part.js": "13feadf0b16929a2a0a819487970a477",
"main.dart.js_20.part.js": "18b1885546c1f99968b6a591a4bb2b51",
"main.dart.js_21.part.js": "ba7a6a757d99ebed3f0fe278eff0963d",
"main.dart.js_22.part.js": "b45866d8ac1abfe7c70683393ab301f9",
"main.dart.js_23.part.js": "6ad2136968c1f6e2a4ffe7e9a1ad9cac",
"main.dart.js_24.part.js": "3dd6f31fc11afe79369b0cee769caf8f",
"main.dart.js_25.part.js": "3525a3cfb4f1e1ef00a0d892c7714423",
"main.dart.js_26.part.js": "6fad8e8ee433ef4a6d198de130e3ff02",
"main.dart.js_27.part.js": "5a2af85cbb2e64ad4d50516959ad6874",
"main.dart.js_28.part.js": "c78623e8c5726ce94ff77f5b8f7df199",
"main.dart.js_29.part.js": "12d6497b4d713f3c1ad08aa27730ecf1",
"main.dart.js_30.part.js": "37780fab0842f8a6895facce693cf83c",
"main.dart.js_31.part.js": "91053890c41a6907106b94a5ad82500c",
"main.dart.js_32.part.js": "0aee2b4c6cbf37d667d8787c794007a2",
"main.dart.js_33.part.js": "34401216b27635ff1a4928e446230761",
"main.dart.js_34.part.js": "7f12a78dd7f26495a37b43a7f98fe7b6",
"main.dart.js_35.part.js": "41c9c4b7135b24173de05c94839c60fe",
"main.dart.js_36.part.js": "12f96b6e26e43731b4a073b2cfb54f87",
"main.dart.js_37.part.js": "efeba96fe09a1faeb70b163375a665ae",
"main.dart.js_38.part.js": "b5db5fe9884f6bbd0fa1d8b8823c5724",
"main.dart.js_39.part.js": "db21d7571b9e7b3cb53a9622c9ecbb43",
"main.dart.js_4.part.js": "909ce85cfaab06b3ece1dba08caa4a9a",
"main.dart.js_40.part.js": "fafa6b45d08e9dbf105b9ec00e44ea42",
"main.dart.js_41.part.js": "7b1fbf8ce74debf8ec8fa06cce831f62",
"main.dart.js_42.part.js": "d17d6fb4c0d73f6a314037c3fb312e37",
"main.dart.js_43.part.js": "e47195e51837fbb5c7fc73f2e8d6df8d",
"main.dart.js_44.part.js": "621deed80b07b36fe551657a6ca92e07",
"main.dart.js_45.part.js": "eabc08b578d028394496c74c40128dcc",
"main.dart.js_46.part.js": "4a7f286e8bece82d281cd0c1aa089cf9",
"main.dart.js_47.part.js": "c408e5af224754c1d9f5c7504f7b837c",
"main.dart.js_48.part.js": "b7c86988658117e97020f6b7917d9e9c",
"main.dart.js_49.part.js": "8eedf380e7472d728ed20c67b08d94a2",
"main.dart.js_5.part.js": "1a5b83f578f4654f67bd2190a4f979f9",
"main.dart.js_50.part.js": "683571881b60c199fd9d80bd95eeeec9",
"main.dart.js_51.part.js": "0ded3c792e85295086dad5d74228400d",
"main.dart.js_52.part.js": "c2941e3a2dea8d5a480c069bb85eb428",
"main.dart.js_53.part.js": "aba9464eded0958bd62de0b46403d190",
"main.dart.js_54.part.js": "053668894a24f1f9772d51717cc7a880",
"main.dart.js_55.part.js": "e4fc267403b828236bdf5f5778fe8a0e",
"main.dart.js_56.part.js": "1f79696d6071ee093bd31ce716dbdf19",
"main.dart.js_57.part.js": "490458439984e7b00f56eb1166fb30a1",
"main.dart.js_58.part.js": "1eb69fa479a3ff071e61f0ff130120e3",
"main.dart.js_59.part.js": "fe05561acb1a09a2e6214c2a75427e9b",
"main.dart.js_6.part.js": "95fed7bfb270a41a6e22f2ef528abfa6",
"main.dart.js_60.part.js": "354a78d64168fb409b0fd940ff2963b2",
"main.dart.js_61.part.js": "984e0310bca3449545520acc451edbeb",
"main.dart.js_62.part.js": "b162f93d506e862c7be0066845e7f140",
"main.dart.js_63.part.js": "f9d101d691ec9b864299eb2fbb4aa883",
"main.dart.js_64.part.js": "fca9482b3e79d77a927d2e75b4ee59b2",
"main.dart.js_65.part.js": "178783900e1ab68fc38cedcf48ba3588",
"main.dart.js_66.part.js": "9603ab3fe9ffd70ee139d0332e66ae61",
"main.dart.js_67.part.js": "b227a01d4da90e80415ba1c71668176f",
"main.dart.js_68.part.js": "3156ed67bd38281574d80f6ff63f5efb",
"main.dart.js_69.part.js": "e4593a2f505564e0c13b92fb23987763",
"main.dart.js_7.part.js": "947fe3cd10768947e69c37acd084e070",
"main.dart.js_70.part.js": "05f2723d7ec4ea33b5819d747612ee88",
"main.dart.js_71.part.js": "231daa1e840658c4aa8aee0e3bb84398",
"main.dart.js_72.part.js": "8ff7d8ee29d79bb17e114ec07e234b56",
"main.dart.js_73.part.js": "e30dd977f30df2e8bd58203175f27c5f",
"main.dart.js_74.part.js": "47e4f6fd4ba6fb742fbc8a211fcd2071",
"main.dart.js_75.part.js": "d3f98d8627effa609e5def4ae56a1619",
"main.dart.js_76.part.js": "a5a408e2da73aa79430cdd6a42f1391f",
"main.dart.js_77.part.js": "33a5dc101753c4dfa85a4764f1235d5f",
"main.dart.js_78.part.js": "ee18830470d9149109aa3309ffebb94d",
"main.dart.js_79.part.js": "227ed9c49e8c852cd4241648fcd83d8c",
"main.dart.js_8.part.js": "eca823afe8c072f6b24829729e01433d",
"main.dart.js_80.part.js": "2b0d2f4a584927ff9d751adac4b60913",
"main.dart.js_81.part.js": "4a4b8a0d8bb72e5f58db9888fa4d2755",
"main.dart.js_82.part.js": "7a3f0175ff4510c573dec353ccb85e2c",
"main.dart.js_83.part.js": "2af35ddaf619e90808c3d570532ac389",
"main.dart.js_84.part.js": "c5e8a11bfdb218927d78c1aee2c036b7",
"main.dart.js_85.part.js": "a01e2310c4a63a11fdcddc0a24b7ea34",
"main.dart.js_86.part.js": "cf56b28740208d7888cc8a58864a4631",
"main.dart.js_87.part.js": "7331ff8b288e11acec710abfe17cb605",
"main.dart.js_88.part.js": "5f8f65c914908a1547023037628e73cb",
"main.dart.js_89.part.js": "f31e4fe3232b1febbfb6a4c6bbdc1670",
"main.dart.js_9.part.js": "9a7ab4243af77fd20fc0e7d760c061c1",
"main.dart.js_90.part.js": "b955763e7096df2e40ff2ce234718bbf",
"main.dart.js_91.part.js": "505aa04a8c3e916bf0042b638e47cd5f",
"main.dart.js_92.part.js": "9391ab9855ab9229c1f524e5a4971dc6",
"main.dart.js_93.part.js": "fc1b5490a99700bfed4032ccfe17d881",
"main.dart.js_94.part.js": "53d0fb154f897bd82ce81e3187aaa583",
"main.dart.js_95.part.js": "68fc2e775e2c8c0b538b2612f6d64bfe",
"main.dart.js_96.part.js": "4a2a6318a52b1421509acdba72c2ef91",
"main.dart.js_97.part.js": "dae8b0f3285821bff33d818bad38ea7f",
"main.dart.js_98.part.js": "33ca1fa177a38d252c4ba09f16c7ee75",
"main.dart.js_99.part.js": "4953bea5890e094b0c7c752f8dcd57b0",
"manifest.json": "dfca9b4de19072c53a1f836f42643995",
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
