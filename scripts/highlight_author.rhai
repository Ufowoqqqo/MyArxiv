import "scripts/config" as cfg;
let authors = params[0];

let authors_rg = RegexCaseInsensitive(`(?P<key>(${cfg::authors_rg}))`);
let authors = authors.map(|v| {
    let v = Regex("&").replace_all(v, "&amp;");
    let v = Regex("<").replace_all(v, "&lt;");
    let v = Regex(">").replace_all(v, "&gt;");
    let v = Regex("\"").replace_all(v, "&quot;");
    let v = Regex("'").replace_all(v, "&#39;");
    authors_rg.replace_all(v,"<span class=\"highlight-author\">$key</span>")
});

let start = authors.shift();
authors.reduce(|sum, v| sum + ", " + v, start)
