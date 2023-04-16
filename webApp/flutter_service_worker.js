'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "81bdfd8ff8a6fd28026048385a902475",
"index.html": "48477687a4ce7eca30c9a3a3f3006a26",
"/": "48477687a4ce7eca30c9a3a3f3006a26",
"main.dart.js": "bb681361f411381e6e1b7054a22ee8aa",
"sqlite3.wasm": "fc00695e0788464e5b26edef5cf408da",
"HOW_TO_RUN.txt": "9dbc88f8a6c5e00533078384eb3f8658",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"favicon.png": "50d0433bcac15f9c50798d8c09120b51",
"sqflite_sw.js": "c1eecf334474cc8e1df8b142bf91aaef",
"icons/Icon-192.png": "7a38a31235c9ad80f5e146af38bf82a6",
"icons/Icon-maskable-192.png": "7a38a31235c9ad80f5e146af38bf82a6",
"icons/Icon-maskable-512.png": "4d3b00f2f6b3821c4ad4bd238ac146d3",
"icons/Icon-512.png": "4d3b00f2f6b3821c4ad4bd238ac146d3",
"manifest.json": "4b495fd116047ab3f3a2f0d732ce5eea",
"assets/AssetManifest.json": "4ad643e2fca0f45427202b415a74ceef",
"assets/NOTICES": "bb785a2676e355f9da01901b23c98487",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/classification/classification.png": "09ff40958ccc0b1b9f2c89b64b0be335",
"assets/assets/winners/winner.png": "33555b1cc5511e249b62b14ae7420a82",
"assets/assets/buttons/UNO_blue.png": "14a451531e41a3299c716e8ce8e7c6f7",
"assets/assets/buttons/UNO.png": "e1bcba80273a0637de6d804f5516aa2a",
"assets/assets/buttons/next_turn.png": "9bf0e91de253256f45272d2f1ba86937",
"assets/assets/buttons/next_turn_blue.png": "b94005d2af0f33c79579cf6e8ea0a149",
"assets/assets/loadGame/loadGame.png": "77dab94dc0fb13f36c82e6ca18c8edf4",
"assets/assets/players/player_1.png": "09379da0a54e8eb12a43dbf508fd13de",
"assets/assets/players/player_2.png": "08cbedafaccdb2187e35f27cd3b7fc55",
"assets/assets/players/player_1_name.png": "53ec1d404213921fcd3682e2ae82b88e",
"assets/assets/players/player_2_name.png": "c6d41ff035146657f91979da2529bc9f",
"assets/assets/logout/logout.png": "97ceb937faac171f780f00d27c23d95c",
"assets/assets/sounds/theme.mp3": "0f48f81e9fcd64cd5cd5502f0c56bac4",
"assets/assets/sounds/winner.mp3": "625e92881f6741df4ac8f78e36fd16b0",
"assets/assets/unoChance/unoChance_2.png": "c3d5a93ef41363bf010f2538ee8b5bce",
"assets/assets/unoChance/unoChance.png": "b5bb9eed3a66ffd85cdc81b4845d1257",
"assets/assets/pet/roby.png": "731f90d3d548c65b846f1ad6e7a7325c",
"assets/assets/pet/roby.webp": "feab5bb13f6fbc82ae32f96cf85c1b0a",
"assets/assets/logo/logo.ico": "0a5e34379c6bff8d2891447b11d8846b",
"assets/assets/logo/logo_ios.png": "e3178b9c88480eef0e482f7a7e3e1fb3",
"assets/assets/logo/deck.png": "fdff181c5023ff10e8f7d6cb11dee5de",
"assets/assets/logo/logo.png": "43ff4347809f57ca20de20030eedf4fe",
"assets/assets/colorChanger/colorChanger.png": "c769ce9f13e08c5a501212d5179a18b2",
"assets/assets/saveGame/saveGame.png": "9f2e1d6250a9baa032ba69a06c28e330",
"assets/assets/saveGame/loadGame.png": "9da02e11ec092f3c92ae4c0fdc736acc",
"assets/assets/deck/green/8.png": "e21473e9fa57f301f942c2c8d602611d",
"assets/assets/deck/green/9.png": "ba9f84b214333acf6cf4e071ef6edfae",
"assets/assets/deck/green/draw_2.png": "2e0f9288014ebd3ef590b60ba9918a59",
"assets/assets/deck/green/skip.png": "74b6ed5f513944376ba8f9e16d93223c",
"assets/assets/deck/green/reverse.png": "fc0541a5772b61b2ae0c67ea4bd580e7",
"assets/assets/deck/green/4.png": "3449f6688cc7dc080b58154b4c590175",
"assets/assets/deck/green/5.png": "6a564c8dae53114d49c1c2273389288d",
"assets/assets/deck/green/7.png": "95d5eb3a7ff2421c563835f6ad6b9d38",
"assets/assets/deck/green/6.png": "653ab0207493806072f386fc7c175706",
"assets/assets/deck/green/2.png": "25c69a6b39667536141cac657284122d",
"assets/assets/deck/green/3.png": "eab99a55f56262fdecde00373fc3a4a8",
"assets/assets/deck/green/1.png": "62376d00749f8c1accc73c5cb1fa4008",
"assets/assets/deck/green/0.png": "237ccd24da09a423fa05d677c30af306",
"assets/assets/deck/blue/8.png": "8897a2d2e9bd6bf6c4628d3852beb846",
"assets/assets/deck/blue/9.png": "3d70ae2189cf43092bf33269a9d2052a",
"assets/assets/deck/blue/draw_2.png": "77c4769340d01505ff3b1623c891405c",
"assets/assets/deck/blue/skip.png": "2837baaa92a7e0992b5c673b0eae1a3e",
"assets/assets/deck/blue/reverse.png": "d62173e241b8e28bdbb1bbcf8ade92e0",
"assets/assets/deck/blue/4.png": "19986499e729fc9512319699c71b6674",
"assets/assets/deck/blue/5.png": "721b70d88c2826d47e22ae49c69187f9",
"assets/assets/deck/blue/7.png": "24785630543f19fc9fb6cf83ee67039b",
"assets/assets/deck/blue/6.png": "78df906e8fc0f4e50b835533aeecdddd",
"assets/assets/deck/blue/2.png": "203a7fa52b973198c9006d5c0f5bf094",
"assets/assets/deck/blue/3.png": "014e5e7aebb0baf2624b2e4b0fe32517",
"assets/assets/deck/blue/1.png": "6f8a3c164ce14ab815533a11f6dc1792",
"assets/assets/deck/blue/0.png": "8f33a5005eb890db673ad12ef8402e67",
"assets/assets/deck/red/8.png": "b5accbc00d73daae997f2427df7e1c93",
"assets/assets/deck/red/9.png": "dae6642bf24377c789408656565e6467",
"assets/assets/deck/red/draw_2.png": "e765214360e50b3aa0986fe7067f877e",
"assets/assets/deck/red/skip.png": "fa3e40c61169b00d5acc29a4d40f0693",
"assets/assets/deck/red/reverse.png": "077a049e45c027a628ec698aeaf7dd9a",
"assets/assets/deck/red/4.png": "df4f125094b73e289935b54cc97293b2",
"assets/assets/deck/red/5.png": "f25e0ef331f48936a3c052e1765037b6",
"assets/assets/deck/red/7.png": "ecb8686c5ccdb9120f82344eab84f1b3",
"assets/assets/deck/red/6.png": "b5aa02654dfbc15172ad50b3bdf7cd0b",
"assets/assets/deck/red/2.png": "1a267e1a1f41e18082aca328e891d6cd",
"assets/assets/deck/red/3.png": "bd765c50dd2ea7e2510022370cde1b1e",
"assets/assets/deck/red/1.png": "a9797904ee9fe431dba15d700b14501e",
"assets/assets/deck/red/0.png": "45a16cc415f4a7d846244a5997aca9d3",
"assets/assets/deck/wild/wild.png": "28343292364963179abbbb61384c9aad",
"assets/assets/deck/wild/wild_draw_4.png": "a4b4c8ec74fd81d2735b5b68c696f226",
"assets/assets/deck/orange/8.png": "77e238550480a76ad266b11e5a6baf69",
"assets/assets/deck/orange/9.png": "9755240f11a654381632e39f582fa8c8",
"assets/assets/deck/orange/draw_2.png": "684ba94850b638704e9cce7bd5768e5c",
"assets/assets/deck/orange/skip.png": "6639a0d0c69d772ee7accd0feb872be5",
"assets/assets/deck/orange/reverse.png": "cb7456657d1ec04f3a617135170de4de",
"assets/assets/deck/orange/4.png": "f21fc2391c7775bec17603bd75fa0f4c",
"assets/assets/deck/orange/5.png": "783690b000dd9773824a26bb6f34a440",
"assets/assets/deck/orange/7.png": "b0afe309e683c5f79be5f50cc6318ab7",
"assets/assets/deck/orange/6.png": "98731505f4a476bf9a72b4b1b7eeaa7f",
"assets/assets/deck/orange/2.png": "c94de6f8e5a934f9c0a84512b16d58c8",
"assets/assets/deck/orange/3.png": "7cbf70d881588c543f90e5eee3072c97",
"assets/assets/deck/orange/1.png": "4b18672975c35d5667b62144ddf0045f",
"assets/assets/deck/orange/0.png": "ca0bdd212d71bd1c296d69096be8d03e",
"assets/assets/warnings/dismiss_2.pnf.png": "2f9e156b5b58fa60e93323ef135e7696",
"assets/assets/warnings/dismiss.png": "3b1654eca96af82c212935e72861ca34",
"assets/assets/warnings/dismiss_2.png": "2f9e156b5b58fa60e93323ef135e7696",
"assets/assets/warnings/dismiss_1.png": "b81e60111f84bb1bbe84ce10192934a1",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
