part of utils;

initGlobal() {
  setupDefaultLogHandler();
  logger.level = Level.WARNING;
}

initTiles() {
  _USED = _TILES;
  initGlobal();
  squares.initTilesBrowserConfiguration();

  createVirtualDOM = (dynamic what, dynamic where) {
    tilesBenchmark.start(Benchmark.VIRTUALDOMBUILDING);
    tilesBenchmark.start(Benchmark.ALLRENDERED);
    squares.Node node = new squares.Node.fromDescription(null, what);
    node.update();
    tilesBenchmark.stop(Benchmark.VIRTUALDOMBUILDING);
  };

  mountComponent = (dynamic what, dynamic where) {
    tilesBenchmark.start(Benchmark.MOUNTING);
    tilesBenchmark.start(Benchmark.ALLRENDERED);
    squares.mountComponent(what, where);
    tilesBenchmark.stop(Benchmark.MOUNTING);
  };

  registerComponent = squares.registerComponent;

  benchmark = tilesBenchmark;

  a = squares.a;
  abbr = squares.abbr;
  address = squares.address;
  article = squares.article;
  aside = squares.aside;
  audio = squares.audio;
  b = squares.b;
  bdi = squares.bdi;
  bdo = squares.bdo;
  big = squares.big;
  blockquote = squares.blockquote;
  body = squares.body;
  button = squares.button;
  canvas = squares.canvas;
  caption = squares.caption;
  cite = squares.cite;
  code = squares.code;
  colgroup = squares.colgroup;
  data = squares.data;
  datalist = squares.datalist;
  dd = squares.dd;
  del = squares.del;
  details = squares.details;
  dfn = squares.dfn;
  div = squares.div;
  dl = squares.dl;
  dt = squares.dt;
  em = squares.em;
  fieldset = squares.fieldset;
  figcaption = squares.figcaption;
  figure = squares.figure;
  footer = squares.footer;
  form = squares.form;
  h1 = squares.h1;
  h2 = squares.h2;
  h3 = squares.h3;
  h4 = squares.h4;
  h5 = squares.h5;
  h6 = squares.h6;
  head = squares.head;
  header = squares.header;
  html = squares.html;
  i = squares.i;
  iframe = squares.iframe;
  ins = squares.ins;
  kbd = squares.kbd;
  label = squares.label;
  legend = squares.legend;
  li = squares.li;
  main = squares.main;
  map = squares.map;
  mark = squares.mark;
  menu = squares.menu;
  menuitem = squares.menuitem;
  meter = squares.meter;
  nav = squares.nav;
  noscript = squares.noscript;
  object = squares.object;
  ol = squares.ol;
  optgroup = squares.optgroup;
  option = squares.option;
  output = squares.output;
  p = squares.p;
  pre = squares.pre;
  progress = squares.progress;
  q = squares.q;
  rp = squares.rp;
  rt = squares.rt;
  ruby = squares.ruby;
  s = squares.s;
  samp = squares.samp;
  script = squares.script;
  section = squares.section;
  select = squares.select;
  small = squares.small;
  span = squares.span;
  strong = squares.strong;
  style = squares.style;
  sub = squares.sub;
  summary = squares.summary;
  sup = squares.sup;
  table = squares.table;
  tbody = squares.tbody;
  td = squares.td;
  textarea = squares.textarea;
  tfoot = squares.tfoot;
  th = squares.th;
  thead = squares.thead;
  time = squares.time;
  title = squares.title;
  tr = squares.tr;
  u = squares.u;
  ul = squares.ul;
  /**
   * we need to use varElement
   * because var is reserved keyword
   */
  varibale = squares.variable;
  video = squares.video;

  /** SVG ELEMENTS */
  g = squares.g;
  svg = squares.svg;
  text = squares.text;

  /** NOT PAIR ELEMENTS */
  area = squares.area;
  base = squares.base;
  br = squares.br;
  col = squares.col;
  embed = squares.embed;
  hr = squares.hr;
  img = squares.img;
  input = squares.input;
  keygen = squares.keygen;
  link = squares.link;
  meta = squares.meta;
  param = squares.param;
  /**
   * Command is not in react
   * param = registerDomComponent("param"; false);
   */
  source = squares.source;
  track = squares.track;
  wbr = squares.wbr;

  /** SVG NOT PAIR ELEMENTS */
  circle = squares.circle;
  line = squares.line;
  path = squares.path;
  polyline = squares.polyline;
  rect = squares.rect;


}

