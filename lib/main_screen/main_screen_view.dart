import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videocalling/main_screen/background.dart';
import 'package:videocalling/main_screen/main_screen_controller.dart';
import 'package:videocalling/routes/app_routes.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Video Calling",
          style: GoogleFonts.lobsterTwo(
            color: Colors.white,
            fontSize: 26,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate, color: Colors.white),
            onPressed: () {
              Get.toNamed(AppRoutes.translation);
            },
          ),
        ],
      ),

      body: Background(
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 70, 16, 20),
            itemCount: controller.users.length,

            itemBuilder: (context, index) {
              final AppUser user = controller.users[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 12),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                ),

                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),

                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white.withOpacity(0.20),
                    child: Text(
                      user.name[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  title: Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  subtitle: Text(
                    "Available",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.65),
                      fontSize: 13,
                    ),
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // VIDEO CALL
                      _callButton(
                        icon: Icons.videocam_outlined,
                        onTap: () {
                          _startVideoCall(user);
                        },
                      ),

                      const SizedBox(width: 8),

                      // VOICE CALL
                      _callButton(
                        icon: Icons.call_outlined,
                        onTap: () {
                          _startVoiceCall(user);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // VIDEO CALL
  // ----------------------------------------------------------

  void _startVideoCall(AppUser user) {
    ZegoUIKitPrebuiltCallInvitationService().send(
      invitees: [ZegoCallUser(user.id, user.name)],
      isVideoCall: true,
    );
  }

  // ----------------------------------------------------------
  // VOICE CALL
  // ----------------------------------------------------------

  void _startVoiceCall(AppUser user) {
    ZegoUIKitPrebuiltCallInvitationService().send(
      invitees: [ZegoCallUser(user.id, user.name)],
      isVideoCall: false,
    );
  }

  // ----------------------------------------------------------
  // CALL BUTTON
  // ----------------------------------------------------------

  Widget _callButton({required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: Colors.white.withOpacity(0.15),
      shape: const CircleBorder(),

      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: Colors.white, size: 21),
        ),
      ),
    );
  }
}
