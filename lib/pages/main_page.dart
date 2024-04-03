import 'package:flutter/material.dart';
import 'package:newsapp/pages/business_page.dart';
import 'package:newsapp/pages/entertainment_page.dart';
import 'package:newsapp/pages/environment_page.dart';
import 'package:newsapp/pages/food_page.dart';
import 'package:newsapp/pages/health_page.dart';
import 'package:newsapp/pages/politics_page.dart';
import 'package:newsapp/pages/science_page.dart';
import 'package:newsapp/pages/search_news_page.dart';
import 'package:newsapp/pages/technology_page.dart';
import 'package:newsapp/pages/top_news_page.dart';
import 'package:newsapp/pages/world_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Column(
            children: [
              TabBar(
                isScrollable:true,//ketmaket lenzni chiqarib beradi
                tabs: [
                  Tab(
                    child: Text("Top news"),),
                  Tab(
                    child: Text("sports"),),
                  Tab(
                    child: Text("Technology"),
                  ),Tab(
                    child: Text("Business"),
                  ),Tab(
                    child: Text("Science"),
                  ),Tab(
                    child: Text("Entertainment"),
                  ),Tab(
                    child: Text("Health"),
                  ),Tab(
                    child: Text("World"),
                  ),Tab(
                    child: Text("Politics"),
                  ),
                  Tab(
                    child: Text("Environment"),
                  ),Tab(
                    child: Text("Food"),
                  )
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  TopNewsPage(),
                  SearchNewsPage(),
                  TechnologyPage(),
                  BusinessPage(),
                  SciencePage(),
                  EntertainmentPage(),
                  HealthPage(),
                  WorldPage(),
                  PoliticsPage(),
                  EnvironmentPage(),
                  FoodPage(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
