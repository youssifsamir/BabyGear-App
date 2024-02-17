//packages
import 'package:flutter/material.dart';

class TipsObj {
  final String title, image, category, text, vid, description;
  final Icon icon;
  final bool isPrem;
  final List<String> steps, details, imgs;
  TipsObj({
    required this.title,
    required this.image,
    required this.category,
    required this.isPrem,
    required this.text,
    required this.icon,
    required this.vid,
    required this.description,
    required this.steps,
    required this.details,
    required this.imgs,
  });
}

class TipsProvider with ChangeNotifier {
  int selected = 0;
  String category = 'All';

  // ignore: non_constant_identifier_names
  final List<TipsObj> _Tips = [
    TipsObj(
      title: 'Look Good In Pregnancy',
      image: './assets/images/c2.jpg',
      category: 'Clothes',
      isPrem: false,
      text: '5 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          // "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
          "",
      steps: [
        '1. Improve your posture',
        '2. Revolutionalize your hair',
        '3. Accentuate the positive',
        '4. Keep it simple',
        '5. Nurture the radiance',
      ],
      details: [
        "With all the changes in weight and gravity your body is going through, you may develop a bit of a slouch as your pregnancy progresses.\nAvoid the tendency to push your hips far forward and slouch your shoulders, or to stick your belly out and throw your shoulders back as you walk. These postures can cause back strain. Instead, keep your hips and shoulders in line as you walk, and keep your back straight by tucking a pillow behind you when you sit.",
        "Try a new hairstyle to go with your new body. If you have long hair, you may opt to cut it short. It will be easier to care for and will draw attention to your eyes and face. If you've got short or medium hair, try growing it out so you can experiment with fun upsweeps, braiding, combs, and hair clips.",
        "One of the best side effects of pregnancy is the accentuation. Dare to wear a slightly lower neckline than usual, or a blouse that clings. Take pride in your beautiful pregnant body.",
        "Don't overaccessorize your outfits when you're pregnant, the focus should be on your radiant glow! Stick to clean, simple lines and classic cuts. Don't wear large or busy patterns that overwhelm your curvy frame. Instead, opt for solid colors and add a patterned scarf or fun jewelry for interest.",
        "Moisturize daily and gently exfoliate your skin once or twice a week to keep your skin glowing and smooth. Protect your skin now more than ever from the sun's harmful rays by using a gentle sunscreen on your face and all exposed body parts whenever you'll be out in the sun.",
      ],
      imgs: [
        './assets/images/posture.png',
        './assets/images/hairo.png',
        './assets/images/prego.png',
        './assets/images/dresso.png',
        './assets/images/skino.png',
      ],
    ),
    TipsObj(
      title: 'Pregnancy Sooding Yoga',
      image: './assets/images/m1.jpg',
      category: 'Meditation',
      isPrem: true,
      text: '20 mins',
      icon: const Icon(
        Icons.timer_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Choosing The Right Pregnancy Fits',
      image: './assets/images/c1.jpg',
      category: 'Clothes',
      isPrem: false,
      text: '5 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Look For Yourself',
      image: './assets/images/p1.jpg',
      category: 'Selfcare',
      isPrem: false,
      text: '2 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: "Baby's Sleep",
      image: './assets/images/b1.jpg',
      category: 'Baby',
      isPrem: false,
      text: '5 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'The Perfect Workout',
      image: './assets/images/s2.jpg',
      category: 'Sports',
      isPrem: true,
      text: '25 mins',
      icon: const Icon(
        Icons.timer_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Balance Your Weight',
      image: './assets/images/s3.jpg',
      category: 'Sports',
      isPrem: false,
      text: '20 mins',
      icon: const Icon(
        Icons.timer_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'A Better Connection',
      image: './assets/images/b5.jpg',
      category: 'Baby',
      isPrem: false,
      text: '4 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Smooth Baby Skin',
      image: './assets/images/b4.jpg',
      category: 'Baby',
      isPrem: false,
      text: '2 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Move Your Body',
      image: './assets/images/s1.jpeg',
      category: 'Sports',
      isPrem: false,
      text: '15 mins',
      icon: const Icon(
        Icons.timer_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: "Healthy Baby Routine",
      image: './assets/images/b3.jpg',
      category: 'Baby',
      isPrem: true,
      text: '5 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Diet Management',
      image: './assets/images/e1.jpg',
      category: 'Foods & Drinks',
      isPrem: true,
      text: '4 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Sleep Scheduling',
      image: './assets/images/sl2.jpg',
      category: 'Sleeping',
      isPrem: true,
      text: '3 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Snacks & Nibbles',
      image: './assets/images/e3.jpg',
      category: 'Foods & Drinks',
      isPrem: false,
      text: '3 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'The 9th Month',
      image: './assets/images/p3.jpg',
      category: 'Pregnancy',
      isPrem: true,
      text: '5 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Pregnancy Breakfast',
      image: './assets/images/e3.jpg',
      category: 'Foods&Drinks',
      isPrem: false,
      text: '2 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Healthy Practices',
      image: './assets/images/p2.jpg',
      category: 'Pregnancy',
      isPrem: false,
      text: '3 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Announcing Your Pregnancy',
      image: './assets/images/p4.jpg',
      category: 'Pregnancy',
      isPrem: true,
      text: '3 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Pregnancy Skincare',
      image: './assets/images/sc1.jpg',
      category: 'Selfcare',
      isPrem: true,
      text: '3 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Stress & Tension Release',
      image: './assets/images/sc2.jpg',
      category: 'Selfcare',
      isPrem: false,
      text: '4 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Mental Stability',
      image: './assets/images/sc3.jpg',
      category: 'Selfcare',
      isPrem: false,
      text: '3 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Road To A Happy Pregnancy Journey',
      image: './assets/images/sc4.jpg',
      category: 'Selfcare',
      isPrem: false,
      text: '5 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: 'Steps To A Good Sleep',
      image: './assets/images/sl1.jpg',
      category: 'Sleeping',
      isPrem: false,
      text: '3 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
    TipsObj(
      title: "Your Baby's Comfort",
      image: './assets/images/b2.jpg',
      category: 'Baby',
      isPrem: false,
      text: '3 Steps',
      icon: const Icon(
        Icons.leaderboard_outlined,
        color: Colors.brown,
        size: 16,
      ),
      vid: 'DeQtzvHndZg',
      description:
          "Whether you've dreamed of being pregnant for years or it's taken you by surprise, chances are you've imagined what pregnancy might look and feel like. You may be looking forward to the changes your body will undergo as your baby grows – or you may be dreading them.\n\nIf you're apprehensive about the transformation or worried that being pregnant means you'll 'lose your looks,' you're not alone: Many women find that their body image takes a hit during pregnancy and afterward.",
      steps: [],
      details: [],
      imgs: [],
    ),
  ];

  List<TipsObj> get Tips {
    return [..._Tips];
  }

  void resetIndex() {
    selected = 0;
    category = 'All';
    notifyListeners();
  }

  void setSelected(int n) {
    selected = n;
    notifyListeners();
  }

  int getSelected() {
    return selected;
  }

  void setCategory(String c) {
    category = c;
    notifyListeners();
  }

  String getCategory() {
    return category;
  }

  final _type = [
    'All',
    'Pregnancy',
    'Baby',
    'Foods & Drinks',
    'Clothes',
    'Sports',
    'Selfcare',
    'Sleeping',
    'Meditation',
  ];
  List<String> get Type {
    return [..._type];
  }
}
