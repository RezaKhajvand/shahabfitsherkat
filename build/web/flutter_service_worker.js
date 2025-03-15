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
"flutter_bootstrap.js": "f543b8a481bd22980a37ac3730702705",
"index.html": "eeacf0ced93c8fe9d5ae6fefbd0eb385",
"/": "eeacf0ced93c8fe9d5ae6fefbd0eb385",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "17f1cca097bdd649e7b057ccfe97a4bf",
"main.dart.js_1.part.js": "37e2258c1b6ed0a892c7c4f7d3cc7b3b",
"main.dart.js_10.part.js": "109074bdf2120641707f9a13c7cff9a3",
"main.dart.js_100.part.js": "e87f2d1cb0340f20a066701535991c28",
"main.dart.js_101.part.js": "a3f53b950757ce3c2f14f0878b921b72",
"main.dart.js_102.part.js": "1f6b7e4f0e7d4de5f0bae9bbeae176a5",
"main.dart.js_103.part.js": "05b0a9dfc053de931c7074c5bd86e0a8",
"main.dart.js_104.part.js": "33958981d3ec1990a93b24371d00e924",
"main.dart.js_105.part.js": "fdef5d42a82e9caf447a58ca24bc9151",
"main.dart.js_107.part.js": "7b3b1d67128593c90d4e03473471933c",
"main.dart.js_108.part.js": "250de76c6671197791b739e436d04827",
"main.dart.js_109.part.js": "77537604a68bbeba7abd3ee763bd55e4",
"main.dart.js_11.part.js": "67678ee487bc3317992154f2ef0792ba",
"main.dart.js_110.part.js": "648cf5735910696ac63aefe3df363c2a",
"main.dart.js_111.part.js": "2ad8c4d754d8d9ebf32ed251c0944c4c",
"main.dart.js_112.part.js": "fc604b9a89989c932523c847485dc9a2",
"main.dart.js_113.part.js": "a7b91ed949648a9df91841f9fb190a2f",
"main.dart.js_114.part.js": "2ed0f8ea53ad50aeaf8043319c6be59a",
"main.dart.js_115.part.js": "6502f7f1cc0b5a3a4753eca2838b2845",
"main.dart.js_116.part.js": "6852d00a23d4d54865459338709c2e50",
"main.dart.js_119.part.js": "fee09892d9c303dfae3dc1ee7f10e7e0",
"main.dart.js_12.part.js": "4550454649eabd35db7279382b09c737",
"main.dart.js_120.part.js": "57ea0399682044c9b1f1add662664e4b",
"main.dart.js_122.part.js": "e140a5dbeb981b383fc59259e8c55450",
"main.dart.js_123.part.js": "43c14b3ab5a42e20cefe3c93c8ebcc2a",
"main.dart.js_124.part.js": "770acfd29581680378a1e64b7876381f",
"main.dart.js_125.part.js": "b2a50d94de8c6aa6e3c09613e8c34fbc",
"main.dart.js_126.part.js": "df13428ebb4f9c9b6306e1cc9436918f",
"main.dart.js_127.part.js": "384bba923f24df1152c3f1b639ffdbc4",
"main.dart.js_128.part.js": "606eb47185f87f437f73791368a7bf01",
"main.dart.js_13.part.js": "fe4be06a2ab8e00268c2baffbf9e24fd",
"main.dart.js_130.part.js": "a260f22a8a6b8fd6784235cbe451e838",
"main.dart.js_131.part.js": "0c7dc363f6f619c170706e167dd291e7",
"main.dart.js_132.part.js": "64a8c70e143ecf170fac280d33a4243d",
"main.dart.js_133.part.js": "267408149ca53444b128008ed3ee8f7d",
"main.dart.js_134.part.js": "d8311aa4789d0e1ab3213589607333b5",
"main.dart.js_136.part.js": "8c8157f27b5fc0458089a2e48396b9ba",
"main.dart.js_137.part.js": "fcdbdab0af8a2eb4ff62d8076b5c036c",
"main.dart.js_138.part.js": "6e323c59f9b6c8aff2744978b0562a84",
"main.dart.js_139.part.js": "eb8510fe7b9ec049bd9abd5131a44e64",
"main.dart.js_14.part.js": "c5cbc9e4820486ac40d7a097ffd86360",
"main.dart.js_140.part.js": "74f22f1b1c4a656deda72f046d57bb7b",
"main.dart.js_141.part.js": "37efa94d9fb886b290822410113c0aea",
"main.dart.js_142.part.js": "754d6e6cb1ebe3214fd775f0ee72ceaf",
"main.dart.js_143.part.js": "a16449882052629f29f2538884d84c0b",
"main.dart.js_144.part.js": "2f8b99c766b992a1222d10067d3ac9bf",
"main.dart.js_145.part.js": "3ac7b109850750f46605c33c82c91bd8",
"main.dart.js_146.part.js": "57cb95d2e603c2166068f0ae1f3ff2ea",
"main.dart.js_147.part.js": "43dddda52c6f75702679bb63d0a2dbb9",
"main.dart.js_148.part.js": "c22d3327300a4f43fea0c1e1474388a2",
"main.dart.js_15.part.js": "d91c25c18cd0161fd68589d466443f5d",
"main.dart.js_16.part.js": "04cfc2a78e215bbb9109b28b274b2196",
"main.dart.js_17.part.js": "a7f25fb9ffd3013bc83babaaa8b045c3",
"main.dart.js_18.part.js": "8fee3b3f3121f66359f69a4ecda703f6",
"main.dart.js_19.part.js": "f3d1d9b25c57d10f730bd7c9eaaa9f59",
"main.dart.js_2.part.js": "e9467f5100c00f3ee1f27194d273458b",
"main.dart.js_20.part.js": "07db1c5e994f25a5d092b5e66203d26f",
"main.dart.js_21.part.js": "d9c98e64e65548a6361ff92299ebab50",
"main.dart.js_22.part.js": "0619c684ed4534db777f211b6cbc72e1",
"main.dart.js_23.part.js": "3c53e5167a41cb6310ce134ffc20deed",
"main.dart.js_24.part.js": "1aefa32214b76e97ae42a84a7ed3156a",
"main.dart.js_25.part.js": "69383fdaebbbf4b680a17201158eb23e",
"main.dart.js_26.part.js": "1de6d061d1fbce2ef3c853e3f4f92e51",
"main.dart.js_27.part.js": "1403ab717054a5d1cc898e0ac7c7e33f",
"main.dart.js_28.part.js": "eaf7ae29aeb890e102efaff28372a55b",
"main.dart.js_29.part.js": "2657bef3b5c8de6dcf425841264b70ac",
"main.dart.js_30.part.js": "fa1c8cfe201cec3239bcbbd4e74bcbbd",
"main.dart.js_31.part.js": "91f9f8b88887cd9237d059ad39504afe",
"main.dart.js_32.part.js": "9b2d596443f612fad13d5d8d564c50d8",
"main.dart.js_33.part.js": "3244c195c6b6f6e58332b5b5dd8bfbaf",
"main.dart.js_35.part.js": "2cd203de2638250fc57395ad2c31b8ba",
"main.dart.js_36.part.js": "463e02715b57ff33aaa179af7f70a15e",
"main.dart.js_37.part.js": "85ef0da2f4f59e02f82ca4d6047fce46",
"main.dart.js_38.part.js": "cab77d1be4fb2712ab86ab06f28d4b42",
"main.dart.js_39.part.js": "04caadd9c0464f3990ec56c057ba007b",
"main.dart.js_40.part.js": "4af3d754113ff64e10cc5b11b9008a37",
"main.dart.js_42.part.js": "f3449a43549da370bdb4cd9abe641e4a",
"main.dart.js_43.part.js": "771f561f4e515b407ddd729a54a3e6bd",
"main.dart.js_44.part.js": "48498627f377e39bdae51434df9dceda",
"main.dart.js_45.part.js": "13268a55fefa9ac07226e809065271b4",
"main.dart.js_47.part.js": "894b6a72e9ed6a1a2bb60ac8167c8b87",
"main.dart.js_48.part.js": "ecfdd2dd2efe8e0f63c6c0d91c936aaa",
"main.dart.js_49.part.js": "abf866c650da9e5bdcf5488142b06688",
"main.dart.js_50.part.js": "f268eec0aa6f7098be2743fdb18009f9",
"main.dart.js_51.part.js": "88e2bd6112e5dc992a9b78421d3b9668",
"main.dart.js_54.part.js": "d601bfa0817661561d0b5710c2ade46b",
"main.dart.js_55.part.js": "f364b0c9a2031b77b55cfaf3f811d424",
"main.dart.js_56.part.js": "ad29db73feb40a83fc673ea0b5d399e9",
"main.dart.js_58.part.js": "13be4041609f17dc059ea885b32b7ced",
"main.dart.js_59.part.js": "a8975b9a2184e7bc6009717a89362060",
"main.dart.js_60.part.js": "c921a1f287a1a0375b0719a1406e645e",
"main.dart.js_61.part.js": "b7445342b7db0496710eca46e360bcfa",
"main.dart.js_62.part.js": "84e6c0198afa3b324c3e7de478eb64cc",
"main.dart.js_64.part.js": "de21be62a2d2996ee8846baeac28693a",
"main.dart.js_65.part.js": "57fa245bfc464406011001f3e29e0056",
"main.dart.js_66.part.js": "f3a53b5db9d1850f305b2ea157dfc6e7",
"main.dart.js_67.part.js": "0786aac25bf43f6c415f3abe64a08e8d",
"main.dart.js_68.part.js": "d71a490558dcd5446c0a7316f8ea30c4",
"main.dart.js_69.part.js": "c3a89a959e26f5f0971de767994dfc8e",
"main.dart.js_70.part.js": "cea4dc4b28b027efd8a74ab7dd45becf",
"main.dart.js_71.part.js": "d3a00ac4560063bc9f6ebc88dde4ea5e",
"main.dart.js_72.part.js": "dfc3f9e720fe388867e3513e24fdddcc",
"main.dart.js_75.part.js": "95a4cf6750cdd58bb88a7b95194c3943",
"main.dart.js_76.part.js": "808cffea7caf2aad66cb9147db2ccd54",
"main.dart.js_77.part.js": "130a924a67a3e8a24db235fa712c010c",
"main.dart.js_78.part.js": "6f1ad17b5064d18eec6871f248abafb6",
"main.dart.js_79.part.js": "33bd06f1280d991fa5fec803e9ac15e2",
"main.dart.js_8.part.js": "8e467b2580e1a682646659871187258c",
"main.dart.js_80.part.js": "8a2053af11f5599b037022532de6a3ea",
"main.dart.js_82.part.js": "c23c44e85184887b6bd2e1d8070254ea",
"main.dart.js_83.part.js": "8e396b12c34e200c107a70a35caa407d",
"main.dart.js_85.part.js": "164c85a36194151105f73f769575f12f",
"main.dart.js_86.part.js": "db1dc40f83b5707d7b95ef1ca0ee953b",
"main.dart.js_88.part.js": "ceed1bea4e0380c8bd7cc18ae208382c",
"main.dart.js_89.part.js": "846f186841c316120d774b228599389c",
"main.dart.js_90.part.js": "6e98b40ccaad30d8b29a620c02b53f24",
"main.dart.js_91.part.js": "4739be3d39dfb7936912865c092c7f4e",
"main.dart.js_92.part.js": "feeb0c61da02e909d5998fb8e4b43c41",
"main.dart.js_94.part.js": "9369aa167bdc676bbfd889adce83429e",
"main.dart.js_95.part.js": "edd68d3e117d9cc0d426e6928310acda",
"main.dart.js_96.part.js": "31ec9acc21009d1d00b3bd1e06ab07a9",
"main.dart.js_98.part.js": "01aaa8083377a899d9de39b3b02f6edd",
"main.dart.js_99.part.js": "3f7c90d699b3a9ae5f072c73bd28be87",
"manifest.json": "6dcedccaee5b39c99f8ac5f2020acf95",
"service-worker.js": "274893b21cf07c0efecd7e3791779336",
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
