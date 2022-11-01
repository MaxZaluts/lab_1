import 'package:flutter/material.dart';
import 'schedule.dart';
import 'homepage.dart';
void main() {
  runApp(
    MaterialApp(

        home:  MyApp()
    ),
  );
}


class MyApp extends StatelessWidget {
  MyApp({super.key});
  ScheduleData scheduleData = ScheduleData();
  late List<String> groups = scheduleData.getGroupsNames();
  late String? selectedGroup = groups[0];
  late Schedule schedule = scheduleData.getScheduleForGroup(selectedGroup);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Groups'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(150.0,300,150,15),
              child: DropdownButton<String>(
                  value: selectedGroup,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: groups
                      .map((group) =>
                      DropdownMenuItem(
                        value: group,
                        child: Text(group),
                      ))
                      .toList(),
                  onChanged: (String? newGroup) {
                    selectedGroup = newGroup!;
                  }
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Home(selectedGroup: selectedGroup)));
                },
                child: Text('Продовжити')),

          ],
        ),

      ),
    );
  }
}
