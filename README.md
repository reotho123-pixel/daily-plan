# 每日计划总表

英语打卡 · 健身计划（练背 + 腹肌，在家无器械）· 总打卡日历 + 戒撸打卡，三列布局的个人打卡应用。

- **纯离线**：做成 PWA，手机「添加到主屏幕」后，没有网络也能打开使用（GitHub Pages 是公网地址，手机流量也能访问，不受 WiFi 限制）。
- **数据在本机**：所有打卡记录保存在设备浏览器的 localStorage 里，不上传服务器；换设备前用页面底部的「导出数据 / 导入数据」迁移。

## 文件说明

| 文件 | 作用 |
|---|---|
| `index.html` | 应用本体（样式、逻辑全部内置，无外部依赖） |
| `manifest.json` | PWA 应用信息（名称、图标、独立窗口模式） |
| `sw.js` | Service Worker，负责离线缓存 |
| `icons/` | 应用图标（192 / 512 / iOS 180） |
| `.nojekyll` | 让 GitHub Pages 原样托管文件，跳过 Jekyll 处理 |

## 部署到 GitHub Pages（网页上传，无需装任何软件）

1. 登录 GitHub（账号 `reotho123-Pixel`），右上角 **＋ → New repository**。
2. 仓库名填 `daily-plan`（也可自取），选择 **Public**，点 **Create repository**。
3. 在新仓库页面点 **uploading an existing file**（或 Add file → Upload files）。
4. 把本文件夹里的 `index.html`、`manifest.json`、`sw.js`、`.nojekyll` 和 `icons` 文件夹**一起拖进去**（保持目录结构），点 **Commit changes**。
5. 进入 **Settings → Pages**，在 **Build and deployment** 下：
   - Source 选 **Deploy from a branch**；
   - Branch 选 **main**、目录 **/ (root)**，点 **Save**。
6. 等一两分钟，页面顶部会出现网址：
   **https://reotho123-pixel.github.io/daily-plan/**

## 手机安装成 App（可离线）

1. 用手机浏览器（推荐 Chrome / Edge / Safari）打开上面的网址。
2. **安卓**：菜单 → 「添加到主屏幕」或「安装应用」。
   **iPhone**：Safari 底部分享按钮 → 「添加到主屏幕」。
3. 从主屏幕图标打开即为全屏应用。**第一次打开需要联网加载一次**，之后完全离线可用。

## 日常更新

改了应用内容后：重新上传文件，并把 `sw.js` 顶部的 `daily-plan-v1` 改成 `v2`（依次递增），已安装的用户下次联网打开即自动更新。

## 常见问题

- **换手机数据怎么办？** 先在旧设备点「导出数据」得到 JSON 文件，传到新设备后点「导入数据」。
- **能多设备同步吗？** 不能，静态页面没有服务器。多设备意味着各自记各自的，请以一台设备为主。
- **误清空了？** 有导出的 JSON 就能完整恢复。
