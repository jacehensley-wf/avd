part of squares;

/**
 * Returns boolean which is true
 * if attribute with passed key can be added
 * to element of component from arguments.
 */
canAddAttribute(bool svg, String key) {
  return (!svg && allowedAttrs.contains(key))
      || (svg && allowedSvgAttributes.contains(key)) 
      || _matchAllowedPrefix(key);

}

/**
 * tells if the key match some of allowed prefixes
 */
bool _matchAllowedPrefix(String key) {
  bool match = false;
  
  allowedAttrsPrefixes.forEach((prefix) {
    if (key.startsWith(prefix)) {
      match = true;
    }
  });

  return match;
}

final Set<String> allowedAttrs = new Set.from([
  "accept",
  "accessKey",
  "action",
  "allowFullScreen",
  "allowTransparency",
  "alt",
  "autoCapitalize",
  "autoComplete",
  "autoFocus",
  "autoPlay",
  "cellPadding",
  "cellSpacing",
  "charSet",
  "checked",
  "className",
  "cols",
  "colSpan",
  "content",
  "contentEditable",
  "contextMenu",
  "controls",
  "data",
  "dateTime",
  "dir",
  "disabled",
  "draggable",
  "encType",
  "for",
  "form",
  "frameBorder",
  "height",
  "hidden",
  "href",
  "htmlFor",
  "httpEquiv",
  "icon",
  "id",
  "label",
  "lang",
  "list",
  "loop",
  "max",
  "maxLength",
  "method",
  "min",
  "multiple",
  "name",
  "onClick",
  "pattern",
  "placeholder",
  "poster",
  "preload",
  "radioGroup",
  "readOnly",
  "rel",
  "required",
  "role",
  "rows",
  "rowSpan",
  "scrollLeft",
  "scrollTop",
  "selected",
  "size",
  "spellCheck",
  "src",
  "step",
  "style",
  "tabIndex",
  "target",
  "title",
  "type",
  "value",
  "defaultValue",
  "width",
  "wmode"
]);

final Set<String> allowedSvgAttributes = new Set.from([
  "cx",
  "cy",
  "d",
  "fill",
  "fx",
  "fy",
  "gradientTransform",
  "gradientUnits",
  "offset",
  "points",
  "r",
  "rx",
  "ry",
  "spreadMethod",
  "stopColor",
  "stopOpacity",
  "stroke",
  "strokeLinecap",
  "strokeWidth",
  "transform",
  "version",
  "viewBox",
  "x1",
  "x2",
  "x",
  "y1",
  "y2",
  "y"
]);

final Set<String> allowedAttrsPrefixes = new Set.from(["data-", "aria-"]);

final Set<String> allowedListeners = new Set.from([
  // Mouse Events
  "onClick",
  "onContextMenu",
  "onDblClick",
  "onMouseDown",
  "onMouseEnter",
  "onMouseLeave",
  "onMouseMove",
  "onMouseOver",
  "onMouseOut",
  "onMoudeUp",
  // Keyboard Events
  "onKeyDown",
  "onKeyPress",
  "onKeyUp",
  // Frame/Object Events
  "onAbort",
  "onBeforeUnload",
  "onError",
  "onHashChange",
  "onLoad",
  "onPageShow",
  "onPageHide",
  "onResize",
  "onScroll",
  "onUnload",
  // Form Events
  "onBlur",
  "onChange",
  "onFocus",
  "onFocusIn",
  "onFocusOut",
  "onInput",
  "onInvalid",
  "onReset",
  "onSearch",
  "onSelect",
  "onSubmit",
  // Drag events
  "onDrag",
  "onDragEnd",
  "onDragLeave",
  "onDragOver",
  "onDragStart",
  "onDrop",
  // Clipboard Events
  "onCopy",
  "onCut",
  "onPaste",
  // Print Events
  "onAfterPrint",
  "onBeforePrint",
  // Media Events
  "onAbort",
  "onCanPlay",
  "onCanPlayThrough",
  "onDurationChange",
  "onEmptied",
  "onEnded",
  "onError",
  "onLoadedData",
  "onLoadedMetaData",
  "onLoadStart",
  "onPause",
  "onPlay",
  "onPlaying",
  "onProgress",
  "onRateChange",
  "onSeeked",
  "onSeeking",
  "onStalled",
  "onSuspend",
  "onTimeUpdate",
  "onVolumeChange",
  "onWaiting",
  // Animation Events
  "animationEnd",
  "animationIteration",
  "animationStart",
  // Transition Events
  "transitionEnd",
  // Server-Sent Events
  "onError",
  "onMessage",
  "onOpen",
  // Misc Events
  "onMessage",
  "onMouseWheel",
  "onOnline",
  "onPopState",
  "onShow",
  "onStorage",
  "onToggle",
  "onWheel",
  // Touch Events
  "onTouchCancel",
  "onTouchEnd",
  "onTouchMove",
  "onTouchStart",
]);

const VALUE = "value";
const DEFAULTVALUE = "defaultValue";
