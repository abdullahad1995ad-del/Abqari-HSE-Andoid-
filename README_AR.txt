العبقري HSE — حزمة Android v3

هذه حزمة مصدر تطبيق + إعداد بناء APK. ملف التطبيق موجود في www/index.html.

المسار الأول: البناء عبر Termux
1) فك ZIP داخل مساحة Termux الخاصة.
2) افتح المجلد Abqari_HSE_Android_Prep.
3) نفذ:
   chmod +x BUILD_TERMUX.sh
   ./BUILD_TERMUX.sh

ملاحظة: بناء Android محلياً يحتاج Android SDK كامل (platforms وbuild-tools). وجود Node وJava وGradle وحدها لا يكفي.

المسار الثاني: بناء APK عبر GitHub Actions (لا يحتاج Android SDK على الهاتف)
1) أنشئ مستودع GitHub جديداً.
2) ارفع محتويات مجلد Abqari_HSE_Android_Prep إلى المستودع.
3) افتح تبويب Actions وشغّل workflow باسم Build Abqari HSE APK (أو ادفع commit إلى main).
4) بعد نجاح المهمة، افتح نتيجة التشغيل ثم Artifacts وحمّل Abqari-HSE-debug-apk.
5) فك artifact وثبّت app-debug.apk على الهاتف.

الحالة والفحوصات:
- تم التحقق من سلامة ZIP.
- تم فحص JavaScript الداخلي نحوياً باستخدام node --check.
- لم يتم تنفيذ build فعلي في بيئة Android هنا، ولم يتم اختبار APK على الهاتف.
- APK الناتج من هذا المسار Debug للتجربة، وليس إصدار متجر موقّعاً.
