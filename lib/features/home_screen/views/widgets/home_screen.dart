import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/features/landing_screen/landing_screen_main.dart';
import 'package:coffee_shop_app/features/landing_screen/widgets/salutation_widget.dart';
import 'package:coffee_shop_app/features/order_screen/views/order_screen_main.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    LandingScreenMain(),
    Text("Scan / Pay"),
    OrderScreenMain(),
    Text("Account"),
    Text("Rewards")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xEEF6F2ED),
        leading: IconButton(
          onPressed: () {
            ///Todo: Open drawer
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu_rounded,
            size: 40.0,
          )
        ),
        title: Image.asset(
          AppAssets.appIcon,
          height: 40.0,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    ///Todo: Open cart
                  },
                  icon: Image.asset(
                    AppAssets.cartIcon,
                    height: 32.0,
                  )
                ),

                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Color(0xEE4E8D7C),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    child: Text("99")
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        width: double.infinity,
        backgroundColor: AppColors.frothyWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: SalutationWidget(
                    showProfilePicture: true,
                    title: "Account",
                    titleFontSize: 32.0,
                    subtitle: "Welcome ${"SETSO"}!"
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.bold(
                                text: "Profile"
                              ),
                              _buildDrawerListTile(label: "Personal Info", icon: Icon(CupertinoIcons.info_circle)),
                              _buildDrawerListTile(label: "Cards & Payments", icon:Icon(CupertinoIcons.creditcard)),
                              _buildDrawerListTile(label: "Transaction History", icon: ImageIcon(AssetImage(AppAssets.drawerTileTransactionIcon))),
                              _buildDrawerListTile(label: "Privacy & Data", icon: ImageIcon(AssetImage(AppAssets.drawerTilePrivacyIcon))),
                              _buildDrawerListTile(label: "Account ID", icon: ImageIcon(AssetImage(AppAssets.drawerTileAccountIcon))),
                              const SizedBox(height: 24.0),

                              AppTexts.bold(
                                text: "Security"
                              ),
                              _buildDrawerSwitchWidgetTile(label: "2 factor authentication", isActive: true),
                              _buildDrawerSwitchWidgetTile(label: "Face ID", isActive: true),
                              _buildDrawerSwitchWidgetTile(label: "Passcode lock", isActive: false),
                              const SizedBox(height: 24.0),

                              AppTexts.bold(
                                text: "Notification references"
                              ),
                              _buildDrawerSwitchWidgetTile(label: "Inbox Messages", isActive: true),
                              _buildDrawerSwitchWidgetTile(label: "Tipping, Receipts & Orders", isActive: true),
                              const SizedBox(height: 24.0),

                              AppTexts.bold(
                                text: "Help & Policies"
                              ),
                              _buildDrawerListTile(label: "Help", icon: ImageIcon(AssetImage(AppAssets.drawerTileHelpIcon))),
                              _buildDrawerListTile(label: "Application Terms", icon: ImageIcon(AssetImage(AppAssets.drawerTileBookIcon))),
                              _buildDrawerListTile(label: "Privacy Notice", icon: ImageIcon(AssetImage(AppAssets.drawerTilePrivacyIcon))),
                              _buildDrawerListTile(label: "Delete Account", icon: ImageIcon(AssetImage(AppAssets.drawerTileForwardKeyboardIcon))),
                              // const SizedBox(height: 24.0),

                              TextButton(
                                onPressed: () {
                                  ///Todo: Do not share my personal Info
                                },
                                child: AppTexts.regular(
                                  text: "DO NOT SHARE MY PERSONAL INFORMATION",
                                  fontSize: 14.0,
                                  color: AppColors.moonlightMint
                                )
                              ),
                              const SizedBox(height: 8.0),

                              ElevatedButton(
                                onPressed: () {
                                  ///Todo: Log out
                                },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.frothyWhite,
                                    side: BorderSide(
                                      color: AppColors.moonlightMint,
                                      width: 1
                                    )
                                  ),
                                child: AppTexts.regular(
                                  text: "Sign Out",
                                  fontSize: 14.0,
                                  color: AppColors.moonlightMint
                                )
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40.0),
                          child: AppTexts.regular(
                            text: "v1.0 - Made With 🤩 + 🤗 by CODE WITH SETSO",
                            fontSize: 12.0
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.shade400,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.qrcode_viewfinder),
            label: "Scan / Pay"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: "Order"
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Account"
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star),
            label: "Rewards"
          ),
        ]
      ),
    );
  }

  Widget _buildDrawerListTile({required String label, required Widget icon}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: AppTexts.regular(text: label),
      trailing: icon,
    );
  }

  Widget _buildDrawerSwitchWidgetTile({required String label, required bool isActive}) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: AppTexts.regular(text: label),
        trailing: Switch(
          value: isActive, ///Todo: Use a variable to determine the switch state
          onChanged: (value) {
            ///Todo: Implement 2 factor authentication
          },
          activeTrackColor: AppColors.primaryGreen,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: AppColors.lightGrey,
          trackOutlineWidth: WidgetStatePropertyAll(0),
          padding: EdgeInsets.zero,
        )
    );
  }
}
