library angular.core.facade.dom;

import 'dart:html';
import 'dart:js' show JsObject;

export 'dart:html' show DocumentFragment, Node, Element, TemplateElement, Text, document, location;

// TODO(tbosch): Is there a builtin one? Why is Dart
// removing unknown elements by default?
class IdentitySanitizer implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {}
}

final identitySanitizer = new IdentitySanitizer();

class DOM {
  static query(selector) {
    return document.querySelector(selector);
  }
  static Element querySelector(el, String selector) {
    return el.querySelector(selector);
  }
  static ElementList querySelectorAll(el, String selector) {
    return el.querySelectorAll(selector);
  }
  static on(element, event, callback) {
    element.addEventListener(event, callback);
  }
  static getInnerHTML(el) {
    return el.innerHtml;
  }
  static getOuterHTML(el) {
    return el.outerHtml;
  }
  static setInnerHTML(el, value) {
    el.innerHtml = value;
  }
  static Node firstChild(el) {
    return el.firstChild;
  }
  static Element parentElement(el) {
    return el.parent;
  }
  static List<Node> childNodes(el) {
    return el.childNodes;
  }
  static appendChild(el, node) {
    el.append(node);
  }
  static removeChild(el, node) {
    node.remove();
  }
  static insertAfter(el, node) {
    el.parentNode.insertBefore(node, el.nextNode);
  }
  static setText(Text text, String value) {
    text.text = value;
  }
  static createTemplate(html) {
    var t = new TemplateElement();
    t.setInnerHtml(html, treeSanitizer:identitySanitizer);
    return t;
  }
  static createElement(tagName, [doc=null]) {
    if (doc == null) doc = document;
    return doc.createElement(tagName);
  }
  static clone(Node node) {
    return node.clone(true);
  }
  static hasProperty(Element element, String name) {
    return new JsObject.fromBrowserObject(element).hasProperty(name);
  }
  static getElementsByClassName(Element element, String name) {
    return element.getElementsByClassName(name);
  }
  static getElementsByTagName(Element element, String name) {
    return element.querySelectorAll(name);
  }
  static List classList(Element element) {
    return element.classes.toList();
  }
  static addClass(Element element, classname) {
    element.classes.add(classname);
  }
  static hasClass(Element element, classname) {
    return element.classes.contains(classname);
  }
  static attributeMap(Element element) {
    return element.attributes;
  }
  static Node templateAwareRoot(Element el) {
    return el is TemplateElement ? el.content : el;
  }
  static HtmlDocument createHtmlDocument() {
    return document.implementation.createHtmlDocument('fakeTitle');
  }
  static HtmlDocument defaultDoc() {
    return document;
  }
}
