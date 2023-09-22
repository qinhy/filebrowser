FROM golang:alpine
RUN apk --update add --no-cache npm
RUN apk --update add --no-cache make
COPY . /filebrowser
workdir /filebrowser
RUN cd ./frontend && npx tailwindcss -i ./src/css/twmain.css -o ./src/css/twmain.css
RUN make build
EXPOSE 8080
ENTRYPOINT [ "/filebrowser/filebrowser", "-a", "0.0.0.0"]