
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise Recommendation',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/exercise': (context) => ExerciseScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 600,
              height: 600,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  'assets/images/Home.png',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exercise');
              },
              child: Text('운동 화면으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}


class ExerciseScreen extends StatelessWidget {
  final List<String> exercises = [
    'push-up',
    'squats',
    'lunge',
    'sit-up',
    'plank',
  ];

  final Map<String, String> exerciseDescriptions = {
    'push-up': '팔을 힘껏 폈다 폈다 하는 운동입니다.',
    'squats': '다리를 굽혀 앉았다 일어납니다.',
    'lunge': '한쪽 다리로 앞으로 한 발자국 내디뎠다 원래 자리로 돌아옵니다.',
    'sit-up': '등을 바닥에 대고 상체를 일으키는 운동입니다.',
    'plank': '양 손바닥과 발끝만 바닥에 대고 몸을 일직선으로 유지합니다.',
  };

  void recommendExercise(BuildContext context, String exercise) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exercise Recommendation'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(exercise),
              SizedBox(height: 10),
              Text(exerciseDescriptions[exercise]!),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Recommendation'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/push-up.png',
                width: 200,
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  recommendExercise(context, 'push-up');
                },
                child: Text('push-up'),
              ),
              Image.asset(
                'assets/images/squat.png',
                width: 200,
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  recommendExercise(context, 'squats');
                },
                child: Text('squats'),
              ),
              Image.asset(
                'assets/images/lunge.png',
                width: 200,
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  recommendExercise(context, 'lunge');
                },
                child: Text('lunge'),
              ),
              Image.asset(
                'assets/images/sit-up.png',
                width: 200,
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  recommendExercise(context, 'sit-up');
                },
                child: Text('sit-up'),
              ),
              Image.asset(
                'assets/images/plank.png',
                width: 200,
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  recommendExercise(context, 'plank');
                },
                child: Text('plank'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

