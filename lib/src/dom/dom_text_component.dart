part of squares;

/**
 * DomTextComponent represents text node in DOM. If there is string passed in children,
 * it will be "packed" into DomTextComponent in synthetic DOM.
 */
class DomTextComponent extends Component {

  DomTextComponent(String props): super.withParams(props, null);

  /**
   * getter for escaped props to easy use for both,
   * browser and server side rendering
   */
}

ComponentDescriptionFactory _domTextComponentDescriptionFactory =
  registerComponent(({String props, children}) => new DomTextComponent(props));
