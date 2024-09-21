import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الشروط والأحكام")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Adding the investor disclaimer text at the top
              const Text(
                'عزيزي المستثمر، إمداد هي منصة إلكترونية تهدف إلى جمع أموال مجموعة من المستثمرين "عملاء المنصة" لغرض تمويل صناديق الاستثمار الزراعية المرخصة وهي غير مسؤولة عن أي سوء تصرف أو خرق لسياسات ولوائح هيئة سوق المال يصدر من مدراء الصناديق المرتبطة بها أو أياً من ذوي العلاقة بالصناديق المعروضة في المنصة، واستكمالاً لعملية التسجيل يتطلب موافقتك على الشروط والأحكام جميعاً، وهي كالتالي:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Outer container with a shadow and background color (box behind)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Middle box with linear gradient
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4B7960), // First color in the gradient
                            Color(0xFF728F66), // Second color in the gradient
                            Color(0xFFA2AA6D), // Third color in the gradient
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'أولاً: حقوقك',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              const SizedBox(height: 20), // Space between sections

              // Adding the new content after the box
              const Text(
                '1. الاطلاع على كافة المعلومات عن الفرص الاستثمارية المنشورة في المنصة، و كافة المعلومات التي تتضمن نفي الجهالة عن الفرصة.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                '2. من حقك الحصول على تقييم الأداء للفرصة الاستثمارية بشكل دوري حسب ما تم إيضاحه في الشروط والأحكام للفرصة التي تم الاستثمار بها، و ذلك من خلال دخولك على لوحة التحكم الخاصة بك.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                '3. منصة إمداد تلتزم بكافة المتطلبات التي تتعلق بحماية البيانات الشخصية للمستثمرين وفق ما ورد في سياسة الخصوصية للمنصة أو الأنظمة واللوائح الحكومية ذات العلاقة.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                '4. يمكنك معرفة جميع الاستثمارات، وحالتها ونسبة التقدم، والتقييم الدوري، وإعلان التصفية والتخارج عبر لوحة التحكم الخاصة بك.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                '5. سيتم إشعارك بأي تغيير جوهري في مجلس الإدارة أو شروط وأحكام الصندوق وإرسال ملخص بهذا التغيير خلال المدة الموضحة في لائحة الصناديق الاستثمارية أو ما تم ذكره في الشروط والأحكام، وذلك عبر لوحة التحكم الخاصة بك.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                '6. في حال عدم اكتمال الحد الأدنى للطرح في المدة المحددة فسيتم إرجاع كامل مبلغ الاستثمار إلى محفظتك ويمكنك بعدها تحويلها إلى حسابك المعرف في المنصة.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
