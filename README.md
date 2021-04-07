# docker-sbt

パスの通ったディレクトリに `sbt.bat` というファイル名で保存する.
```
@echo off
docker run --rm -it -v sbt_cache:/sbt_cache -v %cd%:/work dockersbt:latest %*
```