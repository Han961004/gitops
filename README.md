# 🚀 GitOps Kubernetes Infra Repository

이 저장소는 Argo CD 기반 GitOps 방식으로 관리되는 Kubernetes 인프라 리소스를 정의합니다.

---

## 📁 구성 요소

| 구성 요소           | 설명 |
|--------------------|------|
| **Argo CD**        | GitOps 방식으로 Kubernetes 리소스를 선언적 배포 및 자동 동기화 |
| **Prometheus**     | 클러스터 및 애플리케이션 메트릭 수집 |
| **Grafana**        | Prometheus 및 Loki와 연동하여 메트릭과 로그 시각화 |
| **Loki**           | 로그 수집 시스템. Grafana에서 조회 가능 |
| **NGINX Ingress**  | 외부 트래픽을 내부 서비스로 라우팅 |
| **DRF Backend**    | Django REST Framework 기반의 사용자 서비스 백엔드 |

---

## 📦 배포 구조

- 각 서비스는 **Helm Chart**로 구성되어 `.tgz` 형태로 패키징
- `index.yaml`은 Helm 저장소 역할을 하며 GitHub Pages로 서빙
- Argo CD는 해당 Helm Chart를 참조하여 자동으로 Kubernetes 리소스를 생성 및 동기화

---

## 📂 디렉토리 구조

gitops/
├── index.yaml # Helm 저장소 인덱스
├── grafana/ # Grafana Helm 차트
├── prometheus/ # Prometheus Helm 차트
├── loki/ # Loki Helm 차트
├── nginx/ # Ingress Controller Helm 차트
├── drf-backend/ # 사용자 정의 DRF 백엔드 Helm 차트
├── k8s/ # Argo CD Application 선언 YAML들
│ ├── application-grafana.yaml
│ ├── application-prometheus.yaml
│ ├── application-loki.yaml
│ ├── application-nginx.yaml
│ └── application-drf.yaml

## 🌐 서비스 주소 예시

| 서비스         | 주소 (예시)               |
|----------------|---------------------------|
| Grafana        | http://grafana.local      |
| Prometheus     | http://prometheus.local   |
| DRF Backend    | http://drf.yourdomain.com |

> 로컬 테스트 시 `/etc/hosts` 수정 또는 `minikube tunnel` 필요  
> 실제 운영 환경에서는 Ingress + cert-manager로 HTTPS 설정 추천

## ⚙️ Helm 패키징 및 저장소 업데이트

```bash
# 1. 의존성 설치 (예: loki 내부)
cd loki/
helm dependency update

# 2. Helm 차트 패키징
helm package .            # loki-0.1.0.tgz 생성
mv loki-0.1.0.tgz ../

# 3. Helm 저장소 index.yaml 갱신
cd ..
helm repo index . --url https://your-github-username.github.io/gitops
```

# namespace가 없다면 먼저 생성
kubectl create namespace argocd

# Argo CD Application 배포
kubectl apply -f k8s/application-grafana.yaml -n argocd
kubectl apply -f k8s/application-prometheus.yaml -n argocd
kubectl apply -f k8s/application-loki.yaml -n argocd
kubectl apply -f k8s/application-nginx.yaml -n argocd
kubectl apply -f k8s/application-drf.yaml -n argocd


🧪 로컬 개발 환경 테스트 팁
minikube tunnel 실행 시 Ingress Controller 주소 확인 가능
kubectl get ingress -A로 도메인 주소 확인
Grafana → Data Source → Loki 설정 후 로그 검색 가능
