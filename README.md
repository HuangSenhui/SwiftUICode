#  SwiftUI 构建应用

## 1. Layout and Stacks

1. 布局
2. 动画
3. SF symbols、View之间的切换动画（旋转、3D）、手势
4. Binding、ScrollView、3D转换动画（GeometryReader）
5. NavigationView、 Combine、Edit Data、TabBar
6. 环形进度条、自定义`Modifier`、使用自定义字体
7. 首页转场交互动画、传值、手势
8. API、JSON、Combine、Web Image
9. Blur、Dark Model、Accessible

使用contentful 加载网络数据
https://github.com/contentful/contentful.swift.git

1. 创建 xxStore: `ObservableObject`
    定义 `@Published  var datas = [Model]()`
2. 创建数据操作方法（fetch、update、delete）
3. 在使用界面 定义 `@ObservedObject var store`

SDWebImageSwiftUI


Dark Model
1. 颜色中添加 Dark 模式
