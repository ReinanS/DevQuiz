import 'package:dev_quiz/views/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:dev_quiz/views/settings/widgets/custom_radio_list_tile.dart';
import 'package:dev_quiz/views/shared/widgets/gradient_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dev_quiz/core/app_routes.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SelectedTheme _opcao = SelectedTheme.Light;

  @override
  void initState() {
    super.initState();
    _setThemeSelected();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    SettingsController controller = Provider.of<SettingsController>(context);

    return Theme(
      data: controller.currentAppTheme,
      child: Scaffold(
        appBar: _appBar(),
        body: _body(deviceSize, controller),
        bottomNavigationBar: _bottom(deviceSize),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: GradientAppBarWidget(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, AppRoutes.homeRoute);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                ),
              ),
            ),
            Text(
              "Configurações",
              style: AppTextStyles.titleBold.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        )));
  }

  Widget _body(Size deviceSize, SettingsController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: deviceSize.width * 0.1,
        vertical: deviceSize.height * 0.05,
      ),
      child: ValueListenableBuilder(
        valueListenable: controller.themeNotifier,
        builder: (ctx, value, _) => Column(
          children: _radioList(controller),
        ),
      ),
    );
  }

  Widget _bottom(Size deviceSize) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: deviceSize.width * 0.1,
        vertical: deviceSize.height * 0.05,
      ),
      child: Row(
        children: [
          Expanded(
            child: NextButtonWidget.purple(
              label: "Sair",
              onTap: () async {
                // LoginController loginController = LoginController();
                // bool signedOut =
                //     await loginController.signOut(context: context);

                // if (signedOut) {
                //   Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
                // }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _radioList(SettingsController controller) {
    return [
      CustomRadioListTile(
        title: "Ativado",
        value: SelectedTheme.Dark,
        groupValue: _opcao,
        onChanged: (value) {
          controller.changeCurrentAppTheme(value!, context);
          setState(() {
            _opcao = value;
          });
        },
      ),
      CustomRadioListTile(
        title: "Desativado",
        value: SelectedTheme.Light,
        groupValue: _opcao,
        onChanged: (value) {
          controller.changeCurrentAppTheme(value!, context);
          setState(() {
            _opcao = value;
          });
        },
      ),
      CustomRadioListTile(
        title: "Sistema",
        subtitle:
            "Ajustaremos sua aparência com base nas configurações do dispositivo.",
        value: SelectedTheme.System,
        groupValue: _opcao,
        onChanged: (value) {
          controller.changeCurrentAppTheme(value!, context);
          setState(() {
            _opcao = value;
          });
        },
      ),
    ];
  }

  void _setThemeSelected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (prefs.containsKey("theme")) {
        int? savedTheme = prefs.getInt("theme");
        SelectedTheme getTheme = SettingsController().getTheme(savedTheme);

        this._opcao = getTheme;
      }
    });
  }
}
