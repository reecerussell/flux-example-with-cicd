sudo snap install fluxctl kubectl

## Create

kubectl create ns flux

export GHUSER="reecerussell"

fluxctl install \
    --git-user=${GHUSER} \
    --git-email=${GHUSER}@users.noreply.github.com \
    --git-url=git@github.com:${GHUSER}/flux-example-with-cicd \
    --git-path=k8s/overlays/dev,k8s/overlays/prod \
    --namespace=flux | kubectl apply -f -

kubectl -n flux rollout status deployment/flux

fluxctl identity --k8s-fwd-ns flux

