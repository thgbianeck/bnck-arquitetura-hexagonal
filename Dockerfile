FROM golang:1.20.14

WORKDIR /go/src
ENV PATH="/go/bin:${PATH}"

# Instalação dos binários executáveis
RUN go install github.com/golang/mock/mockgen@v1.6.0 && \
    go install github.com/spf13/cobra-cli@latest

# Instalação do SQLite3
RUN apt-get update && apt-get install sqlite3 -y

# Configuração do usuário
RUN usermod -u 1000 www-data
RUN mkdir -p /var/www/.cache
RUN chown -R www-data:www-data /go
RUN chown -R www-data:www-data /var/www/.cache
USER www-data

CMD ["tail", "-f", "/dev/null"]
