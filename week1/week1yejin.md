# Week1

## main.dart

```dart
void main() {
  runApp(const ProviderScope(child: MyApp()));
}
```

- runApp함수  flutter에서 **최상위 함수**라고 한다. 이 함수에는 MyApp()이 들어간다.

## app.dart

```dart
import 'package:flutter/material.dart';
import 'package:newtalk/pages/chatting/chatting_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChattingPage(),
    );
  }
}
```

- flutter가 제공하는 build in widget인 **MaterialApp**은 Material 디자인을 할 수 있도록 한다.
- home은 맨 처음에 보일 페이지를 나타냄

## Scaffold

[Scaffold class - material library - Dart API](https://api.flutter.dev/flutter/material/Scaffold-class.html)

> Implements the basic material design visual layout structure.
> 

번역하면 **‘발판’**이라는 뜻이다. 토대가 된다는 의미인듯

파라미터는 이렇게 있다.

```dart
class Scaffold extends StatefulWidget {
  const Scaffold({
    Key key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
```

대충 디자인에 대해 제공해주는 폼인 것 같다.

## Stateless VS Stateful

- Stateless: 상태가 없다. 사용자의 동작과 상호작용이 필요없는 위젯을 사용할 때 사용 Container, Row, Column, Icon, Text같은 것들이 있다.
- Stateful: 상태가 있다. 상태를 가질 수 있는 위젯을 사용하기 위해 사용 CheckBox, Slider같은 위젯이 있다. 아마 전에 쓴 switch도 stateful아닐까?

왜 나눔? Stateless가 당연히 더 빠르다. 효율적으로 잘 사용할 것.

## Layout

1. child인 widget
    1. Center
        
        widget을 가운데로 정렬한다.
        
    2. Padding 
        
        child widget에 Padding(컨텐츠 안쪽 영역 여백)을 가지도록 한다.
        
    3. Container
    4. SizedBox
    
    <aside>
    💡 SizedBox와 Container는 둘이 하는 일은 비슷하다. 하지만 Container는 너비와 높이를 넣지 않으면 **최대크기**로 확장하고, SizedBox는 너비와 높이 중 하나라도 설정하지 않으면 크기가 child에 맞추어 진다.
    
    </aside>
    
2. Children인 widget
    1. Row 
        
        수평으로 자식들을 배치한다. 높이는 자식들의 높이들 중에서 가장 긴 걸로
        
    2. Column
        
        수직으로 자식들을 배치. 너비는 자식들의 너비들 중에서 가장 넓은 걸로 
        

## Button

![Untitled](Week1%2026725bee2cc04a1c979721abd2a967c1/Untitled.png)

1. TextBotton
    
    말 그대로 글자만 있는 버튼
    
2. ElevatedButton
    
    깊이감(?)을 주기 위해 사용하는 버튼
    

## 경우를 나누어 함수를 선택하게 하기

### 3항 연산자

```dart
변수 ? 참 : 거짓
switchValue ? _build4ColorContainers() : _build4ColorContainers2(),
```

### 조건부 리스트 아이템

```dart
if (!switchValue) _build4ColorContainers(),
if (switchValue) _build4ColorContainers2(),
```

### IIFE(**즉시 실행 함수 표현)**

함수를 바로 작동하게 한다.

1. late Widget쓰기
2. Widget widget = 바로 초기화 하기
3. if else쓰기 

```dart
late Widget widget;
if (switchValue) {
  widget = _build4ColorContainers();
}
if (!switchValue) {
  widget = _build4ColorContainers2();
}
return widget;
```

## 스크롤

### SingleChildScrollView

**스크롤** 기능을 달아 준다.

주로 children인 column과 같은 것에 적합하고, 이것을 사용하기 위해서는 column의 높이 사이즈를 정확히 알아야 한다고 한다. 그래서 Expand에 감싼 column을 사용하면 에러가 뜬다. 그런 경우에는 container로 감싸서 높이를 지정해 준다.

## Expand

Row,Column,Flex의 자식으로 사용 가능 하고, 부모의 남은 부분은 전부 채우는 식으로 화면에 나타난다고 한다. 

여러 개면 1/n크기를 가지고, 비율을 나누고 싶다면 flex로 값을 조절해 주면 조정 가능하다.

## switch

```dart
Material(
            child: Switch(
              value: switchValue,
              onChanged: (value) {
                switchValue = value;
                print(switchValue);
                setState(() {});
              },
            ),
            ),
```

value: 상태를 나타내는 boolean type 변수

onChanged: 값이 변할 때마다 발생, 여기서 변경된 값이 value로 넘어옴

setState()함수를 통해 value에 저장된 변수를 변경해서 나타냄

## Routing

### Navigator

앱 화면 간 이동을 구현할 때 사용

```dart
Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 50),
              child: ElevatedButton(
                onPressed: () {**Navigator.push**( // 페이지 이동하는 방법
                    context,
                    **MaterialPageRoute**(
                      builder: (context) => const FriendPage(),
                    ));
                  },
                child: const Text('friends'),
              ),
            ),
```

- **stack**개념이다.
- 만약에 1번, 2번, 3번과 같은 화면이 존재하고 1번 → 2번 → 3번 순으로 이동했다면 3번 → 2번 → 1번 화면으로 나와야 한다는 말
- 스택이랑 비슷하다고 했으니 역시나 push와 pop을 사용한다.
- push가 들어간 경우에는 MaterialPageRoute함수를 사용해서 이동하고 싶은 화면으로 이동한다.
- ios스럽게 하고 싶다면 CupertinoPageRoute을 사용

<aside>
💡 간단하게 정리하면 Material은 Android, Cupertino는 ios스러운 거인듯.

</aside>

## 기타

- babo(){} 이런 것들 보고 헷갈릴 때 있는데 그냥 `babo() == null`이라는 의미임. 함수에 매개변수도 없고 암것도 없다고.