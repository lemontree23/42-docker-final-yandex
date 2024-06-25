
Запускаем из директории где лежит tracker.db

```shell
docker build -t $TAG .
docker run --rm -v ./tracker.db:/app/tracker.db $TAG
```
