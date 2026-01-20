#!/bin/bash

echo "🧪 Test Süreci Başlatılıyor..."
echo "=============================="

# Sanal ortam kontrolü
if [ -d "venv" ]; then
    source venv/bin/activate
fi

# Pytest çalıştır
echo "Running Unit Tests..."
python3 -m pytest tests/

if [ $? -eq 0 ]; then
    echo "✅ BÜTÜN TESTLER BAŞARILI!"
else
    echo "❌ HATA: Bazı testler başarısız oldu."
    exit 1
fi
