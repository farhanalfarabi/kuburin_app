import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kuburin_app/config/constants.dart';
import 'package:kuburin_app/data/data.dart';
import 'package:kuburin_app/models/hair_stylist_model.dart';
import 'package:kuburin_app/screens/widgets/services_list.dart';
import 'package:kuburin_app/screens/widgets/star_display.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://whatsform.com/4OsZ-G');

bool isFavIconActive = false;

class DetailScreen extends StatefulWidget {
  final HairStylist hairStylist;
  const DetailScreen({super.key, required this.hairStylist});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: size.height + 50,
          width: size.width,
          child: Stack(
            children: [
              Container(
                height: size.height / 3 + 20,
                width: size.width,
                color: Colors.green,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/14.png',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: size.width,
                      height: size.height,
                      color: Colors.purple.withOpacity(0.1),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 30,
                left: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: size.height / 3 - 50,
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        const Text(
                          'Pilihan Paket',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: servicesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ServiceListView(
                              serviceList: servicesList[index],
                            );
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(17),
                            color: myPrimaryColor,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Deskripsi',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Silver : Hanya Pemakaman",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Gold : Dimandikan, DiKafani,",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "            Dan Dimakamkan",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          maxLines: 2,
                                          softWrap: true,
                                          "Silver : Dimandikan, DiKafani, ",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          maxLines: 2,
                                          softWrap: true,
                                          "      Dimakamkan, Dan Pemeliharaan Makam",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myBtnColor,
                              fixedSize: Size(double.maxFinite, 20),
                            ),
                            onPressed: _launchUrl,
                            child: Text("Book",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // Hair Stylist image Container
                top: size.height / 3 - 110,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: size.width / 3 - 15,
                        height: size.height / 6 + 25,
                        decoration: BoxDecoration(
                          color: widget.hairStylist.color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  widget.hairStylist.imageUrl,
                                  scale: 1.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.hairStylist.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.hairStylist.salonName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: mySecondryTextColor,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xFFFCA919),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.hairStylist.star.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFCA919),
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                '(56)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: mySecondryTextColor,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: size.height / 3 - 70,
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      if (isFavIconActive) {
                        isFavIconActive = false;
                      } else {
                        isFavIconActive = true;
                      }
                    });
                  },
                  padding: const EdgeInsets.all(10),
                  shape: const CircleBorder(),
                  color: Colors.white,
                  child: Icon(
                    (isFavIconActive)
                        ? Icons.favorite_sharp
                        : Icons.favorite_outline_sharp,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
