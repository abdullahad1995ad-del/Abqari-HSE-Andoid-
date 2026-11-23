#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
echo "=== العبقري HSE | بناء APK ==="
for cmd in node npm java; do
  command -v "$cmd" >/dev/null || { echo "الأداة $cmd غير مثبتة."; echo "نفذ: pkg install nodejs openjdk-21"; exit 1; }
done
echo "[1/4] إصدارات البيئة"; node -v; npm -v; java -version
echo "[2/4] تثبيت المكتبات"; npm install
echo "[3/4] تجهيز Android"
if [ ! -d android ]; then npx cap add android; fi
npx cap sync android
echo "[4/4] فحص SDK والبناء"
SDK="${ANDROID_SDK_ROOT:-${ANDROID_HOME:-}}"
if [ -z "$SDK" ] || [ ! -d "$SDK/platforms" ] || [ ! -d "$SDK/build-tools" ]; then
  echo "توقف آمن: Android SDK الكامل غير مثبت/غير مضبوط."
  echo "المشروع متزامن، لكن لم يتم إنشاء APK."
  echo "لإنشاء APK دون تثبيت SDK على الهاتف، استخدم مسار GitHub Actions الموجود في .github/workflows/android-apk.yml."
  exit 2
fi
cd android
chmod +x gradlew
./gradlew assembleDebug
mkdir -p ../output
cp app/build/outputs/apk/debug/app-debug.apk ../output/Abqari_HSE_debug.apk
echo "APK جاهز داخل مجلد output."
