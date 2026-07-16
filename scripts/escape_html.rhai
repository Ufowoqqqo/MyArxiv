let value = params[0];

if value == () {
    ""
} else {
    let value = Regex("&").replace_all(value, "&amp;");
    let value = Regex("<").replace_all(value, "&lt;");
    let value = Regex(">").replace_all(value, "&gt;");
    let value = Regex("\"").replace_all(value, "&quot;");
    Regex("'").replace_all(value, "&#39;")
}