initReact() {
  _USED = _REACT;
  initGlobal();
  react.setClientConfiguration();


  mountComponent = (dynamic what, dynamic where) {
    reactBenchmark.start(Benchmark.MOUNTING);
    reactBenchmark.start(Benchmark.ALLRENDERED);
    react.renderComponent(what, where);
    reactBenchmark.stop(Benchmark.MOUNTING);
  };

  createVirtualDOM = mountComponent;

  registerComponent = (_Factory factory) {
    react.ReactComponentFactory reactFactory = ([Map props, dynamic children]) => factory(props: props, children: children);
    var registeredComponent = react.registerComponent(reactFactory);
    return ({props, children, key, Map listeners}) {
      if (!(props is Map)) {
        props = {};
      }
      if (listeners is Map) {
        props.addAll(listeners);
      }
      props["key"] = key;
      return registeredComponent(props, children);
    };
  };

  benchmark = reactBenchmark;

  a = _ReactElementToTiles(react.a);
  abbr = _ReactElementToTiles(react.abbr);
  address = _ReactElementToTiles(react.address);
  article = _ReactElementToTiles(react.article);
  aside = _ReactElementToTiles(react.aside);
  audio = _ReactElementToTiles(react.audio);
  b = _ReactElementToTiles(react.b);
  bdi = _ReactElementToTiles(react.bdi);
  bdo = _ReactElementToTiles(react.bdo);
  big = _ReactElementToTiles(react.big);
  blockquote = _ReactElementToTiles(react.blockquote);
  body = _ReactElementToTiles(react.body);
  button = _ReactElementToTiles(react.button);
  canvas = _ReactElementToTiles(react.canvas);
  caption = _ReactElementToTiles(react.caption);
  cite = _ReactElementToTiles(react.cite);
  code = _ReactElementToTiles(react.code);
  colgroup = _ReactElementToTiles(react.colgroup);
  data = _ReactElementToTiles(react.data);
  datalist = _ReactElementToTiles(react.datalist);
  dd = _ReactElementToTiles(react.dd);
  del = _ReactElementToTiles(react.del);
  details = _ReactElementToTiles(react.details);
  dfn = _ReactElementToTiles(react.dfn);
  div = _ReactElementToTiles(react.div);
  dl = _ReactElementToTiles(react.dl);
  dt = _ReactElementToTiles(react.dt);
  em = _ReactElementToTiles(react.em);
  fieldset = _ReactElementToTiles(react.fieldset);
  figcaption = _ReactElementToTiles(react.figcaption);
  figure = _ReactElementToTiles(react.figure);
  footer = _ReactElementToTiles(react.footer);
  form = _ReactElementToTiles(react.form);
  h1 = _ReactElementToTiles(react.h1);
  h2 = _ReactElementToTiles(react.h2);
  h3 = _ReactElementToTiles(react.h3);
  h4 = _ReactElementToTiles(react.h4);
  h5 = _ReactElementToTiles(react.h5);
  h6 = _ReactElementToTiles(react.h6);
  head = _ReactElementToTiles(react.head);
  header = _ReactElementToTiles(react.header);
  html = _ReactElementToTiles(react.html);
  i = _ReactElementToTiles(react.i);
  iframe = _ReactElementToTiles(react.iframe);
  ins = _ReactElementToTiles(react.ins);
  kbd = _ReactElementToTiles(react.kbd);
  label = _ReactElementToTiles(react.label);
  legend = _ReactElementToTiles(react.legend);
  li = _ReactElementToTiles(react.li);
  main = _ReactElementToTiles(react.main);
  map = _ReactElementToTiles(react.map);
  mark = _ReactElementToTiles(react.mark);
  menu = _ReactElementToTiles(react.menu);
  menuitem = _ReactElementToTiles(react.menuitem);
  meter = _ReactElementToTiles(react.meter);
  nav = _ReactElementToTiles(react.nav);
  noscript = _ReactElementToTiles(react.noscript);
  object = _ReactElementToTiles(react.object);
  ol = _ReactElementToTiles(react.ol);
  optgroup = _ReactElementToTiles(react.optgroup);
  option = _ReactElementToTiles(react.option);
  output = _ReactElementToTiles(react.output);
  p = _ReactElementToTiles(react.p);
  pre = _ReactElementToTiles(react.pre);
  progress = _ReactElementToTiles(react.progress);
  q = _ReactElementToTiles(react.q);
  rp = _ReactElementToTiles(react.rp);
  rt = _ReactElementToTiles(react.rt);
  ruby = _ReactElementToTiles(react.ruby);
  s = _ReactElementToTiles(react.s);
  samp = _ReactElementToTiles(react.samp);
  script = _ReactElementToTiles(react.script);
  section = _ReactElementToTiles(react.section);
  select = _ReactElementToTiles(react.select);
  small = _ReactElementToTiles(react.small);
  span = _ReactElementToTiles(react.span);
  strong = _ReactElementToTiles(react.strong);
  style = _ReactElementToTiles(react.style);
  sub = _ReactElementToTiles(react.sub);
  summary = _ReactElementToTiles(react.summary);
  sup = _ReactElementToTiles(react.sup);
  table = _ReactElementToTiles(react.table);
  tbody = _ReactElementToTiles(react.tbody);
  td = _ReactElementToTiles(react.td);
  textarea = _ReactElementToTiles(react.textarea);
  tfoot = _ReactElementToTiles(react.tfoot);
  th = _ReactElementToTiles(react.th);
  thead = _ReactElementToTiles(react.thead);
  time = _ReactElementToTiles(react.time);
  title = _ReactElementToTiles(react.title);
  tr = _ReactElementToTiles(react.tr);
  u = _ReactElementToTiles(react.u);
  ul = _ReactElementToTiles(react.ul);
  /**
   * we need to use varElement
   * because var is reserved keyword
   */
  varibale = _ReactElementToTiles(react.variable);
  video = _ReactElementToTiles(react.video);

  /** SVG ELEMENTS */
  g = _ReactElementToTiles(react.g);
  svg = _ReactElementToTiles(react.svg);
  text = _ReactElementToTiles(react.text);

  /** NOT PAIR ELEMENTS */
  area = _ReactElementToTiles(react.area);
  base = _ReactElementToTiles(react.base);
  br = _ReactElementToTiles(react.br);
  col = _ReactElementToTiles(react.col);
  embed = react.embed;
  hr = _ReactElementToTiles(react.hr);
  img = _ReactElementToTiles(react.img);
  input = _ReactElementToTiles(react.input);
  keygen = _ReactElementToTiles(react.keygen);
  link = _ReactElementToTiles(react.link);
  meta = _ReactElementToTiles(react.meta);
  param = _ReactElementToTiles(react.param);
  /**
   * Command is not in react
   * param = registerDomComponent("param"; false);
   */
  source = _ReactElementToTiles(react.source);
  track = _ReactElementToTiles(react.track);
  wbr = _ReactElementToTiles(react.wbr);

  /** SVG NOT PAIR ELEMENTS */
  circle = _ReactElementToTiles(react.circle);
  line = _ReactElementToTiles(react.line);
  path = _ReactElementToTiles(react.path);
  polyline = _ReactElementToTiles(react.polyline);
  rect = _ReactElementToTiles(react.rect);
}

