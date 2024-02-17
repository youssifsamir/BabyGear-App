//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:geocoding/geocoding.dart';
// ignore: depend_on_referenced_packages
// import 'package:geocoding/geocoding.dart';
// ignore: depend_on_referenced_packages
import 'package:geolocator/geolocator.dart';

class CreditCard {
  final String name, number, expiryDate, cvv;

  CreditCard({
    required this.number,
    required this.name,
    required this.expiryDate,
    required this.cvv,
  });
}

class Location {
  final int id;
  final String country,
      state,
      city,
      street,
      building,
      apartment,
      floor,
      landmark,
      description;
  Location({
    required this.id,
    required this.country,
    required this.state,
    required this.city,
    required this.street,
    required this.building,
    required this.floor,
    required this.apartment,
    required this.landmark,
    required this.description,
  });
}

class Transaction {
  final String image,
      prodname,
      brand,
      color,
      total,
      quantity,
      date,
      dDate,
      orderNo,
      location,
      status,
      payment;
  Transaction({
    required this.image,
    required this.prodname,
    required this.brand,
    required this.color,
    required this.total,
    required this.quantity,
    required this.date,
    required this.dDate,
    required this.orderNo,
    required this.location,
    required this.status,
    required this.payment,
  });
}

class History {
  final String image, prodname, brand, total, quantity, orderNo;
  History({
    required this.image,
    required this.prodname,
    required this.brand,
    required this.total,
    required this.quantity,
    required this.orderNo,
  });
}

class Rents {
  final String image,
      prodname,
      brand,
      color,
      quantity,
      rentedOn,
      rentedOff,
      rentDuration;
  Rents({
    required this.image,
    required this.prodname,
    required this.brand,
    required this.color,
    required this.quantity,
    required this.rentDuration,
    required this.rentedOn,
    required this.rentedOff,
  });
}

class Baby {
  String name, gender;
  DateTime dob;
  int id, age;
  bool months;
  double height, weight;

  Baby({
    required this.id,
    required this.name,
    required this.age,
    required this.months,
    required this.gender,
    required this.height,
    required this.weight,
    required this.dob,
  });
}

class Settings {
  bool notifications, livelocation, camera, gallery, newsletter;
  Settings({
    required this.notifications,
    required this.livelocation,
    required this.newsletter,
    required this.camera,
    required this.gallery,
  });
}

class Account {
  String username,
      firstName,
      lastName,
      password,
      gender,
      age,
      email,
      phoneNo,
      avatar;
  bool isPrem;
  bool disable;
  List<CreditCard> creditCards;
  List<Location> locations;
  List<Transaction> transactions;
  List<Rents> rents;
  List<History> history;
  List<Baby> babies;
  Settings settings;

  Account({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.gender,
    required this.age,
    required this.email,
    required this.phoneNo,
    required this.avatar,
    required this.isPrem,
    required this.disable,
    required this.creditCards,
    required this.locations,
    required this.transactions,
    required this.rents,
    required this.history,
    required this.babies,
    required this.settings,
  });
}

class AccountsProvider with ChangeNotifier {
  String currentUser = '',
      currentPlan = '',
      currentPackage = '',
      selected = 'Cairo';
  late Location currentLocation;
  late Baby currentBaby;

