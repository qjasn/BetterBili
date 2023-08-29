# BetterBili

一个使用flutter的第三方BiliBili客户端

## 说明

1.开发缘由：
- B站的客户端实在是太臃肿了，各种功能往里面砸，一会加一个短视频，一会又加一个AI，不是说这些功能不好，而是这些功能对于我来讲实在是降低我的使用体验，拜托诶，你是靠长视频起家的，你加个短视频还放到那么显眼的位置，是不是有点过分了
- B站的自定义程度太低了，你甚至不能选择屏蔽某一个标签的视频，而B站的主题多半是需要钱的
- B站的广告太太太太多了，平均每推荐一次视频就有一个广告或者推广视频

2.开发目标
- 实现标签屏蔽视频
- 实现通过UP主页内容屏蔽UP主
- 通过使用AI屏蔽评论区内容
- 使用单独的黑名单解除B站黑名单上限
- 全平台支持，完成B站官方客户端80%的功能，剩下20%为短视频之类的功能
- 可以编写插件，下载视频等

3.目前进度与开发计划
- [x] 界面初步完成
- [x] 二维码登陆（毫无用处，只是获取了Cookie）
- [ ] 国际化与界面进一步完善
- [ ] 查看个人信息
- [ ] 获取收藏，历史记录
- [ ] 其它方式登陆（密码与验证码登陆）
- [ ] 获取视频推送
- [ ] 获取不同分区内容
- [ ] 获取专栏与专栏详细信息
- [ ] 对专栏进行操作，查看专栏评论区
- [ ] 无障碍
- [ ] 对视频进行操作，获取视频详细信息
- [ ] 获取视频评论区
- [ ] 播放视频
- [ ] 播放番剧
- [ ] 播放课程视频
- [ ] 播放直播
- [ ] 进行直播操作，例如发弹幕等
- [ ] 插件功能
- 先这么多吧

4.注意事项
- 本项目只添加了macOS的网络权限请求，iOS调试与Android可能会出现无网络权限的问题，会在未来更改权限申请文件

5.调试说明（是否能够编译未知）
### macOS
- 拉取项目
``` Bash
git clone https://github.com/qjasn/betterbili.git
```
- 安装相关依赖（默认已安装brew,flutter与Xcode）
``` Bash
# macOS
brew install ruby@3.0 cocoapods
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```
- 进入项目目录并进行调试
``` Bash
cd betterbili
flutter run
```
### Windows
- 暂无
### Linux
- 暂无


6.鸣谢（总之涉及到的东西都写下来就对了）
- Flutter项目
- Bilibili项目
- Github托管平台
- cocoapods项目
- Jetbarins inc.
- Apple inc.
- Google inc.

7.贡献名单
- 就我一个开发者，真令人伤心，当然如果你愿意贡献，就不伤心了（bushi）

8.捐赠支持
- 怎么可能会有这种东西啊，至少也得项目基本完成后才可能有吧（

9.其它
- 由于相关条例，此项目不会在中国大陆的任何网站发布可执行文件，请注意甄别
- 本项目仅供学习参考，请遵守B站相关条例，禁止用做商业用途