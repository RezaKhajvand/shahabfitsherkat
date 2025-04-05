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
"assets/NOTICES": "ef0120b67e62f0431eb5773968e338c8",
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
"flutter_bootstrap.js": "821cdee46e06f8f2a4bdf323713aa84b",
"index.html": "2475699671e62af3d3d365689e0d50a5",
"/": "2475699671e62af3d3d365689e0d50a5",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "1b878c0a083a0438fcce8cd4f2601f48",
"main.dart.js_1.part.js": "85220c6d2f7005eec5901198ac79a46f",
"main.dart.js_10.part.js": "eb93aed544738c7ce8080d2b7a8b07db",
"main.dart.js_100.part.js": "3b14be7acf59cba5507530974d88ccf9",
"main.dart.js_101.part.js": "900261ba3a43ff3005afe61cfa5da51f",
"main.dart.js_102.part.js": "da9e5f1d8aabb33575d0b6ea981d9064",
"main.dart.js_103.part.js": "b2cc64b993df00564ea6bc0665f7b605",
"main.dart.js_104.part.js": "590f8e984abb66f4881e205305e5a28b",
"main.dart.js_105.part.js": "fe4f9532f96a8d8d1aaa14c474d08294",
"main.dart.js_106.part.js": "78af96308505fda3bc9065a39434c474",
"main.dart.js_107.part.js": "cc2e4790d9f17e18ac4aa833221b1b78",
"main.dart.js_108.part.js": "584fe8fc3b5ccc64992a62b406e3eca0",
"main.dart.js_109.part.js": "096bc4258c1d6a0c019e97399073c8ae",
"main.dart.js_11.part.js": "fef91aea76206c338aedeae4a12fac11",
"main.dart.js_110.part.js": "54719b332b531d8c5d4224c588b37550",
"main.dart.js_111.part.js": "da5dd067b2cd462b99e8b77d35bb95b3",
"main.dart.js_112.part.js": "a75b8e865d0d04eac17cf684f1894e4d",
"main.dart.js_113.part.js": "3de6ffa8854ff3bc12cef84ed827d442",
"main.dart.js_114.part.js": "ff7a6cddc433cdf0403dd8bf6474219a",
"main.dart.js_115.part.js": "3c725d13f8f36a7da54f005fe81e08cf",
"main.dart.js_116.part.js": "48761b7bc1d175b3e2a4698fed9f4802",
"main.dart.js_117.part.js": "9dc491de4ca8c1fcce8d0c90d0a14177",
"main.dart.js_119.part.js": "ed1d725888de706029eae940387d5502",
"main.dart.js_12.part.js": "9cea7a165abeda2f3f15fdf059025574",
"main.dart.js_120.part.js": "bc470d61429c6832bff73f2b15fab3a8",
"main.dart.js_121.part.js": "b125deb649d1f62af19931291222b35c",
"main.dart.js_122.part.js": "e140a5dbeb981b383fc59259e8c55450",
"main.dart.js_123.part.js": "14672b17c2e73d1935e1a6193b2a28ab",
"main.dart.js_124.part.js": "0a48d3fa7df3418141a4e74ffe52b298",
"main.dart.js_125.part.js": "e9444dc14678151a286e85e391e225bc",
"main.dart.js_126.part.js": "b557771e4a1271a2eb10bcc4dd7b442f",
"main.dart.js_127.part.js": "8d668f0ebd927266c2730ef877f7a084",
"main.dart.js_128.part.js": "065a76cb7ee812a019955ea4acaafeda",
"main.dart.js_129.part.js": "433e59d6164cc74a77bf0297147881a8",
"main.dart.js_13.part.js": "f0fa33dd2b0ee9a586600c3965c59143",
"main.dart.js_130.part.js": "d771db28b909f2b66e221d6d5412d9ef",
"main.dart.js_131.part.js": "d0f2e40fa004261116e42d3a10120533",
"main.dart.js_132.part.js": "5abc03576dfeade34fb59722b0f54b4b",
"main.dart.js_133.part.js": "15a85d843fed02480d0ccd7f326bd574",
"main.dart.js_134.part.js": "223f52ac84fc30d706c86bf1cd92617a",
"main.dart.js_135.part.js": "4c220a10c9dc576606858ba1bc81e0e6",
"main.dart.js_136.part.js": "f3ceb5f677ca5883fe69632f3b0f129f",
"main.dart.js_137.part.js": "802c4d9ae05e613eff1c67a36d56f3b6",
"main.dart.js_138.part.js": "69e6660dfeb7d6ce579b29d153f7db83",
"main.dart.js_139.part.js": "4fa99dc44ff1c948b0488b063e394edd",
"main.dart.js_14.part.js": "350be93f5971af8a952f512fead93bbf",
"main.dart.js_140.part.js": "521ba37201dea04c75e62bb9bf4dfe7b",
"main.dart.js_141.part.js": "922e04edede0428340d2bb4d88dc2fda",
"main.dart.js_142.part.js": "13cbb932309ef41767de2219a1eff9e3",
"main.dart.js_143.part.js": "2504694ed914549876ab4899ef8a270a",
"main.dart.js_144.part.js": "4068d683c710990a3c56e1ea90d4574a",
"main.dart.js_145.part.js": "c00116f8aa36e00b3006fca4e2d1d5c4",
"main.dart.js_146.part.js": "dda6a20262261b6ad825ff1539ea2941",
"main.dart.js_147.part.js": "4910447594bdb5353dd237ee2470d6c1",
"main.dart.js_148.part.js": "381cab3445d01f6b579fe29c13999b5b",
"main.dart.js_149.part.js": "221dd1d505342836e8fd4955c4bd57f5",
"main.dart.js_15.part.js": "26e31622168d78b0918c417a0dc38847",
"main.dart.js_150.part.js": "23d3aec2122d9ad905d2d51b91e7e447",
"main.dart.js_151.part.js": "465bef377c9db9e6bf823c9e377a5059",
"main.dart.js_152.part.js": "20d868895b195d8540fbc6e9efc9f74f",
"main.dart.js_153.part.js": "1d26dfe6a4759dfd8ceebaded3b09199",
"main.dart.js_154.part.js": "d6521bb84ab99bfd12d22c25d5d0dd84",
"main.dart.js_16.part.js": "a3472b4e1a5caf8158b791361cab9c63",
"main.dart.js_17.part.js": "d13a402cc2d0d92f98afb3d96d1284d3",
"main.dart.js_18.part.js": "123342251b6cc3e71537719471767d80",
"main.dart.js_19.part.js": "a7861ce21399b8e6588177c907b57147",
"main.dart.js_2.part.js": "546a78f470382b0e975730dfb574676d",
"main.dart.js_20.part.js": "84cb5e00ed83c52e80520c67d9cbdfd3",
"main.dart.js_21.part.js": "0cab4da42e835a69623172488affe4b8",
"main.dart.js_22.part.js": "4201b1c5a3800f6928120dce84b541d2",
"main.dart.js_23.part.js": "310f1a1f6e0470fbaa214dfab8209962",
"main.dart.js_24.part.js": "c7393d2dd097cb8c693e7ee3b3ae88dc",
"main.dart.js_25.part.js": "be2e07ec41733e49619323397ed3abff",
"main.dart.js_26.part.js": "b307fc4c2af07bc1ecb067ac762caa6b",
"main.dart.js_27.part.js": "88881ba0886ffac18b3b4daef2e12bc2",
"main.dart.js_28.part.js": "3e433dbcfd710e8762f5ec99a3ff4cb1",
"main.dart.js_29.part.js": "28555369f26aa838ad06bae9839b10b5",
"main.dart.js_30.part.js": "ac58bb9919e73d6406d004b2c465b998",
"main.dart.js_31.part.js": "30bcd28b34db3be1f0a18a2530e44961",
"main.dart.js_32.part.js": "b5877505867f76d7b76918ce0df0757d",
"main.dart.js_33.part.js": "7b0e7c8d852ac807525b83d1ebd0b13d",
"main.dart.js_34.part.js": "33df8d1afa7899434390f16ac92a6b6e",
"main.dart.js_35.part.js": "c9bf37ef949ef7b74ae81d2f8b4ab818",
"main.dart.js_36.part.js": "31dd16cdc76c5f1056d4097697596dfd",
"main.dart.js_37.part.js": "1e72ecdb20924253bab2445f966248bf",
"main.dart.js_38.part.js": "8f0178ce598288e29b13a871005936ac",
"main.dart.js_39.part.js": "2f8b03478bbbe4ed81d398e687ed9140",
"main.dart.js_40.part.js": "9f6594a001ff93677b5655050f84a923",
"main.dart.js_41.part.js": "3e12ada9c6bf5f6f285d3dc7e04266fc",
"main.dart.js_42.part.js": "58ca14e93338e61b2b5702ba71caba1e",
"main.dart.js_43.part.js": "69a92bb686f643971204ca7f222247fe",
"main.dart.js_44.part.js": "139668051adf6d078665d4dc76585ad4",
"main.dart.js_45.part.js": "b826534d8c6e8c681fef7922f625ec97",
"main.dart.js_46.part.js": "d8620eb332157f84f96c04a2d51ce00b",
"main.dart.js_47.part.js": "57f992874e7eda0f9c4c9d8e46d32134",
"main.dart.js_48.part.js": "e19aacf35172050ee2a3bc70a8b0f237",
"main.dart.js_49.part.js": "de6571cc3e78e049c893bbc385992a07",
"main.dart.js_50.part.js": "3664ad26459ce98bd7ce3c4147dba8ac",
"main.dart.js_51.part.js": "473066e3aad66d3f1fb946da8f510d44",
"main.dart.js_52.part.js": "19cdd16d6f81cfc62d70badb51d0c56c",
"main.dart.js_53.part.js": "c4f26f0fd11a8668b3bab3a68fcdbab7",
"main.dart.js_54.part.js": "bb866280c6d3012d9810147d2b2b9d5f",
"main.dart.js_55.part.js": "24d59ddd191fc1e9187a90c14eba9c2c",
"main.dart.js_56.part.js": "b7ba0ba4cd08be30c8d254b2f4ad77fd",
"main.dart.js_57.part.js": "d3c7989c2956a62f7317c8441c37fd40",
"main.dart.js_58.part.js": "e376d8c47696d9887ede162a16e380a8",
"main.dart.js_59.part.js": "3c86f0a96be8deae5e54a158cd1a7860",
"main.dart.js_60.part.js": "dc0f96a369eccb65170e0b12e933c2cc",
"main.dart.js_61.part.js": "c463f7c6a24d9361ca5249a99a4f532b",
"main.dart.js_62.part.js": "bc8eee50c1f0899f71c0d35a4584a74a",
"main.dart.js_63.part.js": "ed6cb4f3ff6c25dc3784487011f43152",
"main.dart.js_64.part.js": "1566b31569abb8748e412c942dec6757",
"main.dart.js_65.part.js": "7dde99fb8b50ca1855bc4ca2c1cd7986",
"main.dart.js_66.part.js": "80f828585fc0df495e433122e30491b2",
"main.dart.js_67.part.js": "85c8b1fe28a1deeade6705436c417d6e",
"main.dart.js_68.part.js": "58114d310e4a9f4c540aa95c81b0af7c",
"main.dart.js_69.part.js": "7b1ba3a2e0f98dec4efe4c1f3d7727ce",
"main.dart.js_70.part.js": "0102fb27e51d0584471d7c83d2c9ac32",
"main.dart.js_71.part.js": "0fcf263aae3edef0c8a35a584bf8379a",
"main.dart.js_72.part.js": "0bacbed6481f4c2dd9bddf3e5a26be7e",
"main.dart.js_75.part.js": "c0af320a538cbc6959cd257805b7571f",
"main.dart.js_76.part.js": "106ce887a8970ef050aecfae23aea071",
"main.dart.js_77.part.js": "3368eb1f1c78dcb548bb697ef5bc3af5",
"main.dart.js_78.part.js": "7cb51e661e7623ab5598aa47ce7205a6",
"main.dart.js_79.part.js": "63522f52164eb63cf9c9f2383ecfc462",
"main.dart.js_8.part.js": "159bb387ea68cd6cbb173a1b22c92013",
"main.dart.js_80.part.js": "c2829a0760557e6a367d07c78c1ad802",
"main.dart.js_81.part.js": "24badb4e7ff6af853a518f280a91f9aa",
"main.dart.js_82.part.js": "d2a83c82e605c9eb16175c57286a2d52",
"main.dart.js_83.part.js": "42c63d642cff2a0b05cd447dcfbfc1c2",
"main.dart.js_84.part.js": "37596b242ac62172e4ef9987991cc3b1",
"main.dart.js_85.part.js": "049a25300f57bdbcc4f008e16cc2cb17",
"main.dart.js_86.part.js": "e3cd46f1329d61106ff398e4e3f787fb",
"main.dart.js_88.part.js": "6dee282e227f81c60fa1d4efcd5a51e9",
"main.dart.js_89.part.js": "5ef9e0017cc5320750b4454e101d5cc0",
"main.dart.js_90.part.js": "23ec0d33042780b7af93ecb1d10c84e2",
"main.dart.js_91.part.js": "425815d7886a185e84dddf742fc34dec",
"main.dart.js_92.part.js": "57005156004096cfdc9f95adb5dad78e",
"main.dart.js_93.part.js": "591f8cd4a796e847ad53e5b375a50672",
"main.dart.js_94.part.js": "439a9568e26d9849663d46f478dc7db4",
"main.dart.js_95.part.js": "5030b20387addb34f1055832ccac14a0",
"main.dart.js_96.part.js": "c623d0db52c49b2ec1bbc4a199aa54a9",
"main.dart.js_97.part.js": "7e06617c0aa2976108aa1b36851e2b52",
"main.dart.js_98.part.js": "6e1677f81a381f6924c28c211b1e69d9",
"main.dart.js_99.part.js": "1dbb7fc3e528b61c2d622901a6c2848a",
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
