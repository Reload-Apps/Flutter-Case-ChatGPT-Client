import 'package:chatgpt_flutter_case/core/constants/constants_shelf.dart';
import 'package:chatgpt_flutter_case/core/widgets/custom_appbar.dart';
import 'package:chatgpt_flutter_case/view_models.dart/chat_screen_view_model.dart';
import 'package:chatgpt_flutter_case/views/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'components/m_components_shelf.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final viewModel = ChatScreenViewModel();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(appBar: AppBar()),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Header(),
                  SizedBox(
                    height: size.height * .25,
                  ),
                  const NameText(),
                  const InfoText(),
                  const Spacer(),
                  MainScreenButton(
                    onTap: () {
                      GVariables.navigator.pushAndRemoveUntil(
                          route: ChatScreen(
                        viewModel: viewModel,
                      ));
                    },
                  ),
                  SizedBox(
                    height: size.height * .02,
                  )
                ],
              ),
            ),
          ),
          // Positioned(
          //   right: 8,
          //   top: 30,
          //   child: InkWell(
          //     onTap: () {
          //       GVariables.dialogService.showBottomSheet(
          //         context,
          //       );
          //     },
          //     child: Icon(
          //       FontAwesome5.user_circle,
          //       color: textPrimary(context),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
