Если image были созданы в результате выполнения ../run_all.sh, то следующий шаг можно пропустить

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
