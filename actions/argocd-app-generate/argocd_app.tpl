application/argocd.tpl
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
name: ${APP_NAME}
namespace: argocd
finalizers:
- resources-finalizer.argocd.argoproj.io
spec:
destination:
    namespace: ${NAMESPACE}
    server: https://kubernetes.default.svc
project: default
source:
    path: charts
    repoURL: https://github.com/mohamedragab2024/${REPO_NAME}.git
    targetRevision: env/prod
    helm:
    valueFiles:
        - values-live.yaml
syncPolicy:
    automated:
    prune: true
    selfHeal: true
    allowEmpty: true
    syncOptions:
    - CreateNamespace=true
