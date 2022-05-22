## 介绍

clashx for [pgfast](http://pgfastss.net/)

## component

* [clashx](https://github.com/Dreamacro/clash)
* [subconverter](https://github.com/tindy2013/subconverter)
* [s6 overlay](https://github.com/just-containers/s6-overlay)
* [gotpl](https://github.com/wodby/gotpl)

## docker-compose.yml example

```yaml
version: "3"
services:
  clashx-for-pgfast:
    image: zterry95/clashx-for-pgfast
    container_name: clashx-for-pgfast
    environment:
      - PGFAST_SUB_URL=http://0.0.0.0/sub_v2ray.php?i=xxx&t=xxxx
    ports:
      - "7890:7890"
      - "7891:7891"
      - "9090:9090"
    restart: "always" 
    logging:
      driver: "json-file"
      options:
        max-size: "100m"
        max-file: "1"
```
