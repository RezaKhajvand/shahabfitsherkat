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
"assets/NOTICES": "9595edaf64621b61e110bad90f653743",
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
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "ee2eafe50206919c9a1c0e0b756d75f4",
"index.html": "6ba02840ce6ab246f376fca2ad98af16",
"/": "6ba02840ce6ab246f376fca2ad98af16",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "a6f947d312587c1af69ed239714b7d01",
"main.dart.js_1.part.js": "2b7c4b76da49cf61cc9a11c6e6a7f24e",
"main.dart.js_10.part.js": "f6fce1d7aeb9315dbeee60a46bce2b29",
"main.dart.js_100.part.js": "5b2e16e02848d4dda426bcf35042d957",
"main.dart.js_101.part.js": "4d40236430cc4ce81585a63c3c522261",
"main.dart.js_102.part.js": "f2bfe7802c8d07b9f1be5145b2de57ec",
"main.dart.js_103.part.js": "1445589913387337f4a79b85857d97fc",
"main.dart.js_104.part.js": "e350351eab1c94ee8949a2e5affe7615",
"main.dart.js_105.part.js": "4786ab5eb8b6b2eda2946338bfd552d5",
"main.dart.js_106.part.js": "a21bff15c370fef1c06453f8685cbfc8",
"main.dart.js_108.part.js": "1d07b612685076ae8a55e3d9a8ad76d5",
"main.dart.js_109.part.js": "29e62976b27aa4e1f13eaaef2f4abe19",
"main.dart.js_11.part.js": "12fb45f49223699ea7c6ebb9cce2a681",
"main.dart.js_110.part.js": "acaadface24c98564a71dbaa62080d37",
"main.dart.js_111.part.js": "d6d54fb1a6d77745e1fd3abc0427cdd4",
"main.dart.js_112.part.js": "fe0b0d4b810097bd936d891052c65692",
"main.dart.js_113.part.js": "9fa6352509f9b09c798207d00e3a60df",
"main.dart.js_114.part.js": "5cf9573e978e800c35d90eade8c43e99",
"main.dart.js_115.part.js": "3e83c9493470bce68d4f994fe971dc7a",
"main.dart.js_116.part.js": "e3b6ec6b6832523f697b16f3bff42065",
"main.dart.js_117.part.js": "677dd78dc97c8f5a642401aed31e03f3",
"main.dart.js_12.part.js": "7b8934c1e281a960d27700d8ba6ceeaf",
"main.dart.js_120.part.js": "16bb30ce39687b07c9f514f75408d215",
"main.dart.js_121.part.js": "eca09edfd0719bf9afa6fc0d1e2960ad",
"main.dart.js_123.part.js": "570ddbb970af28ecb5535e62fad8a5d4",
"main.dart.js_124.part.js": "1fcbda05c482be430f97a456e2aa8c0b",
"main.dart.js_125.part.js": "b774f383fa4a53b6d5e738ce918b7518",
"main.dart.js_126.part.js": "4b3b093be775e51a3c017c15243c5a61",
"main.dart.js_127.part.js": "4d25269549d265d31b7074a209f71df7",
"main.dart.js_128.part.js": "9a7e0ece1a7ef56147caeec62b6fb77f",
"main.dart.js_129.part.js": "03f83326c46cf6df097a03dcc82995c1",
"main.dart.js_13.part.js": "f44bf3d06fe8ebbf80e5d856a6ff99ed",
"main.dart.js_131.part.js": "69b92946ebdc54f3612de35eb1b9b09a",
"main.dart.js_132.part.js": "35b6a59369f6764bdd1cc09b2ef042b0",
"main.dart.js_133.part.js": "488d2ba788954d1ee4d4cebc645721da",
"main.dart.js_134.part.js": "58484487fa5c6927fdd27d1952444ddd",
"main.dart.js_135.part.js": "c2f00efe1ac62abbc07ab86b1294dc40",
"main.dart.js_137.part.js": "b806e538852ed349189a8e592efd7644",
"main.dart.js_138.part.js": "351859bfe05247f6cf37005be4e43344",
"main.dart.js_139.part.js": "0bab68c72e426f91be48b0ae4808fe34",
"main.dart.js_14.part.js": "5286fa107b5f766f50980d4c58160495",
"main.dart.js_140.part.js": "e5a46b3f738abf475f4141104fd2c6d5",
"main.dart.js_141.part.js": "0e51d1b7a41d6da545b1227647744935",
"main.dart.js_142.part.js": "d838d0dee8ea708bc611c85b5672c30c",
"main.dart.js_143.part.js": "c8a7b488d2ff2d896dc1f7c63021fc32",
"main.dart.js_144.part.js": "cc4f06732ca1f0205f7bc37ac81dbc7e",
"main.dart.js_145.part.js": "511d80b62714e40e45323ee739431bb9",
"main.dart.js_146.part.js": "cf28db3a9a7593c5d5a7122c8b6c5607",
"main.dart.js_147.part.js": "508af221224d9e531cfe60d2a3aad9f7",
"main.dart.js_148.part.js": "74424288284c51f04b8e52efd632bc29",
"main.dart.js_149.part.js": "eb08df35e20aeccfdd926cc1e45456c3",
"main.dart.js_15.part.js": "ef801ed4b5bcf34465cdf58e7f0bd7f1",
"main.dart.js_16.part.js": "eff662a6ab568bf909a59867bcb162b8",
"main.dart.js_17.part.js": "1affaaa442594918deb34f96e3d9a30a",
"main.dart.js_18.part.js": "e5900109bd0dae6d1a86a734bc65f872",
"main.dart.js_19.part.js": "d685f6818203cc63017f9254c9014216",
"main.dart.js_2.part.js": "f3e117408f65814e23b998a12cc3b87f",
"main.dart.js_20.part.js": "d059c386d9eb746b2b2790b8fd263171",
"main.dart.js_21.part.js": "9cf4670040b635f0776571bee6211853",
"main.dart.js_22.part.js": "9164997cabae64aa96c2bd26c6f764b2",
"main.dart.js_23.part.js": "1e08fb501e40942e6b6fbe7283a6cd28",
"main.dart.js_24.part.js": "47ef72609ed5e51ab80092e030c57895",
"main.dart.js_25.part.js": "66e769c644af3b053e32114509504efe",
"main.dart.js_26.part.js": "06fbf7202a45518c3951522ae3977341",
"main.dart.js_27.part.js": "1259da799533b4b81dc916b23831e748",
"main.dart.js_28.part.js": "3cf87508a091f4693121850b002a7aa1",
"main.dart.js_29.part.js": "75016c56ad88e5004a3662d0c370d131",
"main.dart.js_30.part.js": "7e6332e107329be5595e5f54285e1ebb",
"main.dart.js_31.part.js": "5f6020a58a164d1575df42fdd2e5bd43",
"main.dart.js_32.part.js": "ed934149c8486b15ad02f1c9fbfb4636",
"main.dart.js_33.part.js": "99d0cf0dee886976b7054e531164c56a",
"main.dart.js_35.part.js": "af028aa89d2525c1ea323a10b8cfb16c",
"main.dart.js_36.part.js": "b10653ebf59d96cc5021ce398f8ce867",
"main.dart.js_37.part.js": "ace64380edd6a4e68a21d6f13adbbd3a",
"main.dart.js_38.part.js": "444be13c4598d6cf5ee02ab1b273c9b3",
"main.dart.js_39.part.js": "27e7d261d9cd4689c434ce2fdecd5e8a",
"main.dart.js_40.part.js": "bfd5e5bb20c3ab0841f5483dcb5d5ff2",
"main.dart.js_42.part.js": "62700324a8d527ca6af583acc245e02a",
"main.dart.js_43.part.js": "69313499e546d1ff9624859790720a21",
"main.dart.js_44.part.js": "efb3439bf049e00596a8a0572e2530db",
"main.dart.js_45.part.js": "ecb8e1fb4b6965c29813f77629232460",
"main.dart.js_47.part.js": "c118cbc64b6cb9eb96b45e6f20d05996",
"main.dart.js_48.part.js": "91a52837ced675167b166e6dbbf98b64",
"main.dart.js_49.part.js": "3b404824d8b842971205c5a3a82cf533",
"main.dart.js_50.part.js": "493d98ff74cbefd777213985b002931f",
"main.dart.js_51.part.js": "d475838a0922597dd49baa0c6ac57053",
"main.dart.js_54.part.js": "adc8fd6858078b0a4c6bc1c218ae318b",
"main.dart.js_55.part.js": "7891acec7de5b1e8561cf326c97bc4f6",
"main.dart.js_56.part.js": "1097849453e8f987601d40761cee7d56",
"main.dart.js_57.part.js": "a862c3e0f9eb01dfc8f00c5276211a6d",
"main.dart.js_59.part.js": "c64b42887df3582e45e0b5d645b16dfb",
"main.dart.js_60.part.js": "d86377a678ad82c7842943a88474e6c4",
"main.dart.js_61.part.js": "370d9fd3bec2ff28980f672396bf0dc3",
"main.dart.js_62.part.js": "b3adf27acb2c59d67dc33cbff2a1ab0d",
"main.dart.js_63.part.js": "9441a07a1b59a0b574455a4e9e3934a9",
"main.dart.js_65.part.js": "732f9dda62d7742dda38eb25d11f2b85",
"main.dart.js_66.part.js": "b94a95a62a4323762a4acba88f53e8e9",
"main.dart.js_67.part.js": "4055a9db2c1cefba4c4bdf90eb2bf2b1",
"main.dart.js_68.part.js": "4ec3776d9eb2b5e729ab0483e930ccec",
"main.dart.js_69.part.js": "a06a0e5c8ccc57cf12690c980bb4ccbf",
"main.dart.js_70.part.js": "af722d2ae0d6bb438bad982e6f779156",
"main.dart.js_71.part.js": "b095c340d7442e6c1d43a759ea9aef4b",
"main.dart.js_72.part.js": "fd37208976d4cbc33e8ca9211824cb38",
"main.dart.js_73.part.js": "87d77ea18a85c1bcc3cf4344cf75e8e8",
"main.dart.js_76.part.js": "416b940a8f62bdf0f548e6dfe7ba77a2",
"main.dart.js_77.part.js": "ee40439e2b9d35c3ded146a7a0e6e737",
"main.dart.js_78.part.js": "667e23adec80015beb5fdd1d90853902",
"main.dart.js_79.part.js": "d94e693dcdf7e107dffc26f1ce7af921",
"main.dart.js_8.part.js": "d0d31c39834d15902100950f52586f38",
"main.dart.js_80.part.js": "5c6372663e540921977771073ac05603",
"main.dart.js_81.part.js": "1b2c9e05889997e34de6b6f44c3b8c52",
"main.dart.js_83.part.js": "b5fb8b3d66d81ece25d0dcf1ed36f2ce",
"main.dart.js_84.part.js": "6c66d0a801a3aa36c606d9200130d649",
"main.dart.js_86.part.js": "e871108162fc575183a61c860c7a3bb2",
"main.dart.js_87.part.js": "f673c8a3cb03008c5f1eefd24b60102b",
"main.dart.js_89.part.js": "f1965ce657376abed56175b3f331c0b9",
"main.dart.js_90.part.js": "80941f641399954a7e2f860e3e507068",
"main.dart.js_91.part.js": "55dff410cc09a14d72fda35d82c91f37",
"main.dart.js_92.part.js": "653adcc2f1a51d76472371a914a8ca1e",
"main.dart.js_93.part.js": "8bf458140bd398d6d88efd79149b0bbc",
"main.dart.js_95.part.js": "dd5f11088773614f8b6bc87b7debc531",
"main.dart.js_96.part.js": "14b6edfd7f4f777fdf0224d70cca3437",
"main.dart.js_97.part.js": "1548e69562c3b45fe5e858ee1187abb7",
"main.dart.js_99.part.js": "ad02f62cd2aacb72fd6693a9fe8f8eae",
"main.dart.mjs": "8b88eaa629affe29b0b616a1a6c34e1f",
"main.dart.wasm": "383d2ef4f5c1040726287de35f441b42",
"main.dart.wasm.map": "7bd7932baa949fa7a924aa5e933229f2",
"manifest.json": "8d768b559482c977a9e78ca8ec688884",
"version.json": "8a1b4594ef7492e0e8b4c40f046bef6b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
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
