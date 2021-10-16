import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //应用入口
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // 此小部件是应用程序的根。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: '热爱学习'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 构建UI界面
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    /**
     * 构建UI界面的逻辑在 build 方法中，当MyHomePage第一次创建时，_MyHomePageState类会被创建，当初始化完成后，
     * Flutter框架会调用 widget 的build方法来构建 widget 树，最终将 widget 树渲染到设备屏幕上。
     * */
    return Scaffold(  //Scaffold是Material库中提供的页面脚手架
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(//body的组件树中包含了一个Center组件，Center可以将其子组件树对齐到屏幕中心。
        child: Column( //此例中，Center子组件是一个Column组件/Column的作用是将其所有子组件沿屏幕垂直方向依次排列
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network('https://pics7.baidu.com/feed/9a504fc2d56285359880aa86e7ca30cfa6ef63e7.jpeg?token=19b21c9cc419df9d235a4f4f912f9de1'),
            const Text('资料图：考生走出国考考场。中新社记者 王中举 摄'),
            /**  3.5 输入框及表单
             * Material 组件库中提供了输入框组件TextField和表单组件Form
             * */
            const TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)
              ),
              keyboardType: TextInputType.text,
              maxLength: 11, //限制输入
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登陆密码",
                prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
            ),
          /** 3.5.2 表单Form
           *  实际业务中，在正式向服务器提交数据前，都会对各个输入框数据进行合法性校验，但是对每一个TextField都分别进行校验将会是一件很麻烦的事。
           *  还有，如果用户想清除一组TextField的内容，除了一个一个清除有没有什么更好的办法呢？
           *  为此，Flutter提供了一个Form 组件，它可以对输入框进行分组，然后进行一些统一操作，如输入内容校验、输入框重置以及输入内容保存。
           * */

            /** 3.6 进度指示器
             *Material 组件库中提供了两种进度指示器：LinearProgressIndicator和CircularProgressIndicator，它们都可以同时用于精确的进度指示和模糊的进度指示
             *精确进度通常用于任务进度可以计算和预估的情况，比如文件下载；而模糊进度则用户任务进度无法准确获得的情况，如下拉刷新，数据提交等。
             * value：value表示当前的进度，取值范围为[0,1]
             * 如果value为null时则指示器会执行一个循环动画（模糊进度）
             * 当value不为null时，指示器为一个具体进度的进度条
             * valueColor: 指示器的进度条颜色
             * strokeWidth 表示圆形进度条的粗细
             *
             * */
           // 模糊进度条(会执行一个动画)
           const LinearProgressIndicator( //蓝色条一直在移动
             backgroundColor: Colors.grey,  //指示器的背景色
             valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          //  进度条显示50%
           const LinearProgressIndicator( //进度条是静止的
             backgroundColor: Colors.grey,
             valueColor: AlwaysStoppedAnimation(Colors.red),
             value: .5,
            ),
          //  CircularProgressIndicator  是一个圆形进度条
          //  模糊进度条(会执行一个旋转动画)
           const CircularProgressIndicator(
             backgroundColor: Colors.grey,
             valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          //  进度条显示50%，会显示一个半圆
           const CircularProgressIndicator(
             backgroundColor: Colors.grey,
             valueColor: AlwaysStoppedAnimation(Colors.amberAccent),
             value: .5,
            ),
           //线性进度条高度指定为3
           const SizedBox(
              height: 3,
             child: LinearProgressIndicator(
               backgroundColor: Colors.grey,
               valueColor: AlwaysStoppedAnimation(Colors.blue),
               value: .5,
             ),
            ),
           // 圆形进度条直径指定为100
            const SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
                valueColor: AlwaysStoppedAnimation(Colors.red),
                value: .7,
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
