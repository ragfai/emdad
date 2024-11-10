import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF9),
      body: Stack(
        children: [
          // Gradient header with title and back icon
          Container(
            height: 160, // Adjust height as needed
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
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
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'الشروط و الأحكام',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 48), // Placeholder to balance the layout
              ],
            ),
          ),
          // Main content with white background box
          Padding(
            padding: const EdgeInsets.only(top: 120), // Start overlapping here
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // White box containing introductory text and all terms
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(33),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Introductory Disclaimer Text inside the white box
                        const Text(
                          'عزيزي المستثمر، إمداد هي منصة إلكترونية تهدف إلى جمع أموال مجموعة من المستثمرين "عملاء المنصة" لغرض تمويل صناديق الاستثمار الزراعية المرخصة وهي غير مسؤولة عن أي سوء تصرف أو خرق لسياسات ولوائح هيئة سوق المال يصدر من مدراء الصناديق المرتبطة بها أو أياً من ذوي العلاقة بالصناديق المعروضة في المنصة، واستكمالاً لعملية التسجيل يتطلب موافقتك على الشروط والأحكام جميعاً، وهي كالتالي:',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),

                        // حقوقك section
                        _buildContentSection(
                          title: 'أولاً: حقوقك',
                          content: [
                            '1. الاطلاع على كافة المعلومات عن الفرص الاستثمارية المنشورة في المنصة، و كافة المعلومات التي تتضمن نفي الجهالة عن الفرصة.',
                            '2. من حقك الحصول على تقييم الأداء للفرصة الاستثمارية بشكل دوري حسب ما تم إيضاحه في الشروط والأحكام للفرصة التي تم الاستثمار بها، و ذلك من خلال دخولك على لوحة التحكم الخاصة بك.',
                            '3. منصة إمداد تلتزم بكافة المتطلبات التي تتعلق بحماية البيانات الشخصية للمستثمرين وفق ما ورد في سياسة الخصوصية للمنصة أو الأنظمة واللوائح الحكومية ذات العلاقة.',
                            '4. يمكنك معرفة جميع الاستثمارات، وحالتها ونسبة التقدم، والتقييم الدوري، وإعلان التصفية والتخارج عبر لوحة التحكم الخاصة بك.',
                            '5. سيتم إشعارك بأي تغيير جوهري في مجلس الإدارة أو شروط وأحكام الصندوق وإرسال ملخص بهذا التغيير خلال المدة الموضحة في لائحة الصناديق الاستثمارية أو ما تم ذكره في الشروط والأحكام، وذلك عبر لوحة التحكم الخاصة بك.',
                            '6. في حال عدم اكتمال الحد الأدنى للطرح في المدة المحددة فسيتم إرجاع كامل مبلغ الاستثمار إلى محفظتك ويمكنك بعدها تحويلها إلى حسابك المعرف في المنصة.'
                          ],
                        ),
                        const SizedBox(height: 20),

                        // إلتزاماتك section
                        _buildContentSection(
                          title: 'ثانياً: إلتزاماتك',
                          content: [
                            '1. يجب عليك قراءة شروط وأحكام الفرصة المطروحة قبل اتخاذ قرارك الاستثماري بشأن شراء وحدات أي فرصة استثمارية.',
                            '2. تتقاضى منصة إمداد رسوم اشتراك لا تتجاوز 1٪ من قيمة استثمار الفرد.',
                            '3. قد تتقاضى منصة إمداد بعض العمولات الإضافية من مدراء الصناديق في بعض الفرص وفقًا لما يتم ايضاحه في شروط وأحكام الفرص الاستثمارية.',
                            '4. الشعارات و العلامات التجارية الموجودة في المنصة مسجلة و محمية بموجب القانون و التعرض لأي منها قد يعرضك للمساءلة القانونية.',
                            '5. يتعين عليك معرفة أنه بمجرد دفع مبلغ الاستثمار من خلال المنصة مقابل شراء وحدات في الصندوق المطروح فإن هذا المبلغ يصبح غير قابل للإسترداد الا عند تصفية الصندوق.',
                            '6. منصة إمداد لها الحق في تعديل هذه الشروط والأحكام وتحديثها بشكل دوري، لذا نوصيك بمراجعتها بانتظام.',
                            '7. أنت مسؤول عن جميع المعلومات والأنشطة التي تتم عبر المنصة لذا يجب عليك اتخاذ خطوات لحماية سرية اسم المستخدم وكلمة المرور الخاصين بك ويجب عليك إخطارنا على الفور إذا علمت بأي إفشاء أو فقدان أو سرقة أو استخدام غير مصرح به.',
                            '8. يتعين عليك معرفة أنه بتسجيلك في المنصة فإنك تعطي المنصة صلاحية فتح حساب افتراضي باسمك لدى البنك العربي.',
                            '9. يتعين عليك الاطلاع والموافقة على كل من سياسة الخصوصية و سياسة الإفصاح قبل التسجيل في المنصة.'
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build content sections with title and list of items
  Widget _buildContentSection({
    required String title,
    required List<String> content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title with gradient background
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF4B7960),
                Color(0xFF728F66),
                Color(0xFFA2AA6D),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Markazi Text',
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        for (var item in content) ...[
          Text(
            item,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
