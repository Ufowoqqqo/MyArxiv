import "scripts/config" as cfg;

let title = params[0];
let authors = params[1];

title.trim();

// ArxivFeed disables Handlebars' built-in escaping so that helpers can emit
// markup. Escape the untrusted title before adding our own highlight spans.
let title = Regex("&").replace_all(title, "&amp;");
let title = Regex("<").replace_all(title, "&lt;");
let title = Regex(">").replace_all(title, "&gt;");
let title = Regex("\"").replace_all(title, "&quot;");
let title = Regex("'").replace_all(title, "&#39;");

let title_rg = RegexCaseInsensitive(`(?P<key>(${cfg::title_rg}))`);
let title = title_rg.replace_all(title,"<span class=\"highlight-title\">$key</span>");

let authors = authors.map(|v|v.to_lower() in cfg::authors_lower);
let title = if true in authors {
    "<span class=\"highlight-title\">★</span> " + title
} else {
    "☆ " + title
};

title
