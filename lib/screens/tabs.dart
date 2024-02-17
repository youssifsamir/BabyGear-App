//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//providers
import '/providers/form.dart';
import '/providers/accounts.dart';
import '/providers/bottomappbar.dart';

//screens
import 'tips/tips.dart';
import '/screens/home.dart';
import '/screens/profile.dart';
import '/screens/products/prodgate.dart';
import '/screens/market/marketlanding.dart';

//widgets
import '/widgets/drawer.dart';
import '/widgets/selectbaby.dart';
import '/widgets/addlocation.dart';
import '/widgets/locationview.dart';

// ignore: use_key_in_widget_constructors
class TabScreen extends StatefulWidget {
  static const routeName = "./tabs.dart";

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<dynamic> body = [
    HomeScreen(),
    TipsScreen(),
    MarketLanding(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final update = Provider.of<FormProvider>(context);
    final user = Provider.of<AccountsProvider>(context);
    final provider = Provider.of<BottomAppBarProvider>(context);

    void changeLocaiton(BuildContext context) {
      HapticFeedback.heavyImpact();
      showModalBottomSheet(
        enableDrag: false,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (context) {
          return SizedBox(
            height: 390,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                Container(
                  width: 40,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //title
                Center(
                  child: Text(
                    'Change Your Location',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontFamily: 'Freehand',
                    ),
                  ),
                ),
                const Center(
                  child: SizedBox(
                    width: 300,
                    child: Divider(
                      color: Colors.black12,
                    ),
                  ),
                ),
                Expanded(
                  child: LocationView(),
                ),
                AddLocation(),
              ],
            ),
          );
        },
      );
    }

