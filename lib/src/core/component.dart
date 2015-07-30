part of squares;

abstract class Component {

  /**
   * props of component
   */
  dynamic props = {};

  Map state = {};

  List<ComponentDescription> children = [];

  /**
   * private _nextState and _prevState are usefull for methods shouldComponentUpdate,
   * componentWillUpdate and componentDidUpdate.
   *
   * Use of theese private variables is implemented in react_client or react_server
   */
  Map _prevState = null;
  Map _nextState = null;
  /**
   * nextState and prevState are just getters for previous private variables _prevState
   * and _nextState
   *
   * if _nextState is null, then next state will be same as actual state,
   * so return state as nextState
   */
  Map get prevState => _prevState;
  Map get nextState => _nextState == null ? state : _nextState;

  /**
   * stream controller used to signalize to node,
   * when component need to be udpated
   */
  final StreamController _needUpdateController;

  /**
   * Offer stream which will create event everytime, when it need to be updated (rendered).
   *
   * Stream use boolean data, which tells, if update should be done immediately
   */
  Stream<bool> get needUpdate => _needUpdateController.stream;

  /**
   * constructor, it create component with setted stream controller.
   *
   * If stream was not passed, it will create own stream controller
   */
  Component.withParams(this.props, [this.children]):
    this._needUpdateController = new StreamController<bool>() {}

  Component(): this._needUpdateController = new StreamController<bool>() {}


//  Component():
//    this._needUpdateController = new StreamController<bool>() {}

  void willMount() {}

  void didMount([rootNode]) {}

  void willReceiveProps([newProps]) {}

  bool shouldUpdate([nextProps, nextState]) => true;

  void willUpdate([nextProps, nextState]) {}

  void didUpdate([prevProps, prevState, rootNode]) {}

  void willUnmount() {}

  Map getDefaultProps() => {};

  Map getInitialState() => {};

  List<ComponentDescription> render() => null;

  void setState(Map newState) {
    if (newState != null) {
      if (_nextState == null) {
        _nextState = {};
      }
      _nextState.addAll(newState);
    }

    redraw(true);

    //render();
  }

  /**
   * redraw will add event to stream
   */
  redraw([bool now = false]) {
    _needUpdateController.add(now);
  }


}

