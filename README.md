# jiang-miniprogram-ci

微信小程序代码提交后自动发布体验版的 `Github Action`，基于 `miniprogram-ci`

使用方式：

- 下载微信小程序的小程序代码上传密钥，并且关闭 `IP` 白名单

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/95619488f4c64860b2ac2720b7ba6045~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=1304&h=358&s=22093&e=png&b=ffffff)

- 在 `GitHub` 项目中的 `setting` 添加一个变量名 PRIVATE_KEY，写入上一步获取的小程序代码上传密钥

![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/af41b0ecf3f14e3f823766126481a342~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=1253&h=822&s=99090&e=png&b=ffffff)

- 需要添加的参数：
  - **projectPath**（必填）：项目路径，比如 `dist`、`uniapp` 项目一般是 `dist/build/mp-weixin`
  - **privatekey**（必填）：前面设置的 `PRIVATE_KEY`，如：${{ secrets.PRIVATE_KEY }}
  - **robot**：机器人编号，默认是 1
  - **desc**：本次提交的修改描述
  - **version**：本次提交的版本号

`.github/workflows/upload.yaml` 写入以下代码，触发时机可以自行调整

```
name: 上传小程序体验版
on:
  push:
    branches:
      - main
jobs:
  upload:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Install
        run: yarn
      - name: Build
        run: yarn build
      - name: Upload
        uses: upJiang/jiang-miniprogram-ci@main
        with:
          project-path: dist/build/mp-weixin
          private-key: ${{ secrets.PRIVATE_KEY }}
```
