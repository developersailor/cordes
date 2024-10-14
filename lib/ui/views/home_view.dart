import 'package:cordes/core/viewmodels/home_view_model.dart';
import 'package:cordes/ui/views/base_view.dart';
import 'package:cordes/ui/views/request_status_view.dart';
import 'package:cordes/ui/views/survey_view.dart';
import 'package:cordes/ui/views/request_view.dart';
import 'package:cordes/ui/views/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (p0) => p0.token(),
      builder: (BuildContext context, HomeViewModel model, Widget? child) =>
          Scaffold(
        backgroundColor: Colors.deepOrangeAccent.shade100,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.deepPurple[600],
            currentIndex: model.currentIndex,
            onTap: (int newValue) => model.setCurrentIndex(newValue),
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.deepPurple[600],
                  icon: Icon(
                    Icons.healing,
                    color: Colors.white,
                  ),
                  label: 'İstekler'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.deepPurple[600],
                  icon: Icon(
                    Icons.approval,
                    color: Colors.white,
                  ),
                  label: 'Onay Durumları'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.deepPurple[600],
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: 'Profil'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.deepPurple[600],
                  icon: Icon(
                    Icons.poll,
                    color: Colors.white,
                  ),
                  label: 'Anket')
            ]),
        floatingActionButton: model.currentIndex == 2
            ? null
            : SpeedDial(
                icon: Icons.add,
                activeIcon: Icons.remove,
                buttonSize: Size(56.0, 56.0),
                visible: true,
                closeManually: false,
                renderOverlay: false,
                curve: Curves.bounceIn,
                overlayColor: Colors.black,
                overlayOpacity: 0.5,
                onOpen: () => print('OPENING DIAL'),
                onClose: () => print('DIAL CLOSED'),
                tooltip: 'Speed Dial',
                heroTag: 'speed-dial-hero-tag',
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 8.0,
                shape: const CircleBorder(),
                children: [
                  SpeedDialChild(
                    child: const Icon(Icons.request_page),
                    backgroundColor: Colors.red,
                    label: 'İstek veya destek oluştur',
                    labelStyle: const TextStyle(fontSize: 18.0),
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, '/requestaddview');
                    },
                  ),
                ],
              ),
        appBar: AppBar(
          title: const Text('Cordes'),
          actions: [
            IconButton(
                onPressed: () {
                  model.logOut();
                  Navigator.pushNamed(context, "/login");
                },
                icon: Icon(Icons.logout))
          ], //Uygulama İsmi belirlendiğinde editlenecek
          backgroundColor: Colors.deepPurple[800],
        ),
        body: _buildBodyWidget(model),
      ),
    );
  }

  Widget _buildBodyWidget(HomeViewModel model) {
    switch (model.currentIndex) {
      case 0:
        return RequestView();
      case 1:
        return RequestStatusView();
      case 2:
        return UserProfileView();
      case 3:
        return SurveyView();
      default:
        return Text("Wrong selection");
    }
  }
}
