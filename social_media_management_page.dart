import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SocialMediaManagementPage extends StatefulWidget {
  const SocialMediaManagementPage({Key? key}) : super(key: key);

  @override
  _SocialMediaManagementPageState createState() => _SocialMediaManagementPageState();
}

class _SocialMediaManagementPageState extends State<SocialMediaManagementPage> {
  final TextEditingController _postController = TextEditingController();
  final List<String> _scheduledPosts = [];

  void _schedulePost() {
    if (_postController.text.isNotEmpty) {
      setState(() {
        _scheduledPosts.add(_postController.text);
      });
      _postController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Social Media Management")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _postController,
              decoration: InputDecoration(
                labelText: "Schedule Post",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _schedulePost,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _scheduledPosts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_scheduledPosts[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _scheduledPosts.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Post Interaction Analysis",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 5),
                      const FlSpot(1, 8),
                      const FlSpot(2, 6),
                      const FlSpot(3, 9),
                      const FlSpot(4, 4),
                      const FlSpot(5, 10),
                    ],
                    isCurved: true,
                    barWidth: 3,
                    gradient: LinearGradient(colors: [Colors.blue]),
                    dotData: FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
