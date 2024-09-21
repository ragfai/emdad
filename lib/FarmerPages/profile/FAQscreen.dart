import 'package:flutter/material.dart';

class FAQscreen extends StatelessWidget {
  final List<String> questions = const [
    "كيف يمكنني إنشاء حساب جديد؟",
    "ما هي سياسة الخصوصية الخاصة بالتطبيق؟",
    "كيف يمكنني تحديث معلومات الحساب؟",
  ];

  final List<String> answers = const [
    "لإنشاء حساب جديد، انقر فوق 'إنشاء حساب' واتبع التعليمات.",
    "سياسة الخصوصية الخاصة بالتطبيق تضمن حماية معلوماتك الشخصية.",
    "لتحديث معلومات الحساب، انتقل إلى قسم 'حسابك' وقم بتحديث التفاصيل.",
  ];

  const FAQscreen({super.key}); // Keep const constructor if fields are const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الأسئلة الشائعة")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(questions[index], style: const TextStyle(fontSize: 18)),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(answers[index], style: const TextStyle(fontSize: 16)),
              )
            ],
          );
        },
      ),
    );
  }
}
