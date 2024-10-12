import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jh_debug/mainFn.dart';
import 'package:polaris_tower/pages/app_main/app_main.dart';
import '../../routes/route_name.dart';
import 'components/basic_btn/basic_btn.dart';
import 'components/custom_checkbox/custom_checkbox.dart';
import 'components/custom_input/custom_input.dart';
import '../../models/login.m.dart';
import '../../utils/tool/user_util.dart';
import '../../utils/tool/tips_util.dart';
import '../../utils/index.dart';
import '../../services/login_service.dart' as wvp;
import 'package:bruno/bruno.dart';

class Login extends StatefulWidget {
  const Login({Key? key, this.params}) : super(key: key);
  final dynamic params;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode blankNode = FocusNode(); // 响应空白处的焦点的Node
  final double baseTextSize = 32.sp; // 输入框文字
  final double _slaSize = 26.sp; // 协议文字大小
  Color desTextColor = const Color(0xFFB4B9C6);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  Color btnDisableColor = const Color(0xffAFD1FC); // 禁用按钮颜色
  bool isSelected = false; // 协议勾选

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    FocusScope.of(context).requestFocus(blankNode);
    super.dispose();
  }

  Future<void> initData() async {
    LoginData userInfo = await UserUtil.getUserInfo();
    if (userInfo.username?.isNotEmpty ?? false) {
      _usernameController.text = userInfo.username!;
    }
  }

  bool checkInput() {
      return _passwordController.text.isNotEmpty && _usernameController.text.isNotEmpty;
  }

  // 登入按钮
  login() async {
    // if (!checkInput()) return;
    // FocusScope.of(context).requestFocus(blankNode);
    // if (!isSelected) return Tips.info('请确认已阅读用户协议和隐私协议');
    //
    // String pwText = _passwordController.text;
    // if (pwText.isEmpty || pwText.length < 6) return Tips.info('请输入正确的密码');

    LoginResp res = await wvp.login();
    if(res.data?.accessToken != null) {
      BrnToast.show(
        "登录成功",
        context,
        duration: BrnDuration.short,
      );
      // TODO: 登入请求逻辑
      LoginData userData = LoginData(
        username: _usernameController.text,
        password: _passwordController.text,
        accessToken: res.data?.accessToken,
      );
      await UserUtil.saveUserInfo(userData);
      // 成功后，回退上一页
      if (context.mounted) {
        Future.delayed(const Duration(milliseconds: 2000), () {//2秒
          Navigator.pushNamed(context, RouteName.appMain);
        });
      }
    } else {
        BrnToast.show(
        "登录失败",
        context,
        duration: BrnDuration.short,
      );
    }
    // Navigator.pushNamed(context, RouteName.appMain);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          FocusScope.of(context).requestFocus(blankNode);
        },
        child: loginLayout(),
      ),
    );
  }

  Widget loginLayout() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 48.w),
      child: ListView(
        children: [
          navWidget(),
          CustomInput(
            margin: EdgeInsets.only(bottom: 23.w),
            controller: _usernameController,
            autofocus: true,
            hintText: '点击输入用户名',
            inputType: InputType.normal,
            keyboardType: TextInputType.text,
          ),
          CustomInput(
            controller: _passwordController,
            hintText: '点击输入密码',
            inputType: InputType.normal,
            keyboardType: TextInputType.text,
          ),
          bottomBtn(),
          slaText(),
        ],
      ),
    );
  }

  // 头部标题
  Widget navWidget() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 128.w),
      child: Column(
        children: [
          Text(
            '登录页面',
            style: TextStyle(fontSize: 64.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            '未注册手机验证后快速登录',
            style: TextStyle(fontSize: 28.sp, color: desTextColor),
          ),
        ],
      ),
    );
  }

  // 底部组件
  Widget bottomBtn() {
    return Container(
      margin: EdgeInsets.only(top: 64.w, bottom: 46.w),
      child: BasicBtn(
        title: '登录 / 注册',
        color: isSelected ? null : btnDisableColor, // 背景
        onPressed: login,
      ),
    );
  }

  // 协议文字
  Widget slaText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: CustomCheckbox(
            value: isSelected,
            onChanged: (value) {
              setState(() {
                isSelected = !value;
              });
            },
            radius: 22,
            size: _slaSize,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              color: const Color(0xFFB4B9C6),
              fontSize: _slaSize,
            ),
            text: '已阅读并接受',
            children: [
              WidgetSpan(
                child: Text(
                  '《用户协议》',
                  style: TextStyle(fontSize: _slaSize),
                ),
              ),
              const TextSpan(text: '和'),
              WidgetSpan(
                child: Text(
                  '《隐私政策》',
                  style: TextStyle(fontSize: _slaSize),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
