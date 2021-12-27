# 배운 내용 복습 및 정리

## 목차

- dart 언어란?
- flutter 프로젝트 개요
- Material design 이란?
- Scaffold 이란?
- flutter에서 지원하는 Widget들
- Stateless vs Stateful

---

## dart 언어

### dart 언어 특징

1. 구글에서 cross platform OS(Fuchsia)를 위해 태어남
2. compile 언어임
3. static type checking 과 type inference 기능이 있음
4. runtime type도 지원됨
5. 객체지향(OOP) 언어임
6. null safety를 지원함

### dart null 관련 문법

```dart
String? title; // title 변수는 String일 수도 null 일 수도 있음
print(title?.isEmpty());  // title 변수가 null이라면 isEmpty 실행하지 않고 null print
                          // null이 아니라면 isEmpty 실행하고 true print
print(title ?? 'Unknown');  // title이 null이 아니라면 title에 들어있는 값 print
                            // null이라면 Unknown print
```

---

## flutter 프로젝트 소개

flutter 프로젝트를 생성하면 아래와 같이 폴더 및 파일이 생성됨

<img srd="/week1/leejh_week1/images/flutter_directory.png" width=150 height=300>

소스코드가 저장되는 폴더는 lib 폴더  
run을 눌렀을 때 가장 먼저 수행되야하는 코드는 아래와 같음

```dart
void main() => runApp(const App());
```

---

## Material design vs Cupertino design

| Material                                        | Cupertino                                                                |
| ----------------------------------------------- | ------------------------------------------------------------------------ |
| [안드로이드 디자인](https://material.io/design) | [애플 디자인](https://docs.flutter.dev/development/ui/widgets/cupertino) |
| `import 'package:flutter/material.dart'; `      | `import 'package:flutter/cupertino.dart';`                               |

MaterialApp Widget에서 모든 것이 시작된다.

---

## Scaffold란?

화면에 그려지는 페이지의 토대를 마련해주는 Widget

<img src="/week1/leejh_week1/images/scaffold.png" width="300" height="450">

---

## Week1에 배운 Widget들

- Center Widget

  > 레이아웃을 위한 위젯으로 Center Widget으로 감싸진 자식 Widget을 가운데에 배치시켜줌

- SizedBox

  > Container Widget과 같이 크기를 지정해줄 수 있는 Widget들이 있는 반면 Center, Row, Column Widget들과 같이 크기를 지정해줄 수 없는 Widget들의 크기를 지정할 수 있게 해주는 Widget

- Column

  > 주축이 열(세로)이 되는 Widget으로 일반적으로 자식 Widget들의 크기에 따라 자신도 결정됨.  
  > mainAxis = 세로 / crossAxis = 가로

- Row

  > 주축이 행(가로)이 되는 Widget으로 그 이외의 것은 Column과 동일  
  > mainAixs = 가로 / corssAxis = 세로

- Padding

  > 여백을 만들어주는 Widget으로 EdgeInsets 클래스를 이용해 padding 값을 결정해줌  
  > Margin과 Padding은 여백을 만들어준다는건 동일하지만 방향이 다름

- Expanded

  > 자식 Widget의 크기를 최대한으로 확장시켜주는 Widget  
  > **❗조심해야될 구조**
  >
  > - Column의 children으로 Expanded로 감싸진 Column을 넣으면 세로로 무한정 늘어나버려서 _Rendering laid out_ 에러가 발생함
  > - 더 써보면서 추가적인 에러는 작성하겠음

- SingleChildScrollView

  > 스크롤을 할 수 있게 만들어주는 Widget  
  > 한 화면안에 Widget들이 나타낼 수 없는 경우 이 Widget을 사용하면 됨  
  > scrollDirection property를 변경해 수평으로도 스크롤을 할 수 있게 만들어 줄 수 있음

- Switch

  > 스위치를 만들어주는 Widget  
  > onChanged에 원하는 기능을 할 수 있게 함수를 작성해줄 수 있음

- Text

  > CLI에서의 print를 대신하는 것이라 생각하면 됨

- ElevatedButton & TextButton

  > 눌렀을 때 Event가 발생하게 해주는 버튼임  
  > Switch는 onChanged로 원하는 Event를 설정해주었다면 Button들은 onPressed로 Event 설정을 할 수 있음

- Navigator

  > 라우트 간의 이동을 가능하게 하는 Widget임  
  > 라우트는 새로운 탭 혹은 페이지로 생각하면 됨

  ```dart
  // style 1
  Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => const MenuPage(),
                  ),
                );

  // style 2
  Navigator.pushNamed(context, '/menuRoute');   // 이 방법을 사용할려면 MaterialApp에서 routes property를 작성해줘야한다.

  // style 3  [style 1과 다른 점은 stack에 현재 라우트를 push하지 않음]
  Navigator.pushReplacement(context,
                MaterialPageRoute(
                    builder: (context) => const MenuPage(),
                  ),
                );
  ```

## StatelessWidget vs StatefulWidget

### StatelessWidget

> build 메서드가 처음 실행될 때 한번만 수행되어 rebuild가 일어나지 않는 Widget

### StatefulWidget

> setState가 trigger처럼 setState로 상태 변화를 알리면 build 메서드가 처음 실행될 때 이후로 또 다시 rebuild 되어 화면의 상태가 변화할 수 있게 해주는 Widget  
> StatefulWidget의 경우 StatefulWidget을 상속받은 클래스 하나와 State를 상속받은 클래스하나가 더 생성된다.  
> 추가로 build 메서드는 State를 상속받은 클래스 안에 있다.