  String location = 'Null, Press Button';
  // ignore: non_constant_identifier_names
  String Address = 'Searching...';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    detectLocation(place);
  }

  // ignore: non_constant_identifier_names
  final List<Account> _AccountsList = [
    Account(
      username: 'Joe',
      firstName: 'Youssif',
      lastName: 'Samir',
      password: '123',
      gender: 'Male',
      age: '21',
      email: 'youssifsamir2682001@gmail.com',
      phoneNo: '+20 105689385',
      avatar: './assets/images/me.png',
      isPrem: false,
      disable: false,
      creditCards: [
        CreditCard(
          name: 'MOHAMMED SAMIR',
          number: '375045838856955',
          expiryDate: '03/9',
          cvv: '012',
        ),
        CreditCard(
          name: 'YOUSSIF MOHAMMED',
          number: '942599804483509',
          expiryDate: '05/2',
          cvv: '538',
        ),
        CreditCard(
          name: 'YOUSSIF MOHAMMED',
          number: '572053785738542',
          expiryDate: '02/8',
          cvv: '719',
        ),
      ],
      locations: [
        Location(
          id: 1,
          description: 'Home',
          country: 'Egypt',
          state: 'Alexandria',
          city: 'Gleem',
          street: 'El Mohafez Street',
          building: '05',
          floor: '02',
          apartment: '202',
          landmark: 'Beside Dexters Resturant',
        ),
        Location(
          id: 2,
          description: 'Office',
          country: 'Egypt',
          state: 'Cairo',
          city: '5th Settelment',
          street: 'Street 90',
          building: 'Fayrouz Compound',
          floor: '05',
          apartment: '502',
          landmark: 'Infront of Waterway Mall',
        ),
        Location(
          id: 3,
          description: 'Home 2',
          country: 'UAE',
          state: 'Dubai',
          city: 'Al Nahda',
          street: 'Nahrda St.',
          building: 'Tiger Buildings Block B',
          floor: '03',
          apartment: '307',
          landmark: 'Nahda Park',
        ),
      ],
      transactions: [
        Transaction(
          image: './assets/images/pro5.jpeg',
          prodname: 'Spots High Chair',
          brand: 'Chicco',
          color: 'Baby Blue',
          total: '2325 L.E',
          quantity: '2x',
          date: 'March 12th 2023',
          dDate: 'March 17th 2023',
          orderNo: '453281289',
          location: 'Alexandria, Smouha, Street 38',
          status: 'Packaging',
          payment: 'Cash On Delivery',
        ),
        Transaction(
          image: './assets/images/pro6.jpeg',
          prodname: 'Foldable Bather',
          brand: 'Joie',
          color: 'Pink',
          total: '3200 L.E',
          quantity: '1x',
          date: 'March 15th 2023',
          dDate: 'March 22th 2023',
          orderNo: '271755924',
          location: 'Cairo, Giza, Street 04',
          status: 'Shipping',
          payment: 'Credit Card',
        ),
        Transaction(
          image: './assets/images/pro4.jpeg',
          prodname: 'Mutltifunctional Bouncer',
          brand: 'Babyzen',
          color: 'Grey',
          total: '4199 L.E',
          quantity: '2x',
          date: 'March 19th 2023',
          dDate: 'March 23th 2023',
          orderNo: '924788976',
          location: 'Alexandria, Smouha, Street 38',
          status: 'Pending',
          payment: 'Cash On Delivery',
        ),
        Transaction(
          image: './assets/images/pro7.jpeg',
          prodname: 'Baby Walker 2-in-1',
          brand: 'Fisher',
          color: 'Blue',
          total: '1200 L.E',
          quantity: '1x',
          date: 'March 19th 2023',
          dDate: 'March 23th 2023',
          orderNo: '7862129302',
          location: 'Alexandria, Smouha, Street 38',
          status: 'Packaging',
          payment: 'Cash On Delivery',
        ),
      ],
      rents: [
        Rents(
          image: './assets/images/pro2.png',
          prodname: 'Sports Car Seat',
          brand: 'Cybex',
          color: 'Teal',
          quantity: '2x',
          rentDuration: '7 days',
          rentedOn: 'March 18th',
          rentedOff: 'March 23th',
        ),
        Rents(
          image: './assets/images/pro3.jpeg',
          prodname: 'Cabriofix Car Seat',
          brand: 'Chicco',
          color: 'Red',
          quantity: '1x',
          rentDuration: '5 days',
          rentedOn: 'March 21st',
          rentedOff: 'March 28th',
        ),
        Rents(
          image: './assets/images/pro1.png',
          prodname: '4-Wheel Journey Stroller',
          brand: 'mothercare',
          color: 'Brown',
          quantity: '3x',
          rentDuration: '21 days',
          rentedOn: 'March 1st',
          rentedOff: 'March 22th',
        ),
      ],
      history: [
        History(
          image: './assets/images/pro2.png',
          prodname: 'Sports Car Seat',
          brand: 'Cybex',
          total: '5749 L.E',
          quantity: '2x',
          orderNo: '924788976',
        ),
        History(
          image: './assets/images/pro3.jpeg',
          prodname: 'Cabriofix Car Seat',
          brand: 'Chicco',
          total: '1325 L.E',
          quantity: '1x',
          orderNo: '271755924',
        ),
        History(
          image: './assets/images/pro1.png',
          prodname: '4-Wheel Journey Stroller',
          brand: 'mothercare',
          total: '3200 L.E',
          quantity: '1x',
          orderNo: '453281289',
        ),
      ],
      babies: [
        Baby(
          id: 1,
          name: 'Omar',
          age: 4,
          dob: DateTime(2023, 04, 21),
          months: true,
          gender: 'Boy',
          height: 25,
          weight: 6.7,
        ),
        Baby(
          id: 2,
          name: 'Farida',
          age: 2,
          dob: DateTime(2023, 02, 21),
          months: false,
          gender: 'Girl',
          height: 82,
          weight: 12,
        ),
      ],
      settings: Settings(
        notifications: true,
        livelocation: true,
        camera: false,
        gallery: true,
        newsletter: false,
      ),
    ),

    // Account(
    //   username: 'Habiba',
    //   name: 'Habiba Hany',
    //   password: '456',
    //   gender: 'F',
    //   age: '21',
    //   email: 'habiba@gmail.com',
    //   location: 'Egypt, Cairo',
    //   phoneNo: '01015689385',
    //   avatar: './assets/images/b2.jpg',
    //   isPrem: false,
    //   creditCards: [
    //     CreditCard(number: '375045838856955', expiryDate: '03/9', cvv: '012'),
    //     CreditCard(number: '572053785738542', expiryDate: '02/8', cvv: '719'),
    //     CreditCard(number: '942599804483509', expiryDate: '05/2', cvv: '538'),
    //   ],
    //   locations: [
    //     Location(
    //       country: 'Egypt',
    //       state: 'Alexandria',
    //       city: 'Smouha',
    //       street: 'Street 38',
    //       building: '05',
    //       floor: '03',
    //       apartment: '307',
    //     ),
    //     Location(
    //       country: 'United Arab Emirates',
    //       state: 'Dubai',
    //       city: 'Al Nahda',
    //       street: 'Tawon St.',
    //       building: 'Tigers Building',
    //       floor: '08',
    //       apartment: '804',
    //     ),
    //     Location(
    //       country: 'Egypt',
    //       state: 'Cairo',
    //       city: '5th Settelment',
    //       street: 'Street 90',
    //       building: 'Fayrouz Compound',
    //       floor: '05',
    //       apartment: '502',
    //     ),
    //     Location(
    //       country: 'Saudia Arabia',
    //       state: 'Riyadh',
    //       city: 'Olaya District',
    //       street: 'Shaheed St.',
    //       building: '12',
    //       floor: '28',
    //       apartment: '2205',
    //     ),
    //   ],
    //   transactions: [
    //     Transaction(
    //       prodname: '4-Wheel Journey Stroller',
    //       brand: 'mothercare',
    //       color: 'Brown',
    //       price: '3200 L.E',
    //       date: '24/08/2023',
    //       time: '09:47 pm',
    //       orderNo: 'Order number: 4532812',
    //       location: 'Egypt, Alexandria, Gleem, Street 04',
    //     ),
    //     Transaction(
    //       prodname: 'Sports Car Seat',
    //       brand: 'Cybex',
    //       color: 'Teal',
    //       price: '2500 L.E',
    //       date: '19/02/2023',
    //       time: '11:02 am',
    //       orderNo: 'Order number: 9247889',
    //       location: 'Egypt, Alexandria, Smouha, Street 38',
    //     ),
    //     Transaction(
    //       prodname: 'Cabriofix Car Seat',
    //       brand: 'Chicco',
    //       color: 'Red',
    //       price: '1325 L.E',
    //       date: '08/12/2022',
    //       time: '04:16 pm',
    //       orderNo: 'Order number: 2717559',
    //       location: 'Egypt, Alexandria, Gleem, Street 04',
    //     ),
    //   ],
    // )
  ];

  // ignore: non_constant_identifier_names
  List<Account> get AccountsList {
    return [..._AccountsList];
  }

  Account getByUsername(String username) {
    return _AccountsList.firstWhere((element) => element.username == username);
  }

  bool login(String username, String password) {
    int index =
        _AccountsList.indexWhere((element) => element.username == username);
    if (index != -1) {
      if (password == AccountsList[index].password) return true;
    }
    return false;
  }

  void setCurrentLocation() async {
    if (getByUsername(currentUser).locations.isEmpty) {
      Position position = await _getGeoLocationPosition();
      location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
      _getAddressFromLatLong(position);
    } else {
      currentLocation = getByUsername(currentUser).locations[0];
    }
    notifyListeners();
  }

  void setCurrentUser(String user) {
    currentUser = user;
    getByUsername(user).locations.isEmpty
        ? currentLocation = Location(
            id: 0,
            description: 'Unidentified',
            country: 'Unidentified',
            state: 'Unidentified',
            city: 'Unidentified',
            street: 'Unidentified',
            building: 'Unidentified',
            floor: 'Unidentified',
            apartment: 'Unidentified',
            landmark: 'Unidentified',
          )
        : currentLocation = getByUsername(user).locations[0];
    notifyListeners();
  }

  void setDisable(bool dis) {
    getByUsername(currentUser).disable = dis;
    notifyListeners();
  }

  void initilaizeBaby() {
    if (getByUsername(currentUser).babies.isEmpty) {
      currentBaby = Baby(
        id: -1,
        name: '',
        age: 0,
        dob: DateTime(0, 0, 0),
        months: false,
        gender: 'null',
        height: 0,
        weight: 0,
      );
      notifyListeners();
      return;
    }
    currentBaby = getByUsername(currentUser).babies[0];
    notifyListeners();
  }

  void setCurrentBaby(Baby baby) {
    currentBaby = baby;
    notifyListeners();
  }

  void addAddress(
      int id,
      String state,
      String city,
      String street,
      String building,
      String floor,
      String apartment,
      String landmark,
      String description,
      String country) {
    getByUsername(currentUser).locations.add(
          Location(
            id: id,
            state: state,
            city: city,
            street: street,
            building: building,
            floor: floor,
            apartment: apartment,
            landmark: landmark,
            description: description,
            country: country,
          ),
        );
    notifyListeners();
  }

  void editAddress(
      int id,
      String state,
      String city,
      String street,
      String building,
      String floor,
      String apartment,
      String landmark,
      String description,
      String country) {
    int index = getByUsername(currentUser)
        .locations
        .indexWhere((element) => element.id == id);
    Location loca = Location(
      id: id,
      state: state,
      city: city,
      street: street,
      building: building,
      floor: floor,
      apartment: apartment,
      landmark: landmark,
      description: description,
      country: country,
    );
    getByUsername(currentUser).locations.removeAt(index);
    getByUsername(currentUser).locations.insert(index, loca);
    notifyListeners();
  }

  void addBaby(String name, String gender, DateTime dob, int age, bool months,
      double weight, double height) {
    getByUsername(currentUser).babies.insert(
          0,
          Baby(
            id: getByUsername(currentUser).babies.length + 1,
            name: name,
            gender: gender,
            age: age,
            dob: dob,
            months: months,
            weight: weight,
            height: height,
          ),
        );
    initilaizeBaby();
    notifyListeners();
  }

  void editBaby(int id, String name, String gender, DateTime dob, int age,
      bool months, double weight, double height) {
    getByUsername(currentUser)
        .babies
        .firstWhere((element) => element.id == id)
        .name = name;
    getByUsername(currentUser)
        .babies
        .firstWhere((element) => element.id == id)
        .gender = gender;
    getByUsername(currentUser)
        .babies
        .firstWhere((element) => element.id == id)
        .dob = dob;
    getByUsername(currentUser)
        .babies
        .firstWhere((element) => element.id == id)
        .age = age;
    getByUsername(currentUser)
        .babies
        .firstWhere((element) => element.id == id)
        .months = months;
    getByUsername(currentUser)
        .babies
        .firstWhere((element) => element.id == id)
        .weight = weight;
    getByUsername(currentUser)
        .babies
        .firstWhere((element) => element.id == id)
        .height = height;

    notifyListeners();
  }

  void changeSettings(int op) {
    if (op == 0)
      getByUsername(currentUser).settings.notifications =
          !getByUsername(currentUser).settings.notifications;
    else if (op == 1)
      getByUsername(currentUser).settings.livelocation =
          !getByUsername(currentUser).settings.livelocation;
    else if (op == 2)
      getByUsername(currentUser).settings.camera =
          !getByUsername(currentUser).settings.camera;
    else if (op == 3)
      getByUsername(currentUser).settings.gallery =
          !getByUsername(currentUser).settings.gallery;
    else
      getByUsername(currentUser).settings.newsletter =
          !getByUsername(currentUser).settings.newsletter;

    notifyListeners();
  }

  void changeLocation(Location location) {
    currentLocation = location;
    notifyListeners();
  }

  void detectLocation(Placemark live) {
    currentLocation = Location(
      id: getByUsername(currentUser).locations.length + 1,
      country: live.country.toString(),
      state: live.locality.toString(),
      city: live.subLocality.toString(),
      street: live.street.toString(),
      building: 'null',
      floor: 'null',
      apartment: 'null',
      landmark: 'null',
      description: 'null',
    );
    notifyListeners();
  }

  void changePassword(String pass) {
    getByUsername(currentUser).password = pass;
    notifyListeners();
  }

  void changePhone(String phone) {
    getByUsername(currentUser).phoneNo = phone;
    notifyListeners();
  }

  bool getSetting(int n) {
    if (n == 0)
      return getByUsername(currentUser).settings.notifications;
    else if (n == 1)
      return getByUsername(currentUser).settings.livelocation;
    else if (n == 2)
      return getByUsername(currentUser).settings.camera;
    else if (n == 3)
      return getByUsername(currentUser).settings.gallery;
    else
      return getByUsername(currentUser).settings.newsletter;
  }

  void deleteBaby(Baby baby) {
    getByUsername(currentUser).babies.removeWhere((element) => element == baby);
    initilaizeBaby();
    notifyListeners();
  }

  void deleteAddress(Location location) {
    if (currentLocation == location) {
      setCurrentLocation();
    }
    getByUsername(currentUser)
        .locations
        .removeWhere((element) => element == location);
    notifyListeners();
  }

  void deleteCredit(CreditCard card) {
    getByUsername(currentUser)
        .creditCards
        .removeWhere((element) => element == card);
    notifyListeners();
  }

  void addCreditCard(CreditCard card) {
    getByUsername(currentUser).creditCards.add(card);
    notifyListeners();
  }

  void setCurrentPlan(String plan) {
    currentPlan = plan;
    notifyListeners();
  }

  String getCurrentPlan() {
    return currentPlan;
  }

  void setCurrentPackage(String package) {
    getByUsername(currentUser).isPrem = true;
    currentPackage = package;
    notifyListeners();
  }

  String getCurrentPackage() {
    return currentPackage;
  }

  final _type = [
    'Favorites',
    'Manage Babies',
    'Current Rented Products',
    'My Orders',
    'Transaction History',
    'Manage Credit Cards',
    'Manage Address Book',
  ];

  // ignore: non_constant_identifier_names
  List<String> get Type {
    return [..._type];
  }

  int index = 0;

  int get getCurrentIndex {
    return index;
  }

  void resetIndex() {
    index = 0;
  }

  void updateBody(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  final List<String> _states = [
    'Cairo',
    'Alexandria',
    'Mansoura',
    'Giza',
    'Domyat',
    'Monfeya',
    'Port Said',
    'Sina',
  ];

  List<String> get states {
    return [..._states];
  }

  void setSelected(String state) {
    selected = state;
    notifyListeners();
  }

  // int emailValidation(String email) {
  //   if (email == '') {
  //     return 0;
  //   } else if (email.contains('@')) {
  //     return 1;
  //   }
  //   return 2;
  // }

  void addAccount(Account acc) {
    _AccountsList.add(
      Account(
        firstName: acc.firstName,
        lastName: acc.lastName,
        username: acc.username,
        gender: acc.gender,
        phoneNo: acc.phoneNo,
        password: acc.password,
        email: acc.email,
        age: acc.age,
        avatar: acc.avatar,
        isPrem: false,
        disable: false,
        creditCards: [],
        locations: [],
        babies: [],
        rents: [],
        transactions: [],
        history: [],
        settings: Settings(
          notifications: false,
          livelocation: false,
          camera: false,
          gallery: false,
          newsletter: false,
        ),
      ),
    );
    currentUser = acc.username;
    notifyListeners();
  }
}
