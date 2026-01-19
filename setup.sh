#!/bin/bash

echo "🚀 Remote Deployment Manager Kurulumu Başlatılıyor..."
echo "---------------------------------------------------"

# 1. Sanal Ortam Kontrolü
if [ ! -d "venv" ]; then
    echo "📦 Sanal ortam (venv) oluşturuluyor..."
    python3 -m venv venv
else
    echo "✅ Sanal ortam zaten mevcut."
fi

# 2. Ortamı Aktif Et
source venv/bin/activate

# 3. Kütüphaneleri Yükle
echo "⬇️  Gerekli kütüphaneler yükleniyor (requirements.txt)..."
pip install -r requirements.txt

# 4. Klasör Yapısını Oluştur
echo "📂 Proje dizinleri kontrol ediliyor..."
mkdir -p logs inventory playbooks src/core src/ui

# 5. Bitiriş
echo "---------------------------------------------------"
echo "✅ Kurulum Başarıyla Tamamlandı!"
echo "👉 Başlatmak için: 'streamlit run src/ui/app.py'"
