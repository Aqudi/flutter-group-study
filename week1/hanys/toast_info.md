# flutter_styled_toast
사용자에게 정보를 보여주기 위해 잠깐 띄우는 토스트 메세지가 구현된 패키지 ([공식문서](https://pub.dev/packages/flutter_styled_toast))

##  StyledToast param
|       property        |                                                       description                                                       |
|:---------------------:|:-----------------------------------------------------------------------------------------------------------------------:|
|         locale        |                        Locale (Not Null)(required You have to set this parameters to your locale)                       |
|         child         |                                               Widget (Not Null)(required)                                               |
|       textAlign       |                                           TextAlign (default TextAlign.center)                                          |
|     textDirection     |                                        TextDirection (default TextDirection.ltr)                                        |
|      borderRadius     |                                        BorderRadius (BorderRadius.circular(5.0))                                        |
|    backgroundColor    |                                            Color (default Color(0x99000000))                                            |
|      textPadding      |                    EdgeInsetsGeometry (default EdgeInsets.symmetric(horizontal: 17.0,vertical: 8.0))                    |
| toastHorizontalMargin |                                                  double (default 50.0)                                                  |
|       textStyle       |             TextStyle (default TextStyle(fontSize: 16.0,fontWeight: FontWeight.normal,color: Colors.white))             |
|      shapeBorder      |                         ShapeBorder (default RoundedRectangleBorder(borderRadius: borderRadius))                        |
|        duration       |             Duration (default 2.3s)(When set [duration] to Duration.zero, toast won't dismiss automatically)            |
|      animDuration     | Duration (default 400 milliseconds, animDuration * 2 <= duration, conditions must be met for toast to display properly) |
|     toastPositions    |                                 StyledToastPosition (default StyledToastPosition.bottom)                                |
|     toastAnimation    |                                 StyledToastAnimation (default StyledToastAnimation.fade)                                |
|    reverseAnimation   |                                                   StyledToastAnimation                                                  |
|       alignment       |                                       AlignmentGeometry (default Alignment.center)                                      |
|          axis         |                                               Axis (default Axis.vertical)                                              |
|      startOffset      |                                                          Offset                                                         |
|       endOffset       |                                                          Offset                                                         |
|   reverseStartOffset  |                                                          Offset                                                         |
|    reverseEndOffset   |                                                          Offset                                                         |
|         curve         |                                              Curve (default Curves.linear)                                              |
|      reverseCurve     |                                              Curve (default Curves.linear)                                              |
|   dismissOtherOnShow  |                                                   bool (default true)                                                   |
|       onDismiss       |                                        VoidCallback (Invoked when toast dismiss)                                        |
|       fullWidth       |          bool (default false)(Full width parameter that the width of the screen minus the width of the margin.)         |
|     isHideKeyboard    |                                  bool (default false)(Is hide keyboard when toast show)                                 |
|    animationBuilder   |                               CustomAnimationBuilder (Builder method for custom animation)                              |
|   reverseAnimBuilder  |                           CustomAnimationBuilder (Builder method for custom reverse animation)                          |
|       isIgnoring      |                                                   bool (default true)                                                   |
|      onInitState      |                    OnInitStateCallback (When toast widget [initState], this callback will be called)                    |

## PMI
P: 일상생활에서 자주 보던 메세지 정체가 Toast Message라는 것을 알게되어 좋았다.

M: 새로운 패키지를 어떻게 공부해야하고, 어떻게 정리해야 다른 사람들에게 좋은 자료가 되는지 잘 모르겠어서 너무 어렵다.

I: 내가 직접 구현하면 엄청 어려울만한게 이미 구현되어 있다는게 너무 감동이다.