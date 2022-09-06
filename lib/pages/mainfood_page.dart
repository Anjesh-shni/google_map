import 'package:flutter/material.dart';
import 'package:hotel_lemon/pages/Search/search_page.dart';
import 'package:hotel_lemon/reusable_widget/small_text.dart';
import 'package:hotel_lemon/utils/colors.dart';
import '../model/model.dart';
import '../reusable_widget/big_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  final formkey = GlobalKey<FormState>();
  String? _name;

  void addToContact(Contact contact) {
    print('name: ${contact.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, bottom: 10),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BigText(
                      text: "Kathmandu",
                      size: 18,
                      color: AppColors.mainColor,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          SmallText(
                            text: "Nepal",
                            color: Colors.white,
                            size: 12,
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 19,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (conttext) {
                      return const Searchapge();
                    }));
                  },
                  child: Container(
                    width: 200,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade800,
                    ),
                    // ignore: prefer_const_constructors
                    child: Form(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            floatingLabelStyle: TextStyle(color: Colors.white),
                            icon: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.search,
                                color: Colors.amber,
                                size: 16,
                              ),
                            ),
                            labelText: "Search",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        keyboardType: TextInputType.multiline,
                        onSaved: (value) => _name = value!,
                      ),
                    ),
                    //  Padding(
                    //   padding: const EdgeInsets.only(right: 10),
                    //   child: const Align(
                    //     alignment: Alignment.centerRight,
                    //     child: Icon(
                    //       Icons.search,
                    //       color: Colors.amber,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 10),
          //   height: 30,
          //   width: double.maxFinite,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(2),
          //     color: Colors.grey.shade700,
          //   ),
          //   child: Center(
          //     child: SmallText(
          //       text: "List of Category",
          //       size: 14,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          //Body section
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: FoodPageBody(),
            ),
          )
        ],
      ),
    );
  }
}
