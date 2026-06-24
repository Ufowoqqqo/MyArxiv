# MyArxiv: Personalized Research Paper Tracking

Meeting presentation for June 25, 2026.

Repository: [Ufowoqqqo/MyArxiv](https://github.com/Ufowoqqqo/MyArxiv)

---

## 1. Executive Summary

MyArxiv is a personalized arXiv monitoring website for researchers who need to track new papers efficiently across selected computer science domains.

This repository packages a GitHub Pages based research feed that automatically collects recent arXiv papers, highlights user-defined research signals, and publishes the result as a lightweight web page.

The current configuration is customized for database systems, algorithms, information retrieval, machine learning, artificial intelligence, and computational linguistics.

---

## 2. Problem

arXiv publishes a large volume of new papers every day. For researchers, the main challenge is not access to papers, but filtering.

Common pain points:

- Too many daily submissions across overlapping research areas.
- Repeated manual checking of arXiv categories.
- Hard to notice papers related to specific methods, systems, authors, or venues.
- Valuable papers can be missed when they are posted outside a single core category.

---

## 3. Project Goal

The goal of MyArxiv is to turn a generic arXiv feed into a personalized research dashboard.

The project is designed to:

- Track selected arXiv categories automatically.
- Cache recent papers for a configurable time window.
- Highlight important title keywords, authors, and venue names.
- Publish the feed through GitHub Pages with minimal maintenance.
- Keep customization simple through configuration files and small scripts.

---

## 4. Current Repository Scope

This customized repository tracks six arXiv areas:

| arXiv Category | Area |
| --- | --- |
| `cs.DB` | Databases |
| `cs.DS` | Data Structures and Algorithms |
| `cs.IR` | Information Retrieval |
| `cs.LG` | Machine Learning |
| `cs.AI` | Artificial Intelligence |
| `cs.CL` | Computation and Language |

Each category currently fetches up to 150 papers per update cycle.

---

## 5. Key Features

- Daily automated feed generation through GitHub Actions.
- GitHub Pages deployment from the generated static output.
- Configurable paper retention window, currently set to 7 days.
- Keyword highlighting for vector search, ANN, quantization, RAG, and agent memory topics.
- Author highlighting for selected researchers in vector databases, approximate nearest neighbor search, retrieval, and related systems.
- Venue highlighting for major database, IR, ML, AI, NLP, systems, and security conferences or journals.
- Expandable paper entries with title, authors, abstract, arXiv link, PDF link, and comments.
- Dark and light mode support.
- LaTeX math rendering in abstracts.

---

## 6. System Workflow

```text
config.toml
    |
    | defines arXiv categories, cache URL, retention window, and scripts
    v
GitHub Actions workflow
    |
    | downloads the ArxivFeed binary
    | runs feed generation
    v
target/
    |
    | generated static site output
    v
gh-pages branch
    |
    | published by GitHub Pages
    v
Personal MyArxiv website
```

---

## 7. Repository Structure

| Path | Purpose |
| --- | --- |
| `config.toml` | Main site and arXiv source configuration |
| `.github/workflows/update-feed.yml` | Scheduled build and GitHub Pages deployment |
| `scripts/config.rhai` | Highlight configuration for titles, authors, and venues |
| `scripts/highlight_title.rhai` | Title keyword highlighting logic |
| `scripts/highlight_author.rhai` | Author highlighting logic |
| `scripts/highlight_conference.rhai` | Conference and journal highlighting logic |
| `includes/index.hbs` | HTML template for the generated web page |
| `statics/index.css` | Site styling |
| `statics/index.js` | Client-side interactions |

---

## 8. Current Customization

The project has been adapted from the original MyArxiv template for a more focused research agenda.

Main customized signals:

- Vector databases and vector indexing.
- Approximate nearest neighbor search.
- Product quantization and vector compression.
- Dense retrieval and retrieval-augmented generation.
- Agent memory and long-term memory for language agents.
- Database and IR venues such as SIGMOD, VLDB, ICDE, KDD, SIGIR, TODS, TOIS, and TKDE.

This makes the feed useful for monitoring research around scalable retrieval infrastructure and memory-oriented AI systems.

---

## 9. Automation Details

The GitHub Actions workflow is named `Update`.

Triggers:

- Manual trigger through `workflow_dispatch`.
- Automatic trigger on push to `main`.
- Scheduled daily trigger at `05:37 UTC`.

Build steps:

1. Check out the repository.
2. Download the latest `ArxivFeed` release.
3. Run `./arxivfeed`.
4. Deploy generated files from `target/` to the `gh-pages` branch.

The workflow has `contents: write` permission so it can publish the generated GitHub Pages branch.

---

## 10. User Experience

The generated site is intended for daily scanning.

Expected workflow:

1. Open the GitHub Pages site.
2. Select a date and research category.
3. Scan highlighted titles and venue tags.
4. Expand interesting papers to inspect authors and abstracts.
5. Open the arXiv page or PDF directly from the paper entry.

The design keeps the interaction lightweight so the site can work as a daily research inbox.

---

## 11. Demo Plan

Recommended meeting demo sequence:

1. Show the GitHub repository and explain that the project is configuration-driven.
2. Open `config.toml` and show the selected arXiv categories.
3. Open `scripts/config.rhai` and show the customized keyword, author, and venue lists.
4. Open `.github/workflows/update-feed.yml` and show the automation pipeline.
5. Open the GitHub Pages site and demonstrate daily paper browsing.
6. Expand a highlighted paper to show abstract, authors, comments, arXiv link, and PDF link.

---

## 12. Why This Is Useful

MyArxiv reduces the daily research monitoring cost.

Instead of manually searching multiple arXiv categories, the user gets a single personalized feed that emphasizes papers most likely to matter.

The key advantage is not complex ranking. The value comes from a transparent, editable filter layer that researchers can tune as their interests change.

---

## 13. Strengths

- Low operational cost because it runs on GitHub Actions and GitHub Pages.
- Easy to fork, modify, and deploy.
- Transparent filtering rules.
- No backend server required.
- Works well for topic monitoring and lightweight literature tracking.
- Suitable for fast customization before a project meeting or reading group.

---

## 14. Limitations

- It depends on arXiv metadata and the external ArxivFeed tool.
- Current filtering is rule-based, not semantic.
- Highlight quality depends on the maintained keyword, author, and venue lists.
- The site is optimized for monitoring and browsing, not deep paper recommendation.
- Duplicate or weakly relevant papers may still appear when they match broad categories.

---

## 15. Possible Next Steps

Short-term improvements:

- Add more keywords for vector databases, learned indexes, and LLM memory.
- Review and expand the focused author list.
- Add a short English README section for external viewers.
- Check whether GitHub Pages is already configured to publish from `gh-pages`.

Medium-term improvements:

- Add semantic ranking or LLM-based summaries.
- Export weekly digests as Markdown.
- Add tags for paper type, such as benchmark, system, survey, or theory.
- Add a lightweight archive page for important papers.

---

## 16. Download And Local Use

GitHub download options:

- Open the repository page: <https://github.com/Ufowoqqqo/MyArxiv>
- Download the repository as a ZIP file from GitHub.
- Download this presentation directly from `PRESENTATION.md`.
- Clone locally with:

```bash
git clone git@github.com:Ufowoqqqo/MyArxiv.git
```

To update the site configuration locally, edit:

```text
config.toml
scripts/config.rhai
```

Then commit and push to trigger the GitHub Actions update workflow.

---

## 17. Closing Message

MyArxiv provides a practical research-monitoring workflow:

- automatic daily collection,
- customized topic highlighting,
- simple GitHub-based deployment,
- and a clean browsing interface for recent papers.

For the current meeting, the repository can be presented as a ready-to-use personalized arXiv dashboard focused on database, retrieval, machine learning, AI, NLP, vector search, and agent-memory research.
