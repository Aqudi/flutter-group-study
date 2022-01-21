# State Mangement

- state가 뭐야?
- BLoC 패턴이란?
- StreamBuilder
- Provider
- RiverPod

## State

여기서 상태(State)는 1)**위젯이 빌드되는 동시에 읽을 수 있고,** 2)**위젯의 생명 주기동안 변경할 수 있는** 정보를 말한다. 보통 사용자와 어플의 상호작용으로 인해 변화하는 데이터들이 여기에 해당한다.

## BLoC 패턴이란?

Bussiness Logic Component의 줄임말이다.

Flutter에서는 상태에 따라서 렌더링이 수행되기 때문에, 상태 관리가 매우 중요하다. (상태 관리가 잘 이루어지지 못한다면 성능 저하를 일으킬 뿐 아니라 스파케티 코드가 될 가능성이 매우 높음)

따라서 보다 편리하게 상태를 관리해주기 위해 UI와 Bussiness Logic을 분리하여 상태에 대한 관리(로직)는 Bussiness Logic에서만 이루어지고 화면 디자인은 UI에서만 이루어지게 디자인 해주는 것이 BLoC 패턴이라고 할 수 있다.

![Untitled](State%20Mangement%20847a18473964440f9b594952711232e3/Untitled.png)

![Untitled](State%20Mangement%20847a18473964440f9b594952711232e3/Untitled%201.png)

좀 더 딥한 BLoC Pattern을 위한 추천 [사이트](https://velog.io/@seunghwanly/Flutter-BLoC-Pattern-2)

## Stream

Flutter의 Widget은 Tree로 구성되어있다. 이 말은 곧 하위(자식) 위젯에서 상위 위젯 혹은 다른 노드 위젯의 상태(데이터)를 받아오거나 넘겨줄 때 코드가 더러워질 수 있다. (왜냐하면 각 노드 위젯마다 getter / setter 메서드를 만들어서 받고 넘기고를 수행해야하기 때문에) 이를 해결할 수 있는 방법이 Stream이다.

Stream이란?

Stream은 데이터나 이벤트가 들어오는 통로이다. 앱을 만들다보면 데이터를 처리할 일이 많은데, 어느 타이밍에 데이터가 들어올지 정확히 알기 어렵다. 이때 Stream을 이용하면 Future와 같이 이벤트와 데이터 처리를 위한 비동기 작업을 가능하게 해준다.

결론적으로 Stream의 주요 컨셉은 데이터 생성을 하는 곳과 생성된 데이터를 소비하는 곳을 따로 따로 관리해주기 위한 것이다.

여기서 데이터를 소비하는 곳을 구독자 혹은 Listener라 부른다. (Stream은 일반적으로 Single Subscription 방식임)

Stream을 이용해서 BLoC 패턴을 만들어 줄 수 있다.

*하지만 provider를 이용하지 않고 쌩으로 StreamController를 이용하는 코드는 개인적으로 코드 자체가 너무 안와닿고 어려움*

Stream 설명을 위한 추천 [사이트1](https://nomad-programmer.tistory.com/268) / [사이트2](https://dart.academy/streams-and-sinks-in-dart-and-flutter/)

## 잡지식

알아두면 유용한 개념

둘다 StatefulWidget에서 사용이 가능하다

| initState | didChangeDependencies |
| --- | --- |
| context를 사용 할 수 없음 | context를 사용 할 수 있음 |
| 인스턴스가 생성될 때 단 한번만 호출됨 | initState의 호출 후 바로 호출됨 + 상태의 의존성이 바뀔 때 호출됨 |
| context가 필요없는 property의 initialize를 위해 사용 | context가 필요한 property의 initialize를 위해 사용 (ex. Provider, MediaQuery ... ) |

## Provider

Flutter에서 좀 더 쉽게 상태 관리를 할 수 있게끔 만든 패키지이다.

패턴 자체는 위와 동일하지만 코드는 훨씬 직관적이다.

![Untitled](State%20Mangement%20847a18473964440f9b594952711232e3/Untitled%202.png)

Provider는 생성 부분과 소비 부분으로 나누어 생각해주면 된다. 

생성 부분에서는 어찌저찌 받아온 data model을 통해 우리가 제공해주고 싶은 service logic을 정의해주는 즉 Provider를 만드는 부분이다.

```dart
final searchServiceProvider = ChangeNotifierProvider((ref) => SearchService()); // Provider 생성

@immutable
class SearchKey {  // data model
  final String? key;

  const SearchKey(this.key);
}

class SearchService extends ChangeNotifier<SearchKey> {  // service logic을 정의한 class
  SearchKey? _key;

  SearchKey? get key => _key;

  void search(SearchKey? key) {
    _key = key!;
		notifyListeners();
  }
}
```

소비 부분은 만들어진 Provider를 통해 우리가 정의한 logic들을 사용하거나 가공된 data를 불러오는 등의 작업을 하는 부분이다.

- Provider 소비에 대한 부가 설명
    
    Provider를 소비한다는 말은 Provider의 데이터 값을 변경하거나 화면에 보여주는 것을 의미한다.
    

| context.read<T>() | context.watch<T>() |
| --- | --- |
| T의 데이터 값이 변경되었을 때 위젯을 rebuild 하지 않는다. | T의 데이터 값이 변경되었을 때 위젯을 rebuild 한다. |
| T의 데이터 값을 변경하는 등의 이벤트들을 위한 용도 | T의 데이터 값을 화면에 보여주는 용도 |
| ex) 어떤 이벤트가 발생했을 때 search 메서드를 이용하기 위해서는 read를 사용해야함 | ex) search 메서드를 통한 state 변화가 이루어지면 watch하고 있는 모든 위젯들이 해당 state에 맞게 rebuild가 이루어짐 |

## Riverpod

이것도 Provider 처럼 상태 관리 방법 중 하나다. Provider의 단점을 보완하고 보다 나은 퍼포먼스를 보여준다고 [Riverpod 공식 문서](https://riverpod.dev/)에 적혀 있다.

컨셉은 Provider와 다를게 없다. Provider를 생성해주고 소비해야되는 영역에서 소비해주면 된다.

dynamic을 믿다가는 null-safety 오류에 머리가 어지러워질 수 있음 

*dynamic보단 type 명시를 꼭 해주자*