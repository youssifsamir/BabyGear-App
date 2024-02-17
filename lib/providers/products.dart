//packages
import 'package:flutter/material.dart';

class Product {
  final String name, description, details;
  final List<Color> colors;
  final List<List<String>> imgs;
  final double price, rating;
  final bool best;
  final String type, category, brand;

  Product({
    required this.name,
    required this.price,
    required this.rating,
    required this.details,
    required this.description,
    required this.colors,
    required this.imgs,
    required this.best,
    required this.type,
    required this.category,
    required this.brand,
  });
}

class Type {
  final String brand, category;
  final List<String> type;
  Type({
    required this.brand,
    required this.category,
    required this.type,
  });
}

class ProductsProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Product> _favorites = [];
  // ignore: prefer_final_fields
  List<Product> _cart = [];

  final _types = [
    Type(
      brand: 'Chicco',
      category: 'Strollers',
      type: [
        'All',
        'Double Strollers',
        'Full Size Strollers',
        'Jogging Strollers',
        'Lightweight Strollers'
      ],
    ),
    Type(
      brand: 'Chicco',
      category: 'Beds',
      type: [
        'All',
        'Lulla Go',
        'Lulla Anywhere',
        'Close to You',
      ],
    ),
    Type(
      brand: 'Chicco',
      category: 'Car Seats',
      type: [
        'All',
        'Infant Car Seats',
        'Convertible Car Seats',
        'Booster Car Seats',
        'All-in-one Car Seats'
      ],
    ),
  ];

  final _images = [
    './assets/images/bed.png',
    './assets/images/toys.png',
    './assets/images/chair.png',
    './assets/images/sleeper.png',
    './assets/images/outside.png',
    './assets/images/walker.png',
  ];
  final _rimages = [
    './assets/images/stroller.png',
    './assets/images/seat.png',
    './assets/images/bed.png',
    './assets/images/toys.png',
    './assets/images/chair.png',
    './assets/images/sleeper.png',
    './assets/images/outside.png',
    './assets/images/walker.png',
  ];

  final _brands = [
    './assets/images/chicco.png',
    './assets/images/joie.png',
    './assets/images/fisher.png',
    './assets/images/moms.jpg',
    './assets/images/bugaboo.png',
    './assets/images/mama.png',
    './assets/images/stokke.png',
    './assets/images/cybex.jpg',
    './assets/images/coontours.jpg',
    './assets/images/mothercare.png',
    './assets/images/graco.webp',
    './assets/images/mima.png',
    './assets/images/nuna.png',
    './assets/images/uppa.jpg',
    './assets/images/babyzen.jpg',
  ];
  final _bname = [
    'Chicco',
    'Joie',
    'FisherPrice',
    'Moms',
    'Bugaboo',
    'Mamas&Papas',
    'Stokke',
    'Cybex',
    'Contours',
    'Mothercare',
    'Graco',
    'Mima',
    'Nuna',
    'Uppababy',
    'Babyzen',
  ];
  final _name = [
    'Beds',
    'Toys',
    'High Chairs',
    'Bathing',
    'Outdoors',
    'Swingers',
  ];

  final _rname = [
    'Strollers',
    'Car Seats',
    'Beds',
    'Toys',
    'High Chairs',
    'Bathing',
    'Outdoors',
    'Swingers',
  ];

  final _products = [
    //bed - Close2You
    Product(
      details:
          'Designed for infants up to 20 lbs. or until infant begins to push up on hands and knees, whichever comes first.',
      type: 'Close to You',
      category: 'Beds',
      brand: 'Chicco',
      name: 'Close to You - Light',
      price: 350,
      rating: 2.5,
      colors: [
        Colors.grey,
      ],
      description:
          'Close to You easily glides from room to room for convenient daytime use as a portable bed.',
      imgs: [
        [
          './assets/images/heathergrey1.jpeg',
          './assets/images/heathergrey2.jpeg',
          './assets/images/heathergrey3.jpeg',
          './assets/images/heathergrey4.jpeg',
          './assets/images/heathergrey5.jpeg',
          './assets/images/heathergrey6.jpeg',
          './assets/images/heathergrey7.jpeg',
        ]
      ],
      best: false,
    ),
    Product(
      details:
          'Designed for infants up to 20 lbs. or until infant begins to push up on hands and knees, whichever comes first.',
      type: 'Close to You',
      category: 'Beds',
      brand: 'Chicco',
      name: 'Close to You - Dark',
      price: 350,
      rating: 2,
      colors: [
        Colors.black54,
      ],
      description:
          'Close to You easily glides from room to room for convenient daytime use as a portable bed.',
      imgs: [
        [
          './assets/images/charcoal1.jpeg',
          './assets/images/charcoal2.jpeg',
          './assets/images/charcoal3.jpeg',
          './assets/images/charcoal4.jpeg',
          './assets/images/charcoal5.jpeg',
          './assets/images/charcoal6.jpeg',
          './assets/images/charcoal7.jpeg',
        ],
      ],
      best: false,
    ),

    //bed - LullaGo
    Product(
      details:
          'LullaGo® is designed for infants up to 20 lbs. or until infant begins to push up on hands and knees, whichever comes first.',
      category: 'Beds',
      brand: 'Chicco',
      type: 'Lulla Go',
      name: 'Lulla Go - Dove',
      price: 500,
      rating: 4.2,
      colors: [
        Colors.white,
      ],
      description: 'Perfect size bassinet.',
      imgs: [
        [
          './assets/images/dove1.jpeg',
        ]
      ],
      best: true,
    ),
    Product(
      details:
          'LullaGo® is designed for infants up to 20 lbs. or until infant begins to push up on hands and knees, whichever comes first.',
      rating: 2.8,
      category: 'Beds',
      brand: 'Chicco',
      type: 'Lulla Go',
      name: 'Lulla Go - Serene',
      price: 500,
      colors: [
        const Color.fromARGB(255, 186, 186, 186),
      ],
      description:
          'Close to You easily glides from room to room for convenient daytime use as a portable bed.',
      imgs: [
        [
          './assets/images/serene1.jpeg',
          './assets/images/serene2.jpeg',
          './assets/images/serene3.jpeg',
          './assets/images/serene4.jpeg',
          './assets/images/serene5.jpeg',
          './assets/images/serene6.jpeg',
          './assets/images/serene7.jpeg',
        ]
      ],
      best: false,
    ),
    Product(
      details:
          'LullaGo® is designed for infants up to 20 lbs. or until infant begins to push up on hands and knees, whichever comes first.',
      rating: 5,
      category: 'Beds',
      brand: 'Chicco',
      type: 'Lulla Go',
      name: 'Lulla Go - Mirage',
      price: 500,
      colors: [
        Colors.blueGrey,
      ],
      description:
          'Close to You easily glides from room to room for convenient daytime use as a portable bed.',
      imgs: [
        [
          './assets/images/mirage1.jpeg',
          './assets/images/mirage2.jpeg',
          './assets/images/mirage3.jpeg',
          './assets/images/mirage4.jpeg',
          './assets/images/mirage5.jpeg',
          './assets/images/mirage6.jpeg',
          './assets/images/mirage7.jpeg',
        ]
      ],
      best: false,
    ),

    Product(
      details:
          'LullaGo® is designed for infants up to 20 lbs. or until infant begins to push up on hands and knees, whichever comes first.',
      rating: 3.2,
      category: 'Beds',
      brand: 'Chicco',
      type: 'Lulla Anywhere',
      name: 'Lulla Anywhere - Grey Star',
      price: 500,
      colors: [
        Colors.grey,
      ],
      description:
          'Close to You easily glides from room to room for convenient daytime use as a portable bed.',
      imgs: [
        [
          './assets/images/greystar1.jpeg',
          './assets/images/greystar2.jpeg',
          './assets/images/greystar3.jpeg',
          './assets/images/greystar4.jpeg',
          './assets/images/greystar5.jpeg',
          './assets/images/greystar6.jpeg',
          './assets/images/greystar7.jpeg',
        ]
      ],
      best: false,
    ),
    Product(
      details:
          'Lulla Anywhere® is designed for infants up to 20 lbs. or until infant begins to push up on hands and knees, whichever comes first.',
      rating: 2.7,
      category: 'Beds',
      brand: 'Chicco',
      type: 'Lulla Anywhere',
      name: 'Lulla Where - Sand Stone',
      price: 500,
      colors: [
        const Color.fromARGB(255, 103, 103, 103),
      ],
      description:
          'Close to You easily glides from room to room for convenient daytime use as a portable bed.',
      imgs: [
        [
          './assets/images/sandstone1.jpeg',
          './assets/images/sandstone2.jpeg',
          './assets/images/sandstone3.jpeg',
          './assets/images/sandstone4.jpeg',
          './assets/images/sandstone5.jpeg',
          './assets/images/sandstone6.jpeg',
          './assets/images/sandstone7.jpeg',
        ]
      ],
      best: false,
    ),

    //carseats - All-in-one
    Product(
      details:
          'The Fit4™ is designed for children between 4-100 lbs. and up to 57" tall.',
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'All-in-one Car Seats',
      name: 'Fit 4-in-1',
      price: 750,
      rating: 5,
      description: 'All-in-one car seat.',
      colors: [
        Colors.grey,
        Colors.black,
        Colors.blue[900]!,
      ],
      imgs: [
        [
          './assets/images/ember1.jpeg',
          './assets/images/ember2.jpeg',
          './assets/images/ember3.jpeg',
          './assets/images/ember4.jpeg',
          './assets/images/ember5.jpeg',
          './assets/images/ember6.jpeg',
          './assets/images/ember7.jpeg',
        ],
        [
          './asssets/images/oynx1.jpeg',
          './asssets/images/oynx2.jpeg',
          './asssets/images/oynx3.jpeg',
          './asssets/images/oynx4.jpeg',
          './asssets/images/oynx5.jpeg',
          './asssets/images/oynx6.jpeg',
          './asssets/images/oynx7.jpeg',
        ],
        [
          './assets/images/vapor1.jpeg',
          './assets/images/vapor2.jpeg',
          './assets/images/vapor3.jpeg',
          './assets/images/vapor4.jpeg',
          './assets/images/vapor5.jpeg',
          './assets/images/vapor6.jpeg',
          './assets/images/vapor7.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'The OneFit™ is designed for Rear-Facing Harness 5-40 lbs. and up to 43" tall, Forward-Facing Harness 25-65 lbs. and up to 54" tall, Booster 40-100 lbs. and up to 57" tall.',
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'All-in-one Car Seats',
      name: 'OneFit ClearTex',
      price: 700,
      rating: 5,
      description: 'All-in-one car seat.',
      colors: [
        Colors.grey,
        Colors.grey[900]!,
        Colors.black,
        Colors.pink[800]!,
      ],
      imgs: [
        [
          './assets/images/drift1.jpeg',
          './assets/images/drift2.jpeg',
          './assets/images/drift3.jpeg',
          './assets/images/drift4.jpeg',
          './assets/images/drift5.jpeg',
          './assets/images/drift6.jpeg',
          './assets/images/drift7.jpeg',
        ],
        [
          './assets/images/1.jpeg',
          './assets/images/2.jpeg',
          './assets/images/3.jpeg',
          './assets/images/4.jpeg',
          './assets/images/5.jpeg',
          './assets/images/6.jpeg',
          './assets/images/7.jpeg',
        ],
        [
          './assets/images/black1.jpeg',
          './assets/images/black2.jpeg',
          './assets/images/black3.jpeg',
          './assets/images/black4.jpeg',
          './assets/images/black5.jpeg',
          './assets/images/black6.jpeg',
          './assets/images/black7.jpeg',
        ],
        [
          './assets/images/lilac1.jpeg',
          './assets/images/lilac2.jpeg',
          './assets/images/lilac3.jpeg',
          './assets/images/lilac4.jpeg',
          './assets/images/lilac5.jpeg',
          './assets/images/lilac6.jpeg',
          './assets/images/lilac7.jpeg',
        ],
      ],
      best: true,
    ),

    //carseats - Boosters
    Product(
      details:
          'KidFit® ClearTex Plus is for children who are at least 4 years of age, between 38-57" tall, between 40-100 lbs. in high-back mode and 40-110 lbs. in backless mode and can sit relatively still in the same seated position throughout the car ride.',
      rating: 4,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Booster Car Seats',
      name: 'KidFit ClearTex Plus+',
      price: 850,
      description:
          'Designed to grow with children from toddler through big kid with easy transition from five-point harness to booster mode.',
      colors: [
        Colors.blueGrey,
        Colors.grey[700]!,
        Colors.black,
        Colors.pink[900]!,
        Colors.blue[700]!,
      ],
      imgs: [
        [
          './assets/images/kfcdrift1.jpeg',
          './assets/images/kfcdrift2.jpeg',
          './assets/images/kfcdrift3.jpeg',
          './assets/images/kfcdrift4.jpeg',
          './assets/images/kfcdrift5.jpeg',
          './assets/images/kfcdrift6.jpeg',
          './assets/images/kfcdrift7.jpeg',
        ],
        [
          './assets/images/kfcshadow1.jpeg',
          './assets/images/kfcshadow2.jpeg',
          './assets/images/kfcshadow3.jpeg',
          './assets/images/kfcshadow4.jpeg',
          './assets/images/kfcshadow5.jpeg',
          './assets/images/kfcshadow6.jpeg',
          './assets/images/kfcshadow7.jpeg',
        ],
        [
          './assets/images/kfcobsidian1.jpeg',
          './assets/images/kfcobsidian2.jpeg',
          './assets/images/kfcobsidian3.jpeg',
          './assets/images/kfcobsidian4.jpeg',
          './assets/images/kfcobsidian5.jpeg',
          './assets/images/kfcobsidian6.jpeg',
          './assets/images/kfcobsidian7.jpeg',
        ],
        [
          './assets/images/kfclilac1.jpeg',
          './assets/images/kfclilac2.jpeg',
          './assets/images/kfclilac3.jpeg',
          './assets/images/kfclilac4.jpeg',
          './assets/images/kfclilac5.jpeg',
          './assets/images/kfclilac6.jpeg',
          './assets/images/kfclilac7.jpeg',
        ],
        [
          './assets/images/kfcreef1.jpeg',
          './assets/images/kfcreef2.jpeg',
          './assets/images/kfcreef3.jpeg',
          './assets/images/kfcreef4.jpeg',
          './assets/images/kfcreef1.jpeg',
          './assets/images/kfcreef5.jpeg',
          './assets/images/kfcreef6.jpeg',
          './assets/images/kfcreef7.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'KidFit® Zip Plus is designed for children at least 4 years of age, between 38-57" tall, between 40-100 lbs. in high-back mode and 40-110 lbs. in backless mode, and can sit relatively still in the same seated position throughout the car ride.',
      rating: 5,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Booster Car Seats',
      name: 'KidFit Zip Plus+',
      price: 800,
      description: 'For toddlers & big kids.',
      colors: [
        Colors.grey,
        Colors.blue[700]!,
        Colors.black,
      ],
      imgs: [
        [
          './assets/images/kzpQcollection1.jpeg',
          './assets/images/kzpQcollection2.jpeg',
          './assets/images/kzpQcollection3.jpeg',
          './assets/images/kzpQcollection4.jpeg',
          './assets/images/kzpQcollection5.jpeg',
          './assets/images/kzpQcollection6.jpeg',
          './assets/images/kzpQcollection7.jpeg',
        ],
        [
          './assets/images/kzpseaescape1.jpeg',
          './assets/images/kzpseaescape2.jpeg',
          './assets/images/kzpseaescape3.jpeg',
          './assets/images/kzpseaescape4.jpeg',
          './assets/images/kzpseaescape5.jpeg',
          './assets/images/kzpseaescape6.jpeg',
          './assets/images/kzpseaescape7.jpeg',
        ],
        [
          './assets/images/kzptaurus1.jpeg',
          './assets/images/kzptaurus2.jpeg',
          './assets/images/kzptaurus3.jpeg',
          './assets/images/kzptaurus4.jpeg',
          './assets/images/kzptaurus5.jpeg',
          './assets/images/kzptaurus6.jpeg',
          './assets/images/kzptaurus7.jpeg',
        ],
      ],
      best: true,
    ),

    //carseats - Convertible
    Product(
      details: 'Designed for children between 4-65 lbs. and up to 49" tall.',
      rating: 5,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Convertible Car Seats',
      name: 'NextFit Max ClearTex',
      price: 750,
      description: 'Simple and secure.',
      colors: [
        Colors.grey,
        Colors.black,
      ],
      imgs: [
        [
          './assets/images/nmxcove1.jpeg',
          './assets/images/nmxcove2.jpeg',
          './assets/images/nmxcove3.jpeg',
          './assets/images/nmxcove4.jpeg',
          './assets/images/nmxcove5.jpeg',
          './assets/images/nmxcove6.jpeg',
          './assets/images/nmxcove7.jpeg',
        ],
        [
          './assets/images/nmxshadow1.jpeg',
          './assets/images/nmxshadow2.jpeg',
          './assets/images/nmxshadow3.jpeg',
          './assets/images/nmxshadow4.jpeg',
          './assets/images/nmxshadow5.jpeg',
          './assets/images/nmxshadow6.jpeg',
          './assets/images/nmxshadow7.jpeg',
        ]
      ],
      best: true,
    ),
    Product(
      details: 'Designed for children between 4-65 lbs. and up to 49" tall.',
      rating: 3,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Convertible Car Seats',
      name: 'NextFit Max Zip Air',
      price: 825,
      description: 'Simple and secure.',
      colors: [
        Colors.black,
      ],
      imgs: [
        [
          './assets/images/nmzvero1.jpeg',
          './assets/images/nmzvero2.jpeg',
          './assets/images/nmzvero3.jpeg',
          './assets/images/nmzvero4.jpeg',
          './assets/images/nmzvero5.jpeg',
          './assets/images/nmzvero6.jpeg',
          './assets/images/nmzvero7.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'The NextFit® Zip is designed for children between 5-40 pounds and up to 43 inches tall in rear-facing mode and 22-65 pounds and up to 49 inches tall in forward-facing mode.',
      rating: 2.9,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Convertible Car Seats',
      name: 'NextFit Zip',
      price: 650,
      description: 'Simple and secure.',
      colors: [
        Colors.black,
      ],
      imgs: [
        [
          './assets/images/nzccarbon1.jpeg',
          './assets/images/nzccarbon2.jpeg',
          './assets/images/nzccarbon3.jpeg',
          './assets/images/nzccarbon4.jpeg',
          './assets/images/nzccarbon5.jpeg',
          './assets/images/nzccarbon6.jpeg',
          './assets/images/nzccarbon7.jpeg',
        ],
      ],
      best: false,
    ),

    //carseats - Infants
    Product(
      details:
          'The Fit2® Air is designed for children who are less than 35" in height and from 4-35 lbs.',
      rating: 4.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infant Car Seats',
      name: 'Fit2 Air',
      price: 650,
      description: 'For newborns & infants.',
      colors: [
        Colors.black,
      ],
      imgs: [
        [
          './assets/images/faivero1.jpeg',
          './assets/images/faivero2.jpeg',
          './assets/images/faivero3.jpeg',
          './assets/images/faivero4.jpeg',
          './assets/images/faivero5.jpeg',
          './assets/images/faivero6.jpeg',
          './assets/images/faivero7.jpeg',
        ],
      ],
      best: true,
    ),
    Product(
      details:
          'The Fit2® is designed for children between 4-35 pounds in Stage One, 15-35 pounds in Stage Two, and up to 35 inches tall.',
      rating: 3.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infant Car Seats',
      name: 'Fit2',
      price: 650,
      description: 'For newborns & infants.',
      colors: [
        Colors.brown[700]!,
        Colors.black,
        Colors.black54,
        Colors.black45,
      ],
      imgs: [
        [
          './assets/images/faicienna1.jpeg',
          './assets/images/faicienna2.jpeg',
          './assets/images/faicienna3.jpeg',
          './assets/images/faicienna4.jpeg',
          './assets/images/faicienna5.jpeg',
          './assets/images/faicienna6.jpeg',
          './assets/images/faicienna7.jpeg',
        ],
        [
          './assets/images/faistaccato1.jpeg',
          './assets/images/faistaccato2.jpeg',
          './assets/images/faistaccato3.jpeg',
          './assets/images/faistaccato4.jpeg',
          './assets/images/faistaccato5.jpeg',
          './assets/images/faistaccato6.jpeg',
          './assets/images/faistaccato7.jpeg',
        ],
        [
          './assets/images/faiventure1.jpeg',
          './assets/images/faiventure2.jpeg',
          './assets/images/faiventure3.jpeg',
          './assets/images/faiventure4.jpeg',
          './assets/images/faiventure5.jpeg',
          './assets/images/faiventure6.jpeg',
          './assets/images/faiventure7.jpeg',
        ],
        [
          './assets/images/faiember1.jpeg',
          './assets/images/faiember2.jpeg',
          './assets/images/faiember3.jpeg',
          './assets/images/faiember4.jpeg',
          './assets/images/faiember5.jpeg',
          './assets/images/faiember6.jpeg',
          './assets/images/faiember7.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'The KeyFit® ClearTex® is designed for infants between 4-22 pounds and up to 30 inches tall.',
      rating: 3.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infant Car Seats',
      name: 'KeyFit ClearTex',
      price: 550,
      description: 'For newborns & infants.',
      colors: [
        Colors.black,
        Colors.black54,
        Colors.black38,
        Colors.grey,
        Colors.blue[700]!,
      ],
      imgs: [
        [
          './assets/images/kf3black1.jpeg',
          './assets/images/kf3black2.jpeg',
          './assets/images/kf3black3.jpeg',
          './assets/images/kf3black4.jpeg',
          './assets/images/kf3black5.jpeg',
          './assets/images/kf3black6.jpeg',
          './assets/images/kf3black7.jpeg',
        ],
        [
          './assets/images/kf3orion1.jpeg',
          './assets/images/kf3orion2.jpeg',
          './assets/images/kf3orion3.jpeg',
          './assets/images/kf3orion4.jpeg',
          './assets/images/kf3orion5.jpeg',
          './assets/images/kf3orion6.jpeg',
          './assets/images/kf3orion7.jpeg',
        ],
        [
          './assets/images/kf3pewter1.jpeg',
          './assets/images/kf3pewter2.jpeg',
          './assets/images/kf3pewter3.jpeg',
          './assets/images/kf3pewter4.jpeg',
          './assets/images/kf3pewter5.jpeg',
          './assets/images/kf3pewter6.jpeg',
          './assets/images/kf3pewter7.jpeg',
        ],
        [
          './assets/images/kf3slate1.jpeg',
          './assets/images/kf3slate2.jpeg',
          './assets/images/kf3slate3.jpeg',
          './assets/images/kf3slate4.jpeg',
          './assets/images/kf3slate5.jpeg',
          './assets/images/kf3slate6.jpeg',
          './assets/images/kf3slate7.jpeg',
        ],
        [
          './assets/images/kf31.jpeg',
          './assets/images/kf32.jpeg',
          './assets/images/kf33.jpeg',
          './assets/images/kf34.jpeg',
          './assets/images/kf35.jpeg',
          './assets/images/kf36.jpeg',
          './assets/images/kf37.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'The KeyFit20® ClearTex® is designed for infants between 4-22 pounds and up to 30 inches tall.',
      rating: 3.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infants Car Seats',
      name: 'KeyFit20 ClearTex',
      price: 550,
      description: 'For newborns & infants.',
      colors: [
        Colors.black,
        Colors.black54,
        Colors.black38,
        Colors.grey,
        Colors.blue[700]!,
      ],
      imgs: [
        [
          './assets/images/kf3calla1.jpeg',
          './assets/images/kf3calla2.jpeg',
          './assets/images/kf3calla3.jpeg',
          './assets/images/kf3calla4.jpeg',
          './assets/images/kf3calla5.jpeg',
          './assets/images/kf3calla6.jpeg',
          './assets/images/kf3calla7.jpeg',
        ],
        [
          './assets/images/kf3parker1.jpeg',
          './assets/images/kf3parker2.jpeg',
          './assets/images/kf3parker3.jpeg',
          './assets/images/kf3parker4.jpeg',
          './assets/images/kf3parker5.jpeg',
          './assets/images/kf3parker6.jpeg',
          './assets/images/kf3parker7.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'The KeyFit® 30 Zip Air is designed for infants between 4-30 pounds and up to 30 inches tall.',
      rating: 3.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infant Car Seats',
      name: 'KeyFit Zip Air',
      price: 550,
      description: 'For newborns & infants.',
      colors: [
        Colors.black,
        Colors.black54,
        Colors.black38,
        Colors.grey,
        Colors.blue[700]!,
      ],
      imgs: [
        [
          './assets/images/kfzQcollection1.jpeg',
          './assets/images/kfzQcollection2.jpeg',
          './assets/images/kfzQcollection3.jpeg',
          './assets/images/kfzQcollection4.jpeg',
          './assets/images/kfzQcollection5.jpeg',
          './assets/images/kfzQcollection6.jpeg',
          './assets/images/kfzQcollection7.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'The KeyFit® 30 Zip is designed for infants between 4-30 pounds and up to 30 inches tall.',
      rating: 3.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infant Car Seats',
      name: 'KeyFit Zip',
      price: 550,
      description: 'For newborns & infants.',
      colors: [
        Colors.black,
      ],
      imgs: [
        [
          './assets/images/kziblack1.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'KeyFit® 35 ClearTex® is designed for infants between 4-35 lbs. and up to 32" tall.',
      rating: 4.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infant Car Seats',
      name: 'KeyFit 35 ClearTex',
      price: 550,
      description: 'For newborns & infants.',
      colors: [
        Colors.grey,
        Colors.black54,
        Colors.black,
      ],
      imgs: [
        [
          './assets/images/kc3grey1.jpeg',
          './assets/images/kc3grey2.jpeg',
          './assets/images/kc3grey3.jpeg',
          './assets/images/kc3grey4.jpeg',
          './assets/images/kc3grey5.jpeg',
          './assets/images/kc3grey6.jpeg',
          './assets/images/kc3grey7.jpeg',
        ],
        [
          './assets/images/kc3shadow1.jpeg',
          './assets/images/kc3shadow2.jpeg',
          './assets/images/kc3shadow3.jpeg',
          './assets/images/kc3shadow4.jpeg',
          './assets/images/kc3shadow5.jpeg',
          './assets/images/kc3shadow6.jpeg',
          './assets/images/kc3shadow7.jpeg',
        ],
        [
          './assets/images/kc3oynx1.jpeg',
          './assets/images/kc3oynx2.jpeg',
          './assets/images/kc3oynx3.jpeg',
          './assets/images/kc3oynx4.jpeg',
          './assets/images/kc3oynx5.jpeg',
          './assets/images/kc3oynx6.jpeg',
          './assets/images/kc3oynx7.jpeg',
        ],
      ],
      best: true,
    ),
    Product(
      details:
          'KeyFit® 35 features premium cushioning encased in soft, knit fabric around baby’s head. The double-knit, full-coverage canopy offers UPF 50+ sun protection for comfort and peace of mind.',
      rating: 3.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infant Car Seats',
      name: 'KeyFit 35',
      price: 550,
      description: 'For newborns & infants.',
      colors: [
        Colors.black,
      ],
      imgs: [
        [
          './assets/images/kielement1.jpeg',
          './assets/images/kielement2.jpeg',
          './assets/images/kielement3.jpeg',
          './assets/images/kielement4.jpeg',
          './assets/images/kielement5.jpeg',
          './assets/images/kielement6.jpeg',
          './assets/images/kielement7.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'KeyFit® 35 Zip ClearTex® is designed for infants between 4-35 lbs. and up to 32" tall.',
      rating: 3.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infant Car Seats',
      name: 'KeyFit 35 Zip ClearTex',
      price: 550,
      description: 'For newborns & infants.',
      colors: [
        Colors.grey,
        Colors.black,
        Colors.blue[700]!,
      ],
      imgs: [
        [
          './assets/images/k35ash1.jpeg',
          './assets/images/k35ash2.jpeg',
          './assets/images/k35ash3.jpeg',
          './assets/images/k35ash4.jpeg',
          './assets/images/k35ash5.jpeg',
          './assets/images/k35ash6.jpeg',
          './assets/images/k35ash7.jpeg',
        ],
        [
          './assets/images/k35black1.jpeg',
          './assets/images/k35black2.jpeg',
          './assets/images/k35black3.jpeg',
          './assets/images/k35black4.jpeg',
          './assets/images/k35black5.jpeg',
          './assets/images/k35black6.jpeg',
          './assets/images/k35black7.jpeg',
        ],
        [
          './assets/images/k35reef1.jpeg',
          './assets/images/k35reef2.jpeg',
          './assets/images/k35reef3.jpeg',
          './assets/images/k35reef4.jpeg',
          './assets/images/k35reef5.jpeg',
          './assets/images/k35reef6.jpeg',
          './assets/images/k35reef7.jpeg',
        ],
      ],
      best: false,
    ),
    // Product(
    //   rating: 3.2,
    //   category: 'Car Seats',
    //   brand: 'Chicco',
    //   type: 'Infants Car Seats',
    //   name: 'KeyFit 35 Zip ClearTex',
    //   price: 550,
    //   description: 'For newborns & infants.',
    //   colors: [
    //     Colors.grey,
    //     Colors.black,
    //     Colors.blue[700]!,
    //   ],
    //   imgs: [
    //     [
    //       './assets/images/k35ash1.jpeg',
    //       './assets/images/k35ash2.jpeg',
    //       './assets/images/k35ash3.jpeg',
    //       './assets/images/k35ash4.jpeg',
    //       './assets/images/k35ash5.jpeg',
    //       './assets/images/k35ash6.jpeg',
    //       './assets/images/k35ash7.jpeg',
    //     ],
    //     [
    //       './assets/images/k35black1.jpeg',
    //       './assets/images/k35black2.jpeg',
    //       './assets/images/k35black3.jpeg',
    //       './assets/images/k35black4.jpeg',
    //       './assets/images/k35black5.jpeg',
    //       './assets/images/k35black6.jpeg',
    //       './assets/images/k35black7.jpeg',
    //     ],
    //     [
    //       './assets/images/k35reef1.jpeg',
    //       './assets/images/k35reef2.jpeg',
    //       './assets/images/k35reef3.jpeg',
    //       './assets/images/k35reef4.jpeg',
    //       './assets/images/k35reef5.jpeg',
    //       './assets/images/k35reef6.jpeg',
    //       './assets/images/k35reef7.jpeg',
    //     ],
    //   ],
    //   best: false,
    // ),
    Product(
      details:
          'The KeyFit® ClearTex® is designed for infants between 4-22 pounds and up to 30 inches tall.',
      rating: 3.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infant Car Seats',
      name: 'KeyFit ClearTex',
      price: 550,
      description: 'For newborns & infants.',
      colors: [
        Colors.black,
      ],
      imgs: [
        [
          './assets/images/kffblack1.jpeg',
          './assets/images/kffblack2.jpeg',
          './assets/images/kffblack3.jpeg',
          './assets/images/kffblack4.jpeg',
          './assets/images/kffblack5.jpeg',
          './assets/images/kffblack6.jpeg',
          './assets/images/kffblack7.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'The KeyFit® is designed for infants between 4-22 pounds and up to 30 inches tall.',
      rating: 3.2,
      category: 'Car Seats',
      brand: 'Chicco',
      type: 'Infant Car Seats',
      name: 'KeyFit',
      price: 550,
      description: 'For newborns & infants.',
      colors: [
        Colors.black,
      ],
      imgs: [
        [
          './assets/images/kkkencore1.jpeg',
          './assets/images/kkkencore2.jpeg',
          './assets/images/kkkencore3.jpeg',
          './assets/images/kkkencore4.jpeg',
          './assets/images/kkkencore5.jpeg',
          './assets/images/kkkencore6.jpeg',
          './assets/images/kkkencore7.jpeg',
        ],
      ],
      best: false,
    ),

    //strollers -
    Product(
      details: 'For children up to 50 lb.',
      category: 'Strollers',
      brand: 'Chicco',
      type: 'Full Size Strollers',
      name: 'Corso le Modular',
      price: 900,
      rating: 4.2,
      description: 'Full Size Stroller.',
      colors: [
        Colors.grey[800]!,
      ],
      imgs: [
        [
          './assets/images/clm1.jpeg',
          './assets/images/clm2.jpeg',
          './assets/images/clm3.jpeg',
          './assets/images/clm4.jpeg',
          './assets/images/clm5.jpeg',
          './assets/images/clm7.jpeg',
        ],
      ],
      best: true,
    ),
    Product(
      details:
          'The BravoFor2® is designed for two children up to 40 pounds and 43 inches each.',
      category: 'Strollers',
      brand: 'Chicco',
      type: 'Double Strollers',
      name: 'Bravo For2',
      price: 850,
      rating: 3.7,
      description: 'Double Stroller.',
      colors: [
        Colors.grey,
        Colors.grey[900]!,
        Colors.black,
        Colors.pink[800]!,
      ],
      imgs: [
        [
          './assets/images/BravoFor21.jpeg',
          './assets/images/BravoFor22.jpeg',
          './assets/images/BravoFor23.jpeg',
          './assets/images/BravoFor24.jpeg',
          './assets/images/BravoFor25.jpeg',
          './assets/images/BravoFor26.jpeg',
          './assets/images/BravoFor27.jpeg',
        ],
      ],
      best: false,
    ),
    Product(
      details:
          'The Cortina® Together is designed for two children up to 40 pounds each.',
      category: 'Strollers',
      brand: 'Chicco',
      type: 'Double Strollers',
      name: 'Cortina Together',
      price: 875,
      rating: 3.7,
      description: 'Double Stroller.',
      colors: [
        Colors.grey[900]!,
      ],
      imgs: [
        [
          './assets/images/Cortina Together1.jpeg',
          './assets/images/Cortina Together2.jpeg',
          './assets/images/Cortina Together3.jpeg',
          './assets/images/Cortina Together4.jpeg',
          './assets/images/Cortina Together5.jpeg',
          './assets/images/Cortina Together6.jpeg',
          './assets/images/Cortina Together7.jpeg',
        ],
      ],
      best: true,
    ),
  ];

  // ignore: non_constant_identifier_names
  List<String> get Images {
    return [..._images];
  }

  // ignore: non_constant_identifier_names
  List<String> get RImages {
    return [..._rimages];
  }

  // ignore: non_constant_identifier_names
  List<String> get Brands {
    return [..._brands];
  }

  // ignore: non_constant_identifier_names
  List<String> get RName {
    return [..._rname];
  }

  // ignore: non_constant_identifier_names
  List<String> get Name {
    return [..._name];
  }

  // ignore: non_constant_identifier_names
  List<String> get BName {
    return [..._bname];
  }

  List<Product> get products {
    return [..._products];
  }

  List<Type> get types {
    return [..._types];
  }

  List<Product> get favorites {
    return [..._favorites];
  }

  List<Product> get cart {
    return [..._cart];
  }

  List<String> getTypes(String brand, String category) {
    return types
        .firstWhere(
            (element) => element.brand == brand && element.category == category)
        .type;
  }

  bool isAvailable(String brand, String category) {
    return products
        .where((item) => item.brand == brand && item.category == category)
        .isEmpty;
  }

  List getProducts(String brand, String category, String type) {
    return type == 'All'
        ? products
            .where((widget) =>
                widget.brand == brand && widget.category == category)
            .toList()
        : products
            .where(
              (widget) =>
                  widget.brand == brand &&
                  widget.category == category &&
                  widget.type == type,
            )
            .toList();
  }

  void addFav(Product prod) {
    _favorites.add(prod);
    notifyListeners();
  }

  void removeFav(Product prod) {
    _favorites.remove(prod);
    notifyListeners();
  }

  void add2Cart(Product prod) {
    _cart.add(prod);
    notifyListeners();
  }

  void remove4Cart(Product prod) {
    _cart.remove(prod);
    notifyListeners();
  }

  void deleteFav() {
    _favorites.removeRange(0, _favorites.length);
    notifyListeners();
  }

  List<String> productsNames() {
    List<String> prd = [];
    for (int i = 0; i < products.length; i++) {
      prd.add(products[i].name);
    }
    return prd;
  }
}
