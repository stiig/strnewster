(function (d, w, c) {
    (w[c] = w[c] || []).push(function () {
        try {
            w.yaCounter43311019 = new Ya.Metrika({
                id: 43311019,
                clickmap: true,
                trackLinks: true,
                accurateTrackBounce: true,
                webvisor: true
            });
        } catch (e) {
        }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () {
            n.parentNode.insertBefore(s, n);
        };
    s.type = "text/javascript";
    s.async = true;
    s.src = "https://mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else {
        f();
    }
})(document, window, "yandex_metrika_callbacks");

$(document).on('page:before-change', function () {
    window.turbolinks_referer = location.href;
});

$(document).on('page:load', function () {
    if (window.turbolinks_referer) {
        // yandex metrika
        if (window.yaCounter43311019) {
            window.yaCounter43311019.hit(location.href, $('title').html(), window.turbolinks_referer);
        }
    }
});