
## ScreenLock

屏幕锁效果，其实现机理是利用Calayer和手势识别进行密码录入。大致可以分为三个步骤：

1. 用Calayer绘制底层图案。
2. 根据手势运动轨迹绘制高亮部分及轨迹线。
3. 控制可选区域防止重复选择重复绘制。

效果如下图：

![images](http://7xpcyy.com1.z0.glb.clouddn.com/screenLock.gif) 