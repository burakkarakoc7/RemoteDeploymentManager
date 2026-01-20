# 🔌 System API Specifications

Remote Deployment Manager, dış sistemlerle (CI/CD pipelines) haberleşmek için REST API kullanır.

## Endpoints

### 1. Trigger Deployment
Yeni bir dağıtım başlatır.
- **POST** `/api/v1/deploy`
- **Body:** `{ "config_path": "specs/deployment.yaml", "force": false }`

### 2. Status Check
Devam eden işlemin durumunu sorgular.
- **GET** `/api/v1/status/{deployment_id}`
- **Response:** `{ "status": "IN_PROGRESS", "percentage": 45 }`

### 3. Emergency Rollback
Acil durumda sistemi eski sürüme döndürür.
- **POST** `/api/v1/rollback/{deployment_id}`
- **Auth:** Requires Admin Token
