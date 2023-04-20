'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "859971a3393d1f5aa93f76c2e8ed7dc7",
"index.html": "dd6bbd61ae669a5e336e863b2e014c1b",
"/": "dd6bbd61ae669a5e336e863b2e014c1b",
"main.dart.js": "632d7096f6bed734eccc5a637efa6538",
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
"assets/AssetManifest.json": "e4bb04efda3e7a4c5c7ff463967ed457",
"assets/NOTICES": "bb785a2676e355f9da01901b23c98487",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/guide/how_to_play.png": "7c789a4cd15faf4d3ca715b8474f01be",
"assets/assets/guide/guide.png": "44a5325176911465d1c7d149a0028317",
"assets/assets/guide/playing_modes.png": "8738a24f194df87e028257257a51e06a",
"assets/assets/guide/who_wins.png": "d3bfbe785fe27d64742fc854e0f3ecea",
"assets/assets/guide/special_cards.png": "4856b795b580b46f8731623b3d23b1c1",
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
"assets/assets/sounds/store.mp3": "afa090afd7ca27921745326db9f84c86",
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
"assets/assets/deck/original/green/8.png": "e21473e9fa57f301f942c2c8d602611d",
"assets/assets/deck/original/green/9.png": "ba9f84b214333acf6cf4e071ef6edfae",
"assets/assets/deck/original/green/draw_2.png": "2e0f9288014ebd3ef590b60ba9918a59",
"assets/assets/deck/original/green/skip.png": "74b6ed5f513944376ba8f9e16d93223c",
"assets/assets/deck/original/green/reverse.png": "fc0541a5772b61b2ae0c67ea4bd580e7",
"assets/assets/deck/original/green/4.png": "3449f6688cc7dc080b58154b4c590175",
"assets/assets/deck/original/green/5.png": "6a564c8dae53114d49c1c2273389288d",
"assets/assets/deck/original/green/7.png": "95d5eb3a7ff2421c563835f6ad6b9d38",
"assets/assets/deck/original/green/6.png": "653ab0207493806072f386fc7c175706",
"assets/assets/deck/original/green/2.png": "25c69a6b39667536141cac657284122d",
"assets/assets/deck/original/green/3.png": "eab99a55f56262fdecde00373fc3a4a8",
"assets/assets/deck/original/green/1.png": "62376d00749f8c1accc73c5cb1fa4008",
"assets/assets/deck/original/green/0.png": "237ccd24da09a423fa05d677c30af306",
"assets/assets/deck/original/blue/8.png": "8897a2d2e9bd6bf6c4628d3852beb846",
"assets/assets/deck/original/blue/9.png": "3d70ae2189cf43092bf33269a9d2052a",
"assets/assets/deck/original/blue/draw_2.png": "77c4769340d01505ff3b1623c891405c",
"assets/assets/deck/original/blue/skip.png": "2837baaa92a7e0992b5c673b0eae1a3e",
"assets/assets/deck/original/blue/reverse.png": "d62173e241b8e28bdbb1bbcf8ade92e0",
"assets/assets/deck/original/blue/4.png": "19986499e729fc9512319699c71b6674",
"assets/assets/deck/original/blue/5.png": "721b70d88c2826d47e22ae49c69187f9",
"assets/assets/deck/original/blue/7.png": "24785630543f19fc9fb6cf83ee67039b",
"assets/assets/deck/original/blue/6.png": "78df906e8fc0f4e50b835533aeecdddd",
"assets/assets/deck/original/blue/2.png": "203a7fa52b973198c9006d5c0f5bf094",
"assets/assets/deck/original/blue/3.png": "014e5e7aebb0baf2624b2e4b0fe32517",
"assets/assets/deck/original/blue/1.png": "6f8a3c164ce14ab815533a11f6dc1792",
"assets/assets/deck/original/blue/0.png": "8f33a5005eb890db673ad12ef8402e67",
"assets/assets/deck/original/red/8.png": "b5accbc00d73daae997f2427df7e1c93",
"assets/assets/deck/original/red/9.png": "dae6642bf24377c789408656565e6467",
"assets/assets/deck/original/red/draw_2.png": "e765214360e50b3aa0986fe7067f877e",
"assets/assets/deck/original/red/skip.png": "fa3e40c61169b00d5acc29a4d40f0693",
"assets/assets/deck/original/red/reverse.png": "077a049e45c027a628ec698aeaf7dd9a",
"assets/assets/deck/original/red/4.png": "df4f125094b73e289935b54cc97293b2",
"assets/assets/deck/original/red/5.png": "f25e0ef331f48936a3c052e1765037b6",
"assets/assets/deck/original/red/7.png": "ecb8686c5ccdb9120f82344eab84f1b3",
"assets/assets/deck/original/red/6.png": "b5aa02654dfbc15172ad50b3bdf7cd0b",
"assets/assets/deck/original/red/2.png": "1a267e1a1f41e18082aca328e891d6cd",
"assets/assets/deck/original/red/3.png": "bd765c50dd2ea7e2510022370cde1b1e",
"assets/assets/deck/original/red/1.png": "a9797904ee9fe431dba15d700b14501e",
"assets/assets/deck/original/red/0.png": "45a16cc415f4a7d846244a5997aca9d3",
"assets/assets/deck/original/wild/wild.png": "28343292364963179abbbb61384c9aad",
"assets/assets/deck/original/wild/wild_draw_4.png": "a4b4c8ec74fd81d2735b5b68c696f226",
"assets/assets/deck/original/thumbnail.png": "07f7c0219dddd88891b9a9ee6d6068d7",
"assets/assets/deck/original/orange/8.png": "77e238550480a76ad266b11e5a6baf69",
"assets/assets/deck/original/orange/9.png": "9755240f11a654381632e39f582fa8c8",
"assets/assets/deck/original/orange/draw_2.png": "684ba94850b638704e9cce7bd5768e5c",
"assets/assets/deck/original/orange/skip.png": "6639a0d0c69d772ee7accd0feb872be5",
"assets/assets/deck/original/orange/reverse.png": "cb7456657d1ec04f3a617135170de4de",
"assets/assets/deck/original/orange/4.png": "f21fc2391c7775bec17603bd75fa0f4c",
"assets/assets/deck/original/orange/5.png": "783690b000dd9773824a26bb6f34a440",
"assets/assets/deck/original/orange/7.png": "b0afe309e683c5f79be5f50cc6318ab7",
"assets/assets/deck/original/orange/6.png": "98731505f4a476bf9a72b4b1b7eeaa7f",
"assets/assets/deck/original/orange/2.png": "c94de6f8e5a934f9c0a84512b16d58c8",
"assets/assets/deck/original/orange/3.png": "7cbf70d881588c543f90e5eee3072c97",
"assets/assets/deck/original/orange/1.png": "4b18672975c35d5667b62144ddf0045f",
"assets/assets/deck/original/orange/0.png": "ca0bdd212d71bd1c296d69096be8d03e",
"assets/assets/deck/super_mario/green/8.png": "ccea91182e3b9defa97a2ee6f20f2e12",
"assets/assets/deck/super_mario/green/9.png": "4728337dd9b8e118ef1105b42a1b9f87",
"assets/assets/deck/super_mario/green/draw_2.png": "63e8c032add935160f0289e0ca39c16d",
"assets/assets/deck/super_mario/green/skip.png": "1f7f6802b5a0afbcf3dc62f1b8632261",
"assets/assets/deck/super_mario/green/reverse.png": "46e0fdb8a15f30a7a4856d20dfc4463a",
"assets/assets/deck/super_mario/green/4.png": "13aecb49572c1dbb47e313d2580323f7",
"assets/assets/deck/super_mario/green/5.png": "3f4ed93110ec6055a55fd1d8272ba246",
"assets/assets/deck/super_mario/green/7.png": "4694145aa8a5b5e0902dff06581a194e",
"assets/assets/deck/super_mario/green/6.png": "5aef817c611e160400bd4113ae1ae5aa",
"assets/assets/deck/super_mario/green/2.png": "515f1829c93b8618cff6996e9f4293e9",
"assets/assets/deck/super_mario/green/3.png": "282035f4c412b173964d70d65fa6ad80",
"assets/assets/deck/super_mario/green/1.png": "b433f5beac7fd2a0a09872d62249f3c6",
"assets/assets/deck/super_mario/green/0.png": "a14b3e5b2c5c5cb2da1f6dfb9c639116",
"assets/assets/deck/super_mario/blue/8.png": "a577feb15c02ce1deba8dd7632a29201",
"assets/assets/deck/super_mario/blue/9.png": "322d2c5df9d6028732f46281d94319c0",
"assets/assets/deck/super_mario/blue/draw_2.png": "b16a50295e719486796feaab2d71a925",
"assets/assets/deck/super_mario/blue/skip.png": "58c04cd8d067c33178e18e574155bd17",
"assets/assets/deck/super_mario/blue/reverse.png": "688532e28207d60dcab606e779f7d876",
"assets/assets/deck/super_mario/blue/4.png": "7f958e40279c5c264b04774cee552536",
"assets/assets/deck/super_mario/blue/5.png": "3ffee5b4d1fe86b1f8851d64219befde",
"assets/assets/deck/super_mario/blue/7.png": "a7be6f6158e54bcb84da15df5d660759",
"assets/assets/deck/super_mario/blue/6.png": "8409c3955f1656b0a5d7a2ddb522d88f",
"assets/assets/deck/super_mario/blue/2.png": "98fecc5ace5f62772d55926f451d1edb",
"assets/assets/deck/super_mario/blue/3.png": "b89672b625c8c31371100ed7a9dd16af",
"assets/assets/deck/super_mario/blue/1.png": "db4f7b09292b90cfbafa2e52adea16d9",
"assets/assets/deck/super_mario/blue/0.png": "ea4cb267b52b1e648d11f3912d38ffaf",
"assets/assets/deck/super_mario/red/8.png": "0c70f4de50e72d29fd488c882b8d939a",
"assets/assets/deck/super_mario/red/9.png": "c8e75b89a567980fa1e51aacb61d22dc",
"assets/assets/deck/super_mario/red/draw_2.png": "80ef0f68fd721b7da397dbbf10796ee6",
"assets/assets/deck/super_mario/red/skip.png": "ef0767e0f299d8de93b06f1b6d57a540",
"assets/assets/deck/super_mario/red/reverse.png": "33e544d967ada9b34b7496ae14db605e",
"assets/assets/deck/super_mario/red/4.png": "034ef3d1534f8855766a1993132a03bf",
"assets/assets/deck/super_mario/red/5.png": "7628351d8fc11f005a63a907907fb19e",
"assets/assets/deck/super_mario/red/7.png": "2a1fbfcc0e7bc506f5c74ddc3ba8da16",
"assets/assets/deck/super_mario/red/6.png": "2b5df29f7a6b77caec5bedc58087b7b4",
"assets/assets/deck/super_mario/red/2.png": "14ae096747ce84e319c5d72a929cf886",
"assets/assets/deck/super_mario/red/3.png": "a32427bd1d55d6f91a424decfb049dd9",
"assets/assets/deck/super_mario/red/1.png": "c716567b667533080822742c7983f03e",
"assets/assets/deck/super_mario/red/0.png": "ab51778d7402245b2aa038a7c5976ec3",
"assets/assets/deck/super_mario/wild/wild.png": "28343292364963179abbbb61384c9aad",
"assets/assets/deck/super_mario/wild/wild_draw_4.png": "a4b4c8ec74fd81d2735b5b68c696f226",
"assets/assets/deck/super_mario/thumbnail.png": "2aa99012cf4fbaf93f4e9624912c8b07",
"assets/assets/deck/super_mario/orange/8.png": "cdf71d638d9e959925a217e7cd0db360",
"assets/assets/deck/super_mario/orange/9.png": "ea6227f58b5528ad0bf659b8de7abdc6",
"assets/assets/deck/super_mario/orange/draw_2.png": "e56069e2f449da3199c19d4626646fec",
"assets/assets/deck/super_mario/orange/skip.png": "2a908d4190e6c32d0f595679b8f04d55",
"assets/assets/deck/super_mario/orange/reverse.png": "c1ef8ceb068f83e31ef29771c6ff053e",
"assets/assets/deck/super_mario/orange/4.png": "fbab3f9e27a8c29a1682863e87bc261f",
"assets/assets/deck/super_mario/orange/5.png": "b42f88a1748407f421b22d5a88bc38fd",
"assets/assets/deck/super_mario/orange/7.png": "a1d2f72ff12905d42e575fea87a63fc8",
"assets/assets/deck/super_mario/orange/6.png": "e9bc8c8d069b389f68ed6a5386ce42fc",
"assets/assets/deck/super_mario/orange/2.png": "47f060584c423e480a41e02186d2de23",
"assets/assets/deck/super_mario/orange/3.png": "cf9008730bf954121dfe5b8e6a120800",
"assets/assets/deck/super_mario/orange/1.png": "bf1e51d4234623c1b1e953aca498bce3",
"assets/assets/deck/super_mario/orange/0.png": "70b86e7d8fccf6c6f4d15002aabb910d",
"assets/assets/deck/animal_crossing/green/8.png": "9e6cb5e4007e53c07cfc1dadddf4556b",
"assets/assets/deck/animal_crossing/green/9.png": "0781a7a9bb4e5d18434ee66d5c749819",
"assets/assets/deck/animal_crossing/green/draw_2.png": "576a278eb6e2ff315fb82acb76195aba",
"assets/assets/deck/animal_crossing/green/skip.png": "39b3ee40931732ebc8a613283a0dd84d",
"assets/assets/deck/animal_crossing/green/reverse.png": "00787b50fd263ec069b059f5dfda82cc",
"assets/assets/deck/animal_crossing/green/4.png": "f5c06e41c5eb5fdf485ea401392ff346",
"assets/assets/deck/animal_crossing/green/5.png": "4d3f6b12b1cb390b6b3458c7ed9bf387",
"assets/assets/deck/animal_crossing/green/7.png": "ae417096a4f414c282d915461dfa6cd3",
"assets/assets/deck/animal_crossing/green/6.png": "7324f9808240d8d507490b6872e52825",
"assets/assets/deck/animal_crossing/green/2.png": "ae8472dba41204d6c5e6de7ec2f3ae64",
"assets/assets/deck/animal_crossing/green/3.png": "cbaa72c67dffabe78ce6be2ef2d9e555",
"assets/assets/deck/animal_crossing/green/1.png": "10c6374916a2e08c84d399903ecc59fb",
"assets/assets/deck/animal_crossing/green/0.png": "a05cf2e1a9f0af183b50c3a4c237bb74",
"assets/assets/deck/animal_crossing/blue/8.png": "7c8dc242746f7e1a16ae0c4e93098d5c",
"assets/assets/deck/animal_crossing/blue/9.png": "019083c01d72de107c0486df17915d12",
"assets/assets/deck/animal_crossing/blue/draw_2.png": "581e9fcb31a48bb6bdb3c46f45cc0f6c",
"assets/assets/deck/animal_crossing/blue/skip.png": "37e5ad99ddc6740bf37e01ad1673864a",
"assets/assets/deck/animal_crossing/blue/reverse.png": "37f344b353aad50e9cdb12d19df4ba3e",
"assets/assets/deck/animal_crossing/blue/4.png": "bd3e17dabc269c2351b8c1e8de771099",
"assets/assets/deck/animal_crossing/blue/5.png": "550f907ee2ccf5911941d7fc21260a3e",
"assets/assets/deck/animal_crossing/blue/7.png": "07fe150215fff33c6ca76b6628e9bf5d",
"assets/assets/deck/animal_crossing/blue/6.png": "1b9019c5bb3d51fc225f9c3d96fe3f95",
"assets/assets/deck/animal_crossing/blue/2.png": "985c8e2324bc51f3ba3f42ea4fbb54ea",
"assets/assets/deck/animal_crossing/blue/3.png": "95618a296810ffe3353ff93ce25485cf",
"assets/assets/deck/animal_crossing/blue/1.png": "b3d9ce0920a1a31ac8fd992ce04b46e8",
"assets/assets/deck/animal_crossing/blue/0.png": "5a544d6b35a4d731f2012d693a94c015",
"assets/assets/deck/animal_crossing/red/8.png": "61caf8be37931d5cb83331f7785f42b9",
"assets/assets/deck/animal_crossing/red/9.png": "29813e1f95c10a8793a452fe4a9eee1d",
"assets/assets/deck/animal_crossing/red/draw_2.png": "6f5858bd00e7dbb5f818ad1e677069e2",
"assets/assets/deck/animal_crossing/red/skip.png": "589e1458fc17843c79423d5ee15478f0",
"assets/assets/deck/animal_crossing/red/reverse.png": "87857c58ac9ab0994f28850124797736",
"assets/assets/deck/animal_crossing/red/4.png": "ba421d93a90bd250f5d25fdaec2be8a3",
"assets/assets/deck/animal_crossing/red/5.png": "e0146adeaf6be21aa96b1b79ea5c4591",
"assets/assets/deck/animal_crossing/red/7.png": "1029600b1eadaa98d75d662c9358a9db",
"assets/assets/deck/animal_crossing/red/6.png": "40f932c9a91e6936ceecf8d9316c91ab",
"assets/assets/deck/animal_crossing/red/2.png": "c93dfb2c96449091be477302db4b9c7b",
"assets/assets/deck/animal_crossing/red/3.png": "beeb3f104dc2394b3e560b8bbd27edf7",
"assets/assets/deck/animal_crossing/red/1.png": "dc0bce7146b50e19045a82a5fdaa71b8",
"assets/assets/deck/animal_crossing/red/0.png": "ded498177615109a1c24679aceb8fd23",
"assets/assets/deck/animal_crossing/wild/wild.png": "28343292364963179abbbb61384c9aad",
"assets/assets/deck/animal_crossing/wild/wild_draw_4.png": "a4b4c8ec74fd81d2735b5b68c696f226",
"assets/assets/deck/animal_crossing/thumbnail.png": "000e35136d2576663cc9a38ff0e5c708",
"assets/assets/deck/animal_crossing/orange/8.png": "41167fc7da1139b1a37eac66145af6c7",
"assets/assets/deck/animal_crossing/orange/9.png": "0cc242e59a8623e6c8817a3fe74e72e7",
"assets/assets/deck/animal_crossing/orange/draw_2.png": "72a7ea5dc93c3cf67af8a734746470fe",
"assets/assets/deck/animal_crossing/orange/skip.png": "b251fbd1a8d673c4c0fad2b1646f431f",
"assets/assets/deck/animal_crossing/orange/reverse.png": "551252a85560f37fd0af5196c4c6121f",
"assets/assets/deck/animal_crossing/orange/4.png": "d2a35f38fc0b214b7a3bef6a01591905",
"assets/assets/deck/animal_crossing/orange/5.png": "4f31245a0cf887ac0c467313000a1015",
"assets/assets/deck/animal_crossing/orange/7.png": "e7af32254fdc33bbbc9e4a9d59729b97",
"assets/assets/deck/animal_crossing/orange/6.png": "b00e8cfb8fd3662baeda5cb1c867551a",
"assets/assets/deck/animal_crossing/orange/2.png": "d00796cea98cac12bf2c4a505560f2ee",
"assets/assets/deck/animal_crossing/orange/3.png": "bd8a0f121ab5dafa2cfb231a9bffa9d8",
"assets/assets/deck/animal_crossing/orange/1.png": "d7ec566945ffaf1e512477e7e6cc25f8",
"assets/assets/deck/animal_crossing/orange/0.png": "40c710a2abdcb03e1a197301d0bb1625",
"assets/assets/warnings/dismiss_2.pnf.png": "2f9e156b5b58fa60e93323ef135e7696",
"assets/assets/warnings/dismiss.png": "3b1654eca96af82c212935e72861ca34",
"assets/assets/warnings/dismiss_2.png": "2f9e156b5b58fa60e93323ef135e7696",
"assets/assets/warnings/dismiss_1.png": "b81e60111f84bb1bbe84ce10192934a1",
"assets/assets/store/store.png": "97aeb30dcdf8726977def83be4c8d64c",
"assets/assets/store/bag.png": "223c91fa6131d1f13f7349514e9b3cb4",
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
