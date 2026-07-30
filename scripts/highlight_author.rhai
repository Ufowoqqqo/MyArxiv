import "scripts/config" as cfg;
let authors = params[0];

let authors = authors.map(|v| {
    let highlighted = v.to_lower() in cfg::authors_lower;
    let escaped = Regex("&").replace_all(v, "&amp;");
    let escaped = Regex("<").replace_all(escaped, "&lt;");
    let escaped = Regex(">").replace_all(escaped, "&gt;");
    let escaped = Regex("\"").replace_all(escaped, "&quot;");
    let escaped = Regex("'").replace_all(escaped, "&#39;");

    if highlighted {
        "<span class=\"highlight-author\">" + escaped + "</span>"
    } else {
        escaped
    }
});

let start = authors.shift();
authors.reduce(|sum, v| sum + ", " + v, start)
