Write-Host "🚀 بدء رفع المشروع إلى GitHub..."

# مسار ملف النتيجة على سطح المكتب
$logPath = "$([Environment]::GetFolderPath('Desktop'))\upload_result.txt"

# التأكد أن Git مثبت
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    $msg = "❌ Git غير مثبت على جهازك. ثبّته أولاً."
    Write-Host $msg
    Set-Content -Path $logPath -Value $msg
    exit
}

# تهيئة Git
git init
$msg1 = "✔ تم تنفيذ git init"
Write-Host $msg1

# إضافة الملفات
git add .
$msg2 = "✔ تم تنفيذ git add ."
Write-Host $msg2

# أول حفظ
git commit -m "Initial commit"
$msg3 = "✔ تم تنفيذ git commit"
Write-Host $msg3

# تغيير الفرع إلى main
git branch -M main
$msg4 = "✔ تم تغيير الفرع إلى main"
Write-Host $msg4

# ربط المستودع
git remote add origin https://github.com/baderallhimi/express-api-starter.git
$msg5 = "✔ تم ربط المشروع بـ GitHub"
Write-Host $msg5

# رفع المشروع
git push -u origin main
$msg6 = "🎉 تم رفع المشروع بنجاح إلى GitHub!"
Write-Host $msg6

# كتابة النتائج في ملف نصي على سطح المكتب
Set-Content -Path $logPath -Value "$msg1`n$msg2`n$msg3`n$msg4`n$msg5`n$msg6"

Write-Host "📄 تم إنشاء ملف نصي في سطح المكتب يحتوي على النتائج."
