Как собрать контейнер:
1. Перейти в папку docker
2. в терминале запустить docker build -t parser/kitaev-parser .

Как запустить контейнер:
1.
```bash
docker run -it --rm -p 8888:8888 -v <localdir>:/home/models parser/kitaev-parser sh ./run_jupyter.sh
```
2. Выбрать как запускать скрипт: из консоли или из ноутбука
2.1 Для ноутбука в браузере написать localhost:8888
