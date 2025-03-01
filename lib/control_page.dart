import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  void _connectBluetooth() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🔵 البحث عن أجهزة بلوتوث...")),
    );
  }

  void moveWheelchair(String direction) {
    print("🔄 الكرسي يتحرك: $direction");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("🚀 يتحرك: $direction")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🦼 تحكم في الكرسي الذكي",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // لون الخلفية للعنوان
        actions: [
          IconButton(
            icon: const Icon(Icons.bluetooth, color: Colors.white, size: 28),
            onPressed: _connectBluetooth,
          ),
        ],
      ),
      body: Stack(
        children: [
          // الخلفية الشفافة
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/tech.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // دوائر عرض نسبة الأكسجين والنبضات
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 10.0,
                    percent: 0.85,
                    center: const Text("85%",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    progressColor: Colors.green,
                    circularStrokeCap: CircularStrokeCap.round,
                    header: const Text("الأكسجين"),
                  ),
                  CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 10.0,
                    percent: 0.75,
                    center: const Text("75%",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    progressColor: Colors.red,
                    circularStrokeCap: CircularStrokeCap.round,
                    header: const Text("نبض القلب"),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // أزرار التحكم في الاتجاهات
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_upward,
                        size: 50, color: Colors.blue),
                    onPressed: () => moveWheelchair("أمام"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        size: 50, color: Colors.blue),
                    onPressed: () => moveWheelchair("يسار"),
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward,
                        size: 50, color: Colors.blue),
                    onPressed: () => moveWheelchair("يمين"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_downward,
                        size: 50, color: Colors.blue),
                    onPressed: () => moveWheelchair("خلف"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // زر الطوارئ
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("🚨 تم تفعيل وضع الطوارئ!")),
                  );
                },
                child: Text("🔴 تنبيه الطوارئ"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
