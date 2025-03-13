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
"assets/fonts/MaterialIcons-Regular.otf": "b4e91dca122ea8a07e81c034c6caad81",
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
"assets/NOTICES": "b9054f85446d896849bd08ee24f4b0ae",
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
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "38a53bf5bbc2ba1679b5fba2e6be62af",
"index.html": "30a960730bae9399164ce477cd55b33e",
"/": "30a960730bae9399164ce477cd55b33e",
"logo.png": "e0c387db7ef131864d40b3df83d4432a",
"main.dart.js": "675d5417c86712d443720c52d49d6b83",
"main.dart.js_1.part.js": "6d79d6d02094d81c1c653e52bcb7d991",
"main.dart.js_10.part.js": "6d7d9dfaffb0c67103321c13594be2e8",
"main.dart.js_100.part.js": "4dd93ff9786b0a135203942166a1e9d8",
"main.dart.js_101.part.js": "2d4ac6463d8ac4ab06aafe07dbb00081",
"main.dart.js_102.part.js": "cdeccb3c6da34236a8f973cfffb43695",
"main.dart.js_103.part.js": "fd97f24c8ab9c7c90d4f1f479499bbea",
"main.dart.js_104.part.js": "5403269e5650bde0a66b594b78a8ff0c",
"main.dart.js_105.part.js": "28bb8c763f9a044a475b8571cca24980",
"main.dart.js_106.part.js": "6c7ee14df0e5b0da527edd3c07ff22aa",
"main.dart.js_107.part.js": "6b170b58654750aaf53110f52fe85d77",
"main.dart.js_108.part.js": "714e8d1567068d78ec88b0b632d1bc12",
"main.dart.js_109.part.js": "c0acb80ebf9c2444fdf03895a4852f08",
"main.dart.js_11.part.js": "fe594d3115aa3b0388a83d35919f6f8a",
"main.dart.js_110.part.js": "38cbe587d7e4d1d8bd5b442b1a2ea31a",
"main.dart.js_111.part.js": "79358a8b374a8b5aedda797e7a6bdd36",
"main.dart.js_112.part.js": "7518e060df5e74891379fd778c3d5302",
"main.dart.js_113.part.js": "3eab871108321fca1dccc2946f170f85",
"main.dart.js_114.part.js": "0ba74b5b34e2bfb780b8986d093d1ca3",
"main.dart.js_115.part.js": "0b74d4bd70c337e446399c20b3c08251",
"main.dart.js_116.part.js": "b9b192fd74f1c5561bdaf54b83e6ed87",
"main.dart.js_118.part.js": "941a7d3a03ae98aa07cf39d75ebd950f",
"main.dart.js_119.part.js": "5780799fab5c37c4cf1a4673b2d372f6",
"main.dart.js_12.part.js": "5921135027ec57323ae5c6f2f8c672e3",
"main.dart.js_120.part.js": "842230b2c46ec1352bb0d313e05b12ed",
"main.dart.js_121.part.js": "8c0e629167e0f8628bd1a8e1ad480682",
"main.dart.js_122.part.js": "e5032ddd09da8369d64a0523c424b576",
"main.dart.js_123.part.js": "e2836b33acaa2187205ae98ed4e205be",
"main.dart.js_124.part.js": "e931aa5cf2584373d7953da99e50a73f",
"main.dart.js_125.part.js": "cc984af36e382c4b0bd6ee3335d17209",
"main.dart.js_126.part.js": "e29c1d9c50ddc7adcaeeffc81e709a6a",
"main.dart.js_127.part.js": "c28c275081d37a6d86d1b81d40eb6b0f",
"main.dart.js_128.part.js": "91e2c919ec811df711af2fa99338c020",
"main.dart.js_129.part.js": "f98654f50dc227c30464dac21410e58b",
"main.dart.js_13.part.js": "93e13383a9be015d8f0e082c57d85a5a",
"main.dart.js_130.part.js": "fc91b378cae4a37bcee55f80934a3b50",
"main.dart.js_131.part.js": "db126c2bfaa53cf3417fbf00450f1fb0",
"main.dart.js_132.part.js": "efc52fbc15db38cb2c959edda276a7be",
"main.dart.js_133.part.js": "3d5cb77dd25eb6a02a68b33107ece342",
"main.dart.js_134.part.js": "8f2433a9a15bf99b5f136e8261711e6e",
"main.dart.js_135.part.js": "64b6958dcee11bb5f184757fba064c02",
"main.dart.js_136.part.js": "598cec173ac72f7ec0313bb808081091",
"main.dart.js_137.part.js": "848361c8052c0f6bd1bdb7476c6ea333",
"main.dart.js_138.part.js": "d5760df21f84a9926752ec794e242f61",
"main.dart.js_139.part.js": "773c7328b15444dca3a0dda412d0ed47",
"main.dart.js_14.part.js": "f8bd6636e9e4bd164e2e6abf64801375",
"main.dart.js_140.part.js": "d9ecc08e9efbfd29dfa02f5a7039e815",
"main.dart.js_141.part.js": "2f0132c3876f7a0f7680ce909a157d30",
"main.dart.js_142.part.js": "5f720997c7e3e8bf5535540c84f3cee0",
"main.dart.js_143.part.js": "3f22bd9fe72dfd2af3115575f89ba888",
"main.dart.js_144.part.js": "8e77546af4450cf00ef6ea895e08b33d",
"main.dart.js_145.part.js": "15fbc0b35fd845d472a5eb114a323277",
"main.dart.js_146.part.js": "5e1c48975c056eb09f82587cf882b82f",
"main.dart.js_147.part.js": "7608e4dae458721683acf9dbd8fe74b6",
"main.dart.js_148.part.js": "12ac473456b3118ea8c4a32eb5f2b92b",
"main.dart.js_15.part.js": "a10460bc7649e5bf4ea1d19869450f82",
"main.dart.js_16.part.js": "3f89d726b49a0e1392f6be86709f2ed0",
"main.dart.js_17.part.js": "02787c934ba7374acaeb42a61bc27f60",
"main.dart.js_18.part.js": "4ae36cd315a1a74c14aff3e1ce28f611",
"main.dart.js_19.part.js": "dd032fc0faa65994ad8137cbd9b04871",
"main.dart.js_2.part.js": "21a4aba3dd1c8f0fca948faf5dce777a",
"main.dart.js_20.part.js": "ec54dd4b37864af8a48e5cb1ec788340",
"main.dart.js_21.part.js": "450b455893c42d3f66e9a1ea1130bca8",
"main.dart.js_22.part.js": "f835afb0fd4f75146ffd078a3c6588b2",
"main.dart.js_23.part.js": "c2c80c5295bfc003c03e780703e7d0cf",
"main.dart.js_24.part.js": "91aece85232e1d4d4ecff17011c5b283",
"main.dart.js_25.part.js": "83a647eeb299be5262b020989a3339e0",
"main.dart.js_26.part.js": "b56a398124abbeec0e9ab9b0de8415ce",
"main.dart.js_27.part.js": "5ecc7c0bb345b6a3c892cb166b85d75a",
"main.dart.js_28.part.js": "cb11eb5a89182a98c32d4d5213f0c1d5",
"main.dart.js_29.part.js": "72f58413b4f5bedcc7ae2fcb98163862",
"main.dart.js_30.part.js": "4bb71fe8e9b25b88a83f944abb46d269",
"main.dart.js_31.part.js": "b2fcfa5dea822c6eb6eb1e95390ba6e7",
"main.dart.js_32.part.js": "80933613c2658503174b9108c14697a3",
"main.dart.js_33.part.js": "4bc0c1909f6e497126a36725be109686",
"main.dart.js_34.part.js": "b9ada568e741de658a512de49a069937",
"main.dart.js_36.part.js": "ab68e3606a96a79a5736e8a294269b8e",
"main.dart.js_37.part.js": "73148147d3d2ae031e1a94c389436532",
"main.dart.js_38.part.js": "6dcbf92ef65de52f672f1d150224d56a",
"main.dart.js_39.part.js": "0037a6c0eec816772a899e218d2e6790",
"main.dart.js_40.part.js": "d83baa487ab71e0b7af47bacfb3da4c8",
"main.dart.js_41.part.js": "4dacce468492ccd5da6115f32acf9ab3",
"main.dart.js_43.part.js": "057b176b61b993b525245e82294474b8",
"main.dart.js_44.part.js": "961a0e5eb8b81b53529ca535b816f144",
"main.dart.js_45.part.js": "9b8e45dca0c0bdf7aa402df5f807bbb8",
"main.dart.js_46.part.js": "2739728b05eebf1afdc049099a2aff58",
"main.dart.js_47.part.js": "6dc9fb53bf15c6b94bbaae2d93fd9453",
"main.dart.js_48.part.js": "917bbc344e5a437119202d26af24f6ab",
"main.dart.js_49.part.js": "e2577980c298258c038a4c8a9e9bffb0",
"main.dart.js_50.part.js": "3a808e5b327e57a1bf23ae211d0fe088",
"main.dart.js_51.part.js": "47771b46e73549bef5ebde8272f14ccf",
"main.dart.js_54.part.js": "812733150777f1333cd44d9a616d10be",
"main.dart.js_55.part.js": "31b2e0a2b2e8ada69654e10a0bdd8ab8",
"main.dart.js_56.part.js": "20540eb088d004bd1c6ed63df4b4d2b0",
"main.dart.js_57.part.js": "c045d297be603bd094e95fa59a3b5f5c",
"main.dart.js_58.part.js": "d323494bdab1300506b5b8b4df731ef4",
"main.dart.js_59.part.js": "0a314936ff19e7bb5b94a7284436396e",
"main.dart.js_60.part.js": "8f6bd24b81a860570338aca9c56e4152",
"main.dart.js_61.part.js": "cecd15c9bf0a0be71d1eada39a6e75f8",
"main.dart.js_62.part.js": "f1553420fdc63216db70a2f38beaae89",
"main.dart.js_63.part.js": "6a9dae66ef18b54e541d0762d057988d",
"main.dart.js_64.part.js": "4dd315d3b4c6a31b520a400461023548",
"main.dart.js_65.part.js": "bee5095923c4a0f59f5ba999b06716ef",
"main.dart.js_66.part.js": "3b4a170d142ee84d79fc1280ec73b3c4",
"main.dart.js_67.part.js": "1c978d29788207ca5b709181ec4ffeb4",
"main.dart.js_68.part.js": "42c56c71ed584d030dc17e1ba41da256",
"main.dart.js_69.part.js": "bcb2372f0138de450bb0ba8b75225aa3",
"main.dart.js_70.part.js": "62b5fbb846a4f16248c140bca1d9e01a",
"main.dart.js_71.part.js": "caefdbfb95f8c2f57399f49d4e2aacac",
"main.dart.js_72.part.js": "01bdc4bdfc4e11f7f1af25886b6f80eb",
"main.dart.js_73.part.js": "8a840f32200052dda3c3fc8615e890cc",
"main.dart.js_75.part.js": "a5bac8d8dcbe518f0e6dfa13ce23ba38",
"main.dart.js_76.part.js": "f463d17adf6895b4d3e2dcb9b1dbc64b",
"main.dart.js_77.part.js": "dbf789cf9d1fa9487669e4f3bdfca59b",
"main.dart.js_78.part.js": "a106ef892b50139ed3bf63e853d1bd83",
"main.dart.js_79.part.js": "b448bf753b64d54b1a26c8f3cdc7c955",
"main.dart.js_8.part.js": "21085369c797cc0525d243a31267a8e1",
"main.dart.js_80.part.js": "8c9500a1052acef67a80e78435eeea53",
"main.dart.js_81.part.js": "5fc56f2c178bb9579afe5f3d7f7d129c",
"main.dart.js_82.part.js": "f2651754d31eb5310665f56bb5c8647f",
"main.dart.js_83.part.js": "9d59a489f63f71fb9cafe1c4d05e23b8",
"main.dart.js_84.part.js": "30a525e757b0054093cdb7c923bfba6b",
"main.dart.js_85.part.js": "b488f1086b116bf94decafe09e4b90fd",
"main.dart.js_86.part.js": "14695aca61ffb840c1e5c3ad61c9c5fb",
"main.dart.js_87.part.js": "0925714a37478e4c54729af2ebfd65c6",
"main.dart.js_88.part.js": "e538358b622a1e6e68a6bfcc0035869c",
"main.dart.js_89.part.js": "4ce212b2725942f4a6d7f4a0b90d2417",
"main.dart.js_90.part.js": "e007dccf9a0a7291902b766041bacbe4",
"main.dart.js_91.part.js": "219cb74735d60cc6284909c7b53490aa",
"main.dart.js_92.part.js": "b1f802b5509821728316d2b6f90d41a1",
"main.dart.js_93.part.js": "5f332652e2a9abc615ee2e8667f6376a",
"main.dart.js_94.part.js": "3a52a73dcb4f4abec9a47f4d0f3a2f41",
"main.dart.js_95.part.js": "668c4983da5d490f496ad61261e87849",
"main.dart.js_96.part.js": "89a873fdad9d816d5f3f2b5c9e488436",
"main.dart.js_97.part.js": "6585409c2830ab66f1b6076878670ddb",
"main.dart.js_98.part.js": "02d065b78ed6eafa39acf1398e1b8960",
"main.dart.js_99.part.js": "0ba68a24adf520c2872b1f9533e07e4a",
"manifest.json": "698a30b93235f5fc9cbf7fc1a5e0f5e3",
"service-worker.js": "75953b49963b5eecd378942d984aa4e9",
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
