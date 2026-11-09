# nginx sem privilegio: roda como usuario nao root (uid 101) na porta 8080
FROM nginxinc/nginx-unprivileged:1.27-alpine

USER root
# corrige CVEs de pacotes do sistema que ja tem correcao publicada
RUN apk upgrade --no-cache
USER 101

COPY --chown=101:101 conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY --chown=101:101 index.html style.css /usr/share/nginx/html/

EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/health || exit 1
# nenhum segredo na imagem