    void showPrivacy() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            insetPadding: const EdgeInsets.only(
              top: 25,
              left: 25,
              right: 25,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'Selling Privacy',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Open Sans',
                  fontSize: 21,
                ),
              ),
            ),
            content: Container(
              color: Colors.white,
              height: 450,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 394,
                    width: double.infinity,
                    child: Scrollbar(
                      interactive: true,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        child: Text(
                          "OVERVIEW\n\nThis App is operated by Tetina.\nTetina offers this App, including all information, tools and Services available from this App to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here. By using or purchasing something from us, you engage in our “Service” and agree to be bound by the following terms and conditions (“Terms of Service”). Please read these Terms of Service carefully before accessing or using our App. By accessing or using any part of the App, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the App or use any Services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.\nAny new features or tools which are added to the current store shall also be subject to the Terms of Service. You can review the most current version of the Terms of Service at any time on this page. We reserve the right to update, change or replace any part of these Terms of Service by posting updates and/or changes to our App. It is your responsibility to check this page periodically for changes. Your continued use of or access to the App following the posting of any changes constitutes acceptance of those changes.\nOur store is hosted on Shopify Inc. They provide us with the online e-commerce platform that allows us to sell our products and Services to you.\n\nSECTION 1 - ONLINE STORE TERMS\n\nBy agreeing to these Terms of Service, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this App.\nYou may not use our products for any illegal or unauthorized purpose nor may you, in the use of the Service, violate any laws in your jurisdiction (including but not limited to copyright laws).\nYou must not transmit any worms or viruses or any code of a destructive nature.\nA breach or violation of any of the Terms will result in an immediate termination of your Services.\n\nSECTION 2 - GENERAL CONDITIONS\n\nWe reserve the right to refuse service to anyone for any reason at any time.\nYou understand that your content (not including credit card information), may be transferred unencrypted and involve (a) transmissions over various networks; and (b) changes to conform and adapt to technical requirements of connecting networks or devices. Credit card information is always encrypted during transfer over networks.\nYou agree not to reproduce, duplicate, copy, sell, resell or exploit any portion of the Service, use of the Service, or access to the Service or any contact on the App through which the service is provided, without express written permission by us.\nThe headings used in this agreement are included for convenience only and will not limit or otherwise affect these Terms.\n\nSECTION 3 - ACCURACY, COMPLETENESS AND TIMELINESS OF INFORMATION\n\nWe are not responsible if information made available on this App is not accurate, complete or current. The material on this App is provided for general information only and should not be relied upon or used as the sole basis for making decisions without consulting primary, more accurate, more complete or more timely sources of information. Any reliance on the material on this App is at your own risk.\nThis App may contain certain historical information. Historical information, necessarily, is not current and is provided for your reference only. We reserve the right to modify the contents of this App at any time, but we have no obligation to update any information on our App. You agree that it is your responsibility to monitor changes to our App.\n\nSECTION 4 - MODIFICATIONS TO THE SERVICE AND PRICES\n\nPrices for our products are subject to change without notice.\nWe reserve the right at any time to modify or discontinue the Service (or any part or content thereof) without notice at any time.\nWe shall not be liable to you or to any third-party for any modification, price change, suspension or discontinuance of the Service.\n\nSECTION 5 - PRODUCTS OR SERVICES (if applicable)\n\nCertain products or Services may be available exclusively online through the App. These products or Services may have limited quantities and are subject to return or exchange only according to our Return Policy. To view our Return Policy, please visit [LINK TO RETURN POLICY]\nWe have made every effort to display as accurately as possible the colors and images of our products that appear at the store. We cannot guarantee that your computer monitor's display of any color will be accurate.\nWe reserve the right, but are not obligated, to limit the sales of our products or Services to any person, geographic region or jurisdiction. We may exercise this right on a case-by-case basis. We reserve the right to limit the quantities of any products or Services that we offer. All descriptions of products or product pricing are subject to change at anytime without notice, at the sole discretion of us. We reserve the right to discontinue any product at any time. Any offer for any product or service made on this App is void where prohibited.\nWe do not warrant that the quality of any products, Services, information, or other material purchased or obtained by you will meet your expectations, or that any errors in the Service will be corrected.\n\nSECTION 6 - ACCURACY OF BILLING AND ACCOUNT INFORMATION\n\nWe reserve the right to refuse any order you place with us. We may, in our sole discretion, limit or cancel quantities purchased per person, per household or per order. These restrictions may include orders placed by or under the same customer account, the same credit card, and/or orders that use the same billing and/or shipping address. In the event that we make a change to or cancel an order, we may attempt to notify you by contacting the e-mail and/or billing address/phone number provided at the time the order was made. We reserve the right to limit or prohibit orders that, in our sole judgment, appear to be placed by dealers, resellers or distributors.\nYou agree to provide current, complete and accurate purchase and account information for all purchases made at our store. You agree to promptly update your account and other information, including your email address and credit card numbers and expiration dates, so that we can complete your transactions and contact you as needed.\nFor more detail, please review our Returns Policy.\n\nSECTION 7 - OPTIONAL TOOLS\n\nWe may provide you with access to third-party tools over which we neither monitor nor have any control nor input.\nYou acknowledge and agree that we provide access to such tools ”as is” and “as available” without any warranties, representations or conditions of any kind and without any endorsement. We shall have no liability whatsoever arising from or relating to your use of optional third-party tools.\nAny use by you of the optional tools offered through the App is entirely at your own risk and discretion and you should ensure that you are familiar with and approve of the terms on which tools are provided by the relevant third-party provider(s).\nWe may also, in the future, offer new Services and/or features through the App (including, the release of new tools and resources). Such new features and/or Services shall also be subject to these Terms of Service.\n\nSECTION 8 - THIRD-PARTY LINKS\n\nCertain content, products and Services available via our Service may include materials from third-parties.\nThird-party links on this App may direct you to third-party Apps that are not affiliated with us. We are not responsible for examining or evaluating the content or accuracy and we do not warrant and will not have any liability or responsibility for any third-party materials or Apps, or for any other materials, products, or Services of third-parties.\nWe are not liable for any harm or damages related to the purchase or use of goods, Services, resources, content, or any other transactions made in connection with any third-party Apps. Please review carefully the third-party's policies and practices and make sure you understand them before you engage in any transaction. Complaints, claims, concerns, or questions regarding third-party products should be directed to the third-party.\n\nSECTION 9 - USER COMMENTS, FEEDBACK AND OTHER SUBMISSIONS\n\nIf, at our request, you send certain specific submissions (for example contest entries) or without a request from us you send creative ideas, suggestions, proposals, plans, or other materials, whether online, by email, by postal mail, or otherwise (collectively, 'comments'), you agree that we may, at any time, without restriction, edit, copy, publish, distribute, translate and otherwise use in any medium any comments that you forward to us. We are and shall be under no obligation (1) to maintain any comments in confidence; (2) to pay compensation for any comments; or (3) to respond to any comments.\nWe may, but have no obligation to, monitor, edit or remove content that we determine in our sole discretion to be unlawful, offensive, threatening, libelous, defamatory, pornographic, obscene or otherwise objectionable or violates any party’s intellectual property or these Terms of Service.\nYou agree that your comments will not violate any right of any third-party, including copyright, trademark, privacy, personality or other personal or proprietary right. You further agree that your comments will not contain libelous or otherwise unlawful, abusive or obscene material, or contain any computer virus or other malware that could in any way affect the operation of the Service or any related App. You may not use a false e-mail address, pretend to be someone other than yourself, or otherwise mislead us or third-parties as to the origin of any comments. You are solely responsible for any comments you make and their accuracy. We take no responsibility and assume no liability for any comments posted by you or any third-party.\n\nSECTION 10 - PERSONAL INFORMATION\n\nYour submission of personal information through the store is governed by our Privacy Policy. To view our Privacy Policy, please see [LINK TO PRIVACY POLICY]\n\nSECTION 11 - ERRORS, INACCURACIES AND OMISSIONS\n\nOccasionally there may be information on our App or in the Service that contains typographical errors, inaccuracies or omissions that may relate to product descriptions, pricing, promotions, offers, product shipping charges, transit times and availability. We reserve the right to correct any errors, inaccuracies or omissions, and to change or update information or cancel orders if any information in the Service or on any related App is inaccurate at any time without prior notice (including after you have submitted your order).\nWe undertake no obligation to update, amend or clarify information in the Service or on any related App, including without limitation, pricing information, except as required by law. No specified update or refresh date applied in the Service or on any related App, should be taken to indicate that all information in the Service or on any related App has been modified or updated.\n\nSECTION 12 - PROHIBITED USES\n\nIn addition to other prohibitions as set forth in the Terms of Service, you are prohibited from using the App or its content:\n(a) for any unlawful purpose; (b) to solicit others to perform or participate in any unlawful acts; (c) to violate any international, federal, provincial or state regulations, rules, laws, or local ordinances; (d) to infringe upon or violate our intellectual property rights or the intellectual property rights of others; (e) to harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate based on gender, sexual orientation, religion, ethnicity, race, age, national origin, or disability; (f) to submit false or misleading information;\n(g) to upload or transmit viruses or any other type of malicious code that will or may be used in any way that will affect the functionality or operation of the Service or of any related App, other Apps, or the Internet; (h) to collect or track the personal information of others; (i) to spam, phish, pharm, pretext, spider, crawl, or scrape; (j) for any obscene or immoral purpose; or (k) to interfere with or circumvent the security features of the Service or any related App, other Apps, or the Internet. We reserve the right to terminate your use of the Service or any related App for violating any of the prohibited uses.\n\nSECTION 13 - DISCLAIMER OF WARRANTIES; LIMITATION OF LIABILITY\n\nWe do not guarantee, represent or warrant that your use of our service will be uninterrupted, timely, secure or error-free.\nWe do not warrant that the results that may be obtained from the use of the service will be accurate or reliable.\nYou agree that from time to time we may remove the service for indefinite periods of time or cancel the service at any time, without notice to you.\nYou expressly agree that your use of, or inability to use, the service is at your sole risk. The service and all products and Services delivered to you through the service are (except as expressly stated by us) provided 'as is' and 'as available' for your use, without any representation, warranties or conditions of any kind, either express or implied, including all implied warranties or conditions of merchantability, merchantable quality, fitness for a particular purpose, durability, title, and non-infringement.\nIn no case shall Tetina, our directors, officers, employees, affiliates, agents, contractors, interns, suppliers, service providers or licensors be liable for any injury, loss, claim, or any direct, indirect, incidental, punitive, special, or consequential damages of any kind, including, without limitation lost profits, lost revenue, lost savings, loss of data, replacement costs, or any similar damages, whether based in contract, tort (including negligence), strict liability or otherwise, arising from your use of any of the service or any products procured using the service, or for any other claim related in any way to your use of the service or any product, including, but not limited to, any errors or omissions in any content, or any loss or damage of any kind incurred as a result of the use of the service or any content (or product) posted, transmitted, or otherwise made available via the service, even if advised of their possibility.\nBecause some states or jurisdictions do not allow the exclusion or the limitation of liability for consequential or incidental damages, in such states or jurisdictions, our liability shall be limited to the maximum extent permitted by law.\n\nSECTION 14 - INDEMNIFICATION\n\nYou agree to indemnify, defend and hold harmless Tetina and our parent, subsidiaries, affiliates, partners, officers, directors, agents, contractors, licensors, service providers, subcontractors, suppliers, interns and employees, harmless from any claim or demand, including reasonable attorneys’ fees, made by any third-party due to or arising out of your breach of these Terms of Service or the documents they incorporate by reference, or your violation of any law or the rights of a third-party.\n\nSECTION 15 - SEVERABILITY\n\nIn the event that any provision of these Terms of Service is determined to be unlawful, void or unenforceable, such provision shall nonetheless be enforceable to the fullest extent permitted by applicable law, and the unenforceable portion shall be deemed to be severed from these Terms of Service, such determination shall not affect the validity and enforceability of any other remaining provisions.\n\nSECTION 16 - TERMINATION\n\nThe obligations and liabilities of the parties incurred prior to the termination date shall survive the termination of this agreement for all purposes.\nThese Terms of Service are effective unless and until terminated by either you or us. You may terminate these Terms of Service at any time by notifying us that you no longer wish to use our Services, or when you cease using our App.\nIf in our sole judgment you fail, or we suspect that you have failed, to comply with any term or provision of these Terms of Service, we also may terminate this agreement at any time without notice and you will remain liable for all amounts due up to and including the date of termination; and/or accordingly may deny you access to our Services (or any part thereof).\n\nSECTION 17 - ENTIRE AGREEMENT\n\nThe failure of us to exercise or enforce any right or provision of these Terms of Service shall not constitute a waiver of such right or provision.\nThese Terms of Service and any policies or operating rules posted by us on this App or in respect to The Service constitutes the entire agreement and understanding between you and us and govern your use of the Service, superseding any prior or contemporaneous agreements, communications and proposals, whether oral or written, between you and us (including, but not limited to, any prior versions of the Terms of Service).\nAny ambiguities in the interpretation of these Terms of Service shall not be construed against the drafting party.\n\nSECTION 18 - GOVERNING LAW\n\nThese Terms of Service and any separate agreements whereby we provide you Services shall be governed by and construed in accordance with the laws of United States.\n\nSECTION 19 - CHANGES TO TERMS OF SERVICE\n\nYou can review the most current version of the Terms of Service at any time at this page.\nWe reserve the right, at our sole discretion, to update, change or replace any part of these Terms of Service by posting updates and changes to our App. It is your responsibility to check our App periodically for changes. Your continued use of or access to our App or the Service following the posting of any changes to these Terms of Service constitutes acceptance of those changes.\nSECTION 20 - CONTACT INFORMATION\nQuestions about the Terms of Service should be sent to us at youssifsamir2682001@gmail.com.\nOur contact information is posted below:\n\nCompany Name: MiniMoo\nEmail: minimoo@gmail.com\nPhone Number: +20 1015689385",
                          style: TextStyle(
                            color: Colors.black38,
                            fontFamily: 'Open Sans',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).primaryColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //Appbar
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromRGBO(70, 150, 151, 1)),
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: provider.getCurrentIndex == 3 ? 3 : 0,
        title: provider.getCurrentIndex == 0
            ? Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Hello ${user.getByUsername(user.currentUser).firstName}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: 'Freehand',
                      ),
                    ),
                  ),
                  FittedBox(
                    child: GestureDetector(
                      onTap: () => changeLocaiton(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(width: 20),
                          Text(
                            '${user.currentLocation.city}, ${user.currentLocation.street}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : provider.getCurrentIndex == 1
                ? Text(
                    "Mother's Daily Tips",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                      fontFamily: 'Freehand',
                    ),
                  )
                : provider.getCurrentIndex == 2
                    ? Text(
                        "Rent My Products",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 23,
                          fontFamily: 'Freehand',
                        ),
                      )
                    : Text(
                        "My Profile",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 25,
                          fontFamily: 'Freehand',
                        ),
                      ),
        actions: [
          provider.getCurrentIndex != 3 && provider.getCurrentIndex != 2
              ? SelectBaby()
              : provider.getCurrentIndex == 2
                  ? Padding(
                      padding: const EdgeInsets.only(right: 17),
                      child: GestureDetector(
                        onTap: () => showPrivacy(),
                        child: Icon(
                          Icons.info_outline,
                          color: Theme.of(context).primaryColor,
                          size: 26,
                        ),
                      ),
                    )
                  : Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.edit),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.notifications),
                          ),
                        ),
                      ],
                    ),
        ],
      ),

      //Drawer
      drawer: MainDrawer(),

      //Body
      body: Consumer<BottomAppBarProvider>(
        builder: (context, screen, _) => body[screen.index],
      ),

      //Floating Action Button
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          update.reset();
          Navigator.pushNamed(context, ProdGate.routeName);
        },
        highlightElevation: 0,
        focusElevation: 0,
        splashColor: Colors.transparent,
        backgroundColor: const Color.fromRGBO(235, 190, 170, 1),
        child: const FaIcon(
          FontAwesomeIcons.cartShopping,
          color: Colors.white,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //Bottom App Bar
      bottomNavigationBar: Consumer<BottomAppBarProvider>(
        builder: (context, i, _) => BottomAppBar(
          height: 45,
          notchMargin: 5,
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 10),
              IconButton(
                highlightColor: Colors.transparent,
                icon: const FaIcon(FontAwesomeIcons.house),
                color: i.getCurrentIndex == 0
                    ? const Color.fromRGBO(226, 223, 224, 1)
                    : Theme.of(context).primaryColor,
                onPressed: () {
                  i.updateBody(0);
                },
              ),
              const SizedBox(width: 25),
              IconButton(
                highlightColor: Colors.transparent,
                icon: const FaIcon(
                  FontAwesomeIcons.spa,
                  size: 28,
                ),
                color: i.getCurrentIndex == 1
                    ? const Color.fromRGBO(226, 223, 224, 1)
                    : Theme.of(context).primaryColor,
                onPressed: () {
                  i.updateBody(1);
                },
              ),
              const SizedBox(width: 95),
              IconButton(
                highlightColor: Colors.transparent,
                icon: const FaIcon(
                  FontAwesomeIcons.shop,
                  size: 27,
                ),
                color: i.getCurrentIndex == 2
                    ? const Color.fromRGBO(226, 223, 224, 1)
                    : Theme.of(context).primaryColor,
                onPressed: () {
                  i.updateBody(2);
                },
              ),
              const SizedBox(width: 25),
              IconButton(
                padding: const EdgeInsets.all(0),
                highlightColor: Colors.transparent,
                icon: const Icon(
                  Icons.person,
                  size: 40,
                ),
                color: i.getCurrentIndex == 3
                    ? const Color.fromRGBO(226, 223, 224, 1)
                    : Theme.of(context).primaryColor,
                onPressed: () {
                  i.updateBody(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
