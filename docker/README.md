Прежде чем собрать контейнер и запускать тест, необходимо сначала скачать данные и модели
```bash
../prepare_seminar.sh
```
Также нужно скачать модель с гугл-диска(не смог автоматизировать этот шаг): https://drive.google.com/open?id=1-A3A5MCIROmMpTQH2QuxAVCJ-oTtxJWI

Как собрать контейнер:
1. Перейти в папку docker
2. в терминале запустить 
```bash
./build_containers.sh
```
Данная команда создаст два контейнера для парсеров Китаева и Дозата-Маннинга

Как запустить контейнер:
1.
```bash
docker run -it --rm --memory="4096m" -v ~/<path-to-local-git-repository>:/home/models {hw/dozat или hw/kitaev} /bin/bash
```
2. Запустить скрипт, который показывает пример работы
```bash
./run_{dozat или kitaev}_test.sh
```
