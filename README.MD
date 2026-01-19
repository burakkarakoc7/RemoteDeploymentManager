# ⚙️ Remote Deployment Manager - DevOps Automation Engine

**Remote Deployment Manager**, dağıtık sunucu mimarilerinde (Distributed Systems) uygulama sürümlerini güvenli, atomik ve izlenebilir bir şekilde dağıtmak, geri almak (rollback) ve yönetmek için geliştirilmiş, **DevOps odaklı** bir otomasyon aracıdır.

## ⚡ Öne Çıkan Özellikler

Proje, basit bir SSH komut dosyasının ötesinde hibrit bir dağıtım ve orkestrasyon mimarisi sunar:

* **Atomik Dağıtım (Atomic Deployments):** Dağıtım sırasında oluşabilecek ağ kopmalarına karşı "All-or-Nothing" prensibiyle çalışır; işlem başarısız olursa sistem otomatik olarak son kararlı sürüme döner (Auto-Rollback).
* **Ajanlı ve Ajansız Mimari (Agentless & Agent-based):** Hedef sunucularda (Target Nodes) minimum kaynak tüketimi için SSH üzerinden "Agentless" veya karmaşık metrik takibi için hafif "Agent" modunda çalışabilir.
* **Drift Detection (Konfigürasyon Sapma Tespiti):** Sunucudaki canlı konfigürasyon ile Git deposundaki "Infrastructure as Code" (IaC) tanımları arasındaki farkları (Drift) algılar ve raporlar.
* **Parallel Execution Engine:** `asyncio` tabanlı motoru sayesinde binlerce sunucuya aynı anda, düşük gecikme (low-latency) ile komut gönderebilir.

## 🏗️ Proje Mimarisi
Sistem, profesyonel DevOps standartlarına uygun modüler bir hiyerarşiye sahiptir:

```text
Remote_Deployment_Manager/
├── src/
│   ├── core/           # Ana orkestrasyon motoru (orchestrator.py) ve SSH wrapper
│   ├── modules/        # Load Balancer, Database Migration ve Service Restart modülleri
│   ├── agents/         # Uzak sunucularda çalışan hafif Python ajanları
│   └── ui/             # Streamlit tabanlı Deployment Dashboard
├── playbooks/          # YAML formatında tanımlanmış dağıtım senaryoları
├── inventory/          # Sunucu listeleri ve grup tanımları (hosts.ini / json)
└── logs/               # İşlem ve hata logları

## 🛡️ Otomasyon ve Güvenilirlik

Proje, "Sıfır Kesinti" (Zero Downtime) hedefine yönelik kendi kendini denetleme yeteneklerine sahiptir:

* **Pre-Flight Checks:** Dağıtım başlamadan önce disk alanı, port durumu ve bellek uygunluğunu otomatik kontrol eder.
* **Canary Release:** Yeni sürümü önce trafiğin %5'ini alan sunuculara yükler, hata oranı (error rate) artmazsa tüm sisteme yayar.
* **CI/CD Ready:** Jenkins, GitLab CI ve GitHub Actions pipeline'larına tek satırlık komut ile entegre olabilir ve çıkış kodlarına (exit codes 0/1) tam uyumludur.

## 📋 Güvenlik ve Audit Uyumluluğu (SOC2 & ISO 27001)

| İlke | Teknik Karşılık |
| :--- | :--- |
| **İzlenebilirlik (Audit Trail)** | Her dağıtım emri, çalıştıran kullanıcı ve IP adresiyle birlikte imzalı JSON loglarına kaydedilir. |
| **Sır Yönetimi (Secret Mgmt)** | SSH anahtarları ve API token'ları asla plaintext saklanmaz; Vault entegrasyonu ile bellekte çözülür. |
| **Yetkilendirme (RBAC)** | "Deployer", "Viewer" ve "Admin" rolleri ile sadece yetkili personelin üretim ortamına (Production) müdahalesi sağlanır. |





