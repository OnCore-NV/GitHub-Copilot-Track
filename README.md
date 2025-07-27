# GitHub Copilot Training Course

A comprehensive full-day training course for developers to master GitHub Copilot and AI-assisted development.

## 📁 Repository Contents

```
GitHubCopilotCourse/
├── github-copilot-training.md    # Main presentation slides (Marp format)
├── structure.md                  # Course structure and timing guide
├── cronos-marp-template.md       # Marp theme template (Cronos branding)
├── context-pack/                 # Exercise 2: Context Matters resources
│   ├── README.md                 # Overview of context pack usage
│   ├── requirements.md           # Team Lunch Voting App requirements
│   ├── tech-stack.md            # Technology stack specifications
│   ├── api-spec.yaml            # OpenAPI specification
│   ├── database-schema.sql      # PostgreSQL database schema
│   ├── ui-mockup.md             # UI design and components
│   └── code-patterns.md         # Code examples and patterns
└── Source/                       # Additional reference materials
    └── Developer Productivity... # Background PDF on LLM training
```

### File Descriptions

- **`github-copilot-training.md`** - The main presentation file containing all slides for the full-day course
- **`structure.md`** - Detailed timing and exercise instructions for instructors
- **`cronos-marp-template.md`** - Example of Cronos-themed Marp presentation
- **`context-pack/`** - Complete documentation set used in Exercise 2 to demonstrate the importance of context when using AI tools

## 📖 Viewing the Presentation

### Option 1: VS Code with Marp Extension (Recommended)
1. Install the [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) extension
2. Open `github-copilot-training.md` in VS Code
3. Click the preview button or press `Ctrl+K V` (Windows/Linux) or `Cmd+K V` (Mac)
4. For presentation mode, click the presentation icon in the preview toolbar

### Option 2: Marp CLI
```bash
# Install Marp CLI globally
npm install -g @marp-team/marp-cli

# Generate HTML presentation
marp github-copilot-training.md -o presentation.html

# Generate PDF
marp github-copilot-training.md -o presentation.pdf

# Serve presentation with live reload
marp -s github-copilot-training.md
```

### Option 3: Export and Present
1. Export to PDF or PPTX using Marp
2. Use your preferred presentation software
3. Note: Interactive features work best in HTML format

## 🎨 Customization

To adapt the presentation for your organization:
1. Edit the CSS variables in the `github-copilot-training.md` header
2. Replace Cronos branding with your own
3. Update instructor contact information in the slides
4. Add organization-specific examples and policies

## 📄 License

This course material is provided as-is for educational purposes.

---

Created using [Marp](https://marp.app/) • Images from [Unsplash](https://unsplash.com/)