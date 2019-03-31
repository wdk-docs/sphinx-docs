# sphinx-doc 中文翻译文档

[![Documentation Status](https://readthedocs.org/projects/sphinx-doc/badge/?version=master)](https://sphinx-doc.readthedocs.io/zh_CN/master/?badge=master)

> 采用 sphinx 的多语言翻译机制生成 po 翻译 po 文件

## live 服务

使用[sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild)做在线服务器。

```sh
!pip install sphinx-autobuild
sphinx-autobuild ./ _build/html
```

## 部署 gh-pages

1. 生成静态文件

   ```sh
   cd doc
   sphinx-build -b html ./ ../docs
   cd ../docs
   touch .nojekyll
   ```

2. 打开`respository-`>`Setting`, 在 `GitHub Pages` -> `Source` 选项里选择 `master branch/docs folder`
