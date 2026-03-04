(function () {
  var scriptUrl = "https://widget-cdn.simplepractice.com/assets/integration-1.0.js";
  var requested = false;

  function loadWidget() {
    if (requested) {
      return;
    }
    requested = true;

    var script = document.createElement("script");
    script.src = scriptUrl;
    script.async = true;
    document.body.appendChild(script);
  }

  var ctas = document.querySelectorAll("a[data-spwidget-autobind]");
  if (!ctas.length) {
    return;
  }

  ctas.forEach(function (cta) {
    cta.addEventListener("mouseenter", loadWidget, { once: true });
    cta.addEventListener("focus", loadWidget, { once: true });
    cta.addEventListener("pointerdown", loadWidget, { once: true });
    cta.addEventListener("touchstart", loadWidget, { once: true, passive: true });
  });

  if ("requestIdleCallback" in window) {
    requestIdleCallback(loadWidget, { timeout: 4500 });
  } else {
    window.setTimeout(loadWidget, 4500);
  }
})();
