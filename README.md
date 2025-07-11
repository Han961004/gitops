GitOps Kubernetes Infra - 이 저장소는 Argo CD 기반 GitOps 방식으로 Kubernetes 인프라 리소스를 선언적으로 관리합니다.

## 구성 요소

| 구성 요소          | 설명 |
|--------------------|------|
| **Argo CD**        | GitOps 방식으로 Kubernetes 리소스를 선언적 배포 및 자동 동기화 |
| **Prometheus**     | 클러스터 및 애플리케이션 메트릭 수집 |
| **Grafana**        | Prometheus 및 Loki와 연동하여 메트릭과 로그 시각화 |
| **Loki**           | 로그 수집 시스템. Grafana에서 조회 가능 |
| **NGINX Ingress**  | 외부 트래픽을 내부 서비스로 라우팅 |
| **App**            | Django REST Framework 기반의 사용자 서비스 백엔드 |
| **Postgresql**     | 백엔드 서비스 App, PostgreSQL과 연동됨 |
| **GitActions**     | CI 파이프라인 자동화 |
| **Redis**          | 캐시 또는 세션 저장소 등으로 사용되는 저장소 |

## 배포 구조

- 각 서비스는 **Helm Chart**로 구성되어 `.tgz` 형태로 패키징
- `index.yaml`은 Helm 저장소 역할을 하며 GitHub Pages로 서빙
- Argo CD는 해당 Helm Chart를 참조하여 자동으로 Kubernetes 리소스를 생성 및 동기화

## 디렉토리 구조

```bash
gitops/
├── .github/workflows
├── charts
│   ├── index.yaml
│   ├── ... .tgz
├── helm-charts/
│   ├── grafana/
│   ├── prometheus/
│   ├── loki/
│   ├── nginx/
│   ├── app/
│   ├── postgresql/
│   └── redis/
├── k8s/                       # Argo CD Application 선언 YAML
│   ├── grafana-app.yaml
│   ├── prometheus-app.yaml
│   ├── loki-app.yaml
│   ├── nginx-app.yaml
│   ├── app-app.yaml
│   ├── postgresql-app.yaml
│   └── redis-app.yaml
```

### Images

<img width="1919" height="907" alt="스크린샷 2025-07-10 230634" src="https://github.com/user-attachments/assets/9b421642-e553-4e09-985e-9200e6a555fb" />
<img width="1919" height="909" alt="스크린샷 2025-07-10 230722" src="https://github.com/user-attachments/assets/9a463bd0-eb8f-4469-99f6-61708826b780" />

