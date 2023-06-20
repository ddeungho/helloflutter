
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
    'push-up': '바닥에 엎드려 손바닥을 어깨 너비로 벌리고 양손을 어깨 아래에 놓습니다. 발은 바닥에 붙이고 엉덩이는 고정된 자세를 유지합니다  '
        '양 손바닥을 바닥에서 밀어올려 상체를 들어올립니다. 팔꿈치는 약간 구부려지며 상체는 일직선을 이루어야 합니다.'
        '들어올린 상체를 천천히 내립니다. 팔꿈치를 굽히면서 몸을 바닥 쪽으로 내려놓습니다. 이때 엉덩이나 하체는 바닥에서 떨어지지 않아야 합니다.',
    'squats': '양 발을 어깨 너비로 벌리고, 발끝은 약간 바깥쪽으로 향하도록 서서 시작합니다. 팔은 앞으로 뻗어 전면 근육을 이용하여 균형을 유지합니다.'
        '상체를 곧게 유지한 상태에서 엉덩이를 뒤로 뺀 채 무릎을 굽혀 천천히 앉습니다. 엉덩이는 뒤로 빼면서 고관절을 굴곡시키며, 상체는 약간 앞으로 숙여집니다.'
        '엉덩이를 뒤로 밀며 천천히 일어납니다. 다리 근육을 이용하여 상체를 일으키면서 원래 자세로 돌아옵니다. 이때 상체는 곧게 유지해야 합니다',
    'lunge': '양 발을 어깨 너비로 벌리고, 상체는 약간 앞으로 숙입니다. 손은 허리에 위치하거나 앞으로 내밀어 균형을 잡습니다'
        '한 발을 앞으로 한 보폭 정도 내딛습니다. 앞으로 내딛는 발의 무릎은 90도 각도가 되도록 굽힙니다. 뒤로 빼는 다리는 뒤꿈치가 바닥에 닿을 정도로 내립니다'
        '앞 다리의 무릎이 바닥에 닿지 않도록 조심하며, 천천히 상체를 내립니다. 뒷 다리의 무릎은 바닥에 다가가지 않도록 유의합니다. 상체는 약간 앞으로 숙여집니다'
        '앞 다리를 밀며 천천히 일어납니다. 앞 다리의 발뒤꿈치로 힘을 주면서 상체를 일으킵니다. 뒤 다리도 약간 힘을 주어 일어서게 합니다',
    'sit-up': '바닥에 누워 등이 바닥에 닿도록 합니다. 다리는 굽혀서 발뒤꿈치를 바닥에 붙입니다. 양손은 가슴 앞에 교차시킵니다'
  '복부 근육을 이용하여 상체를 천천히 들어올립니다. 어깨와 상반신이 바닥에서 떨어지도록 하며, 팔은 가슴 쪽으로 향하도록 유지합니다. 들어올릴 때 숨을 들이마셔야 합니다'
        '상체를 천천히 내려놓으면서 등을 바닥에 닿게 합니다. 하체나 엉덩이는 바닥에서 떨어지지 않아야 합니다. 내려놓을 때 숨을 내쉬어야 합니다',
    'plank': '바닥에 누워 등이 바닥에 닿도록 합니다. 다리는 굽혀서 발뒤꿈치를 바닥에 붙입니다. 양손은 가슴 앞에 교차시킵니다'
        '복부 근육을 이용하여 상체를 천천히 들어올립니다. 어깨와 상반신이 바닥에서 떨어지도록 하며, 팔은 가슴 쪽으로 향하도록 유지합니다. 들어올릴 때 숨을 들이마셔야 합니다'
        '상체를 천천히 내려놓으면서 등을 바닥에 닿게 합니다. 하체나 엉덩이는 바닥에서 떨어지지 않아야 합니다. 내려놓을 때 숨을 내쉬어야 합니다',
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

