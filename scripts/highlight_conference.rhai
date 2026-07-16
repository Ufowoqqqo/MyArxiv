import "scripts/config" as cfg;
let comment = params[0];

let conferences_rg = RegexCaseInsensitive(`(?P<key>(${cfg::conferences_rg}))`);

if comment != () {
    let conference = conferences_rg.find(comment);
    let conference = conference.text;

    let conference = if conference != "" {
        let conference = Regex("&").replace_all(conference, "&amp;");
        let conference = Regex("<").replace_all(conference, "&lt;");
        let conference = Regex(">").replace_all(conference, "&gt;");
        let conference = Regex("\"").replace_all(conference, "&quot;");
        let conference = Regex("'").replace_all(conference, "&#39;");
        "<span class=\"chip\">" + conference + "</span>"
    } else {
        ""
    };

    conference
} else {
    ""
}
