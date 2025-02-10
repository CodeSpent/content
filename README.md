# **Content Repository**

This repository is dedicated to managing all types of content in an organized and version-controlled manner. It is
designed to operate independently, enabling seamless integration with other services (like APIs and frontends) as a *
*Git submodule** within the `phanford.dev` ecosystem.

---

## **Repository Purpose**

The purpose of this repository is to:

1. Centralize all content such as **articles**, **notes**, **documents**, and **papers**.
2. Maintain clear organization of Markdown files and associated metadata (like frontmatter).
3. Work seamlessly as a **submodule** within the `phanford.dev` project to allow real-time updates and easy deployment.
4. Enable scalable workflows including content creation, version control, and automated publishing.

---

## **How the Content Repository Works**

### **As a Submodule in `phanford.dev`**

This repository is integrated into the core `phanford.dev` project as a **Git Submodule**, allowing it to exist
separately yet still function as an integral part of the ecosystem. This allows sourcing of the content in a decoupled
way to enable the rich content system on the site.

The way this works is by creating a symbiotic link between the `content` repository and the content directory on
`phanford.dev` at build time. This is done in CI via **Github Actions** by triggering a task when the `content`
repository is updated to trigger a build of `phanford.dev`.

To achieve this we;

1. **Add `content` as a Submodule**:  
   b. In the `phanford.dev` repository, this repository is initialized as a submodule (under the directory`content`):
   ```bash
   git submodule add https://github.com/CodeSpent/content content
   ```

   At this point, the `content` directory in `phanford.dev` will now point to the `content` repository.

   ```phanford.dev/
   ...
   ├── public/
   ├── package.json
   ├── README.md
   └── content/ # https://github.com/codespent/content
       ├── articles/
       ├── notes/
       ├── documents/
        ...  
   ...
   ```
   
   1a. **`.gitkeep` target directory for CI compatibility *(optional)***:

   Since the content directory will be empty before initializing the submodule, the directory in `phanford.dev` will
   not be included in your git repository. Therefore, if the target directory is required to exist for CI or any other
   use-case, you'll want to add
   a `.gitkeep` file inside the target directory. This retains the directory in your file structure in git despite being an
   empty directory.

3. 
   A `.gitkeep` file is created in `phanford.dev` in the `content` directory. 
   ```bash
      touch content/.gitkeep
   ```

2. **Cloning Project with Submodule**:  
   When cloning `phanford.dev`, the submodule will need to be initialized.

   ```bash
   git clone https://github.com/CodeSpent/phanford.dev
   cd phanford.dev
   git submodule init
   git submodule update
   ```

3. **Update Submodule Changes**:  
   If changes are made to the content repository and pushed independently, `phanford.dev` will need to fetch and
   update:

   ```bash
   cd content-repository
   git pull origin main
   ```

4. **Committing Changes to Submodule from Project**:  
   If changes are made to the `content` repository from within `phanford.dev`, changes will need to be committed in
   the parent directory:

   ```bash
   git add content
   git commit -m "content: update <content> in content submodule"
   git push origin main
   ```
   
   > Note: Using the `content: ` prefix helps identify these changes in telemetry tasks. This can help
   alleviate noise in busy content environments when debugging.
---

## **Core Content Types**

This repository organizes its content into categories for flexibility and scalability. Each content type serves a
specific purpose, outlined below:

### **1. Articles**

Articles are long-form pieces of content intended for blog posts, editorials, or other polished publications. These are
examples:

- Tutorials
- Industry insights
- Public-facing documentation

**Structure**:

- Stored within the `articles/` directory.
- Written using Markdown with frontmatter for metadata.

**Example Frontmatter**:

```yaml
---
title: "Introduction to React"
author: "John Doe"
tags: [ "React", "JavaScript" ]
date: "2023-10-10"
draft: false
---
```

**Use Case**: Blog posts, technical write-ups, or marketing content.

---

### **2. Documents**

Documents represent formal yet more general-purpose content compared to articles. They could include quick-start guides
and internal documentation or serve as reference pieces.

**Structure**:

- Stored within the `documents/` directory.

**Example Frontmatter**:

```yaml
---
title: "Internal Workflow Documentation"
author: "Jane Smith"
version: 1.2
tags: [ "workflow", "internal" ]
date: "2023-10-15"
---
```

**Use Case**: Functional guides, onboarding materials, and procedural documents.

---

### **3. Notes**

Notes are shorter, less formal, and often represent snippets of ideas, thoughts, or knowledge. These are ideal for quick
publishing from external tools like Obsidian.

**Structure**:

- Stored within the `notes/` directory.
- Typically, notes follow the format you might find in Obsidian or another note-taking tool.

**Example Frontmatter**:

```yaml
---
title: "Personal Productivity Tips"
tags: [ "productivity", "life" ]
date: "2023-10-12"
---
```

**Use Case**: Sharing small, concise pieces of information or actionable ideas.

---

### **4. Papers**

Papers are formal, research-heavy documents such as white papers, research findings, or thought-leadership pieces. These
require careful formatting and metadata for authenticity and reference.

**Structure**:

- Stored within the `papers/` directory.
- Papers may include additional references and attachments (e.g., Latex files, PDFs).

**Example Frontmatter**:

```yaml
---
title: "Deep Dive into Machine Learning"
authors:
  - "Alice Brown"
  - "Bob Green"
publication: "Phanford Research Lab"
tags: [ "machine learning", "research" ]
date: "2023-09-01"
references:
  - "https://arxiv.org/abs/1234.56789"
---
```

**Use Case**: White papers, formal research, and influential thought-leadership material.

---

## **File and Metadata Standards**

All files in this repository are Markdown-based and structured with **YAML frontmatter** for metadata. This makes
content parsing seamless, whether for publishing or processing by APIs.

**Example Markdown Content File**:

```markdown
---
title: "How to Build Faster Websites"
author: "Jane Smith"
tags: ["Web Development", "Performance"]
date: "2023-08-01"
type: "article"
summary: "Learn how to optimize your site for performance, from caching to code splitting."
---

# How to Build Faster Websites

Improving website performance can drastically impact user experience. In this article, we'll cover...
```

---

## **How to Add Content**

1. Add your content to the appropriate folder (`articles/`, `notes/`, etc.).
2. Use **frontmatter metadata** to define key attributes (e.g., title, tags, date).
3. Commit your changes:
   ```bash
   git add .
   git commit -m "Added new article: 'How to Build Faster Websites'"
   git push origin main
   ```

If this repository is a submodule inside `phanford.dev`, follow the submodule instructions outlined earlier.

---

## **Future Plans**

1. **Versioning**: Introduce version control for content types, particularly `documents` and `papers`.
2. **Preview Workflow**: Enable previewing drafts before publishing via `phanford.dev`.
3. **Improved Automation**: Implement CI/CD pipelines to validate content and populate the API automatically.
4. **Expanded Types**: Add more content types (e.g., tutorials, case studies).

---

## **Contributing**

This repository is maintained as part of the **phanford.dev** project. To contribute:

1. Fork the repository.
2. Create a branch related to the content or feature you are adding (e.g., `add-article-optimize-websites`).
3. Submit a pull request for review.

For more details, see [CONTRIBUTING.md](CONTRIBUTING.md).

---

## **License**

All content within this repository is licensed under the **Creative Commons Attribution-NonCommercial 4.0 International
License (CC BY-NC 4.0)** unless specified otherwise.