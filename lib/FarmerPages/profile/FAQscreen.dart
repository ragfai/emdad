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

  const FAQscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF9),
      body: Stack(
        children: [
          // Gradient header with rounded bottom corners
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4B7960),
                    Color(0xFF728F66),
                    Color(0xFFA2AA6D),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(33),
                  bottomRight: Radius.circular(33),
                ),
              ),
              child: Stack(
                children: [
                  // Back arrow button
                  Positioned(
                    top: 50,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // Centered title
                  const Positioned(
                    top: 90,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "الأسئلة الشائعة",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Markazi Text',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // FAQ content below the header
          Positioned.fill(
            top: 130,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    child: ExpansionTile(
                      title: Text(
                        questions[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4B7960),
                          fontFamily: 'Markazi Text',
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            answers[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontFamily: 'Markazi Text',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
