# AI Development Tools & Training Resources

This repository provides comprehensive resources for developers learning to work effectively with AI development tools like GitHub Copilot, including example prompts, context packs, and training materials from a full-day development course.

## 🎯 Repository Purpose

This collection serves three main purposes:
1. **Example Prompts**: Ready-to-use prompt templates for AI development tools
2. **Context Pack**: Complete specification example for context-driven development
3. **Training Materials**: PowerPoint presentation and resources from AI development training

## 📁 Repository Contents

```
GitHubCopilotCourse/
├── github-copilot-training.md        # Marp presentation slides
├── github-copilot-training.pptx      # PowerPoint presentation (latest)
├── github-copilot-training.pdf       # PDF version of presentation
├── one-prompt-to-rule-them-all.md    # Master prompt engineering guide
├── cronos-marp-template.md           # Branded presentation template
├── prompts/                          # Collection of AI prompt templates
│   ├── AnalyzeFunction.prompt.md     # Code analysis prompts
│   ├── AnalyzeStory.prompt.md        # Story/requirement analysis
│   ├── GenerateArchitecture.prompt.md # Architecture generation
│   ├── GenerateDocumentation.prompt.md # Documentation creation
│   ├── GenerateTests.prompt.md       # Test generation prompts
│   ├── ImplementStory.prompt.md      # Feature implementation
│   ├── ReviewSecurity.prompt.md      # Security review prompts
│   ├── Errorfix.prompt.md            # Bug fixing assistance
│   ├── SearchForIssues.prompt.md     # Issue detection
│   └── Open Issues.prompt.md         # Open issue analysis
├── Chatmodes/                        # Custom chat mode configurations
│   ├── Research.chatmode.md          # Research assistant mode
│   └── Teacher.chatmode.md           # Educational assistant mode
├── Instructions/                     # Development instructions
│   └── Development.instructions.md   # Development guidelines
└── context-pack/                     # Complete spec-flow example
    ├── README.md                     # Context pack guide
    ├── requirements.md               # Functional requirements
    ├── tech-stack.md                # Technology specifications
    ├── api-spec.yaml                # OpenAPI specification
    ├── database-schema.sql          # Database design
    ├── ui-mockup.md                 # UI/UX specifications
    ├── code-patterns.md             # Code examples & patterns
    └── team-lunch-voter/            # Sample project structure
```

## 🚀 Getting Started

### 1. Using the Prompt Templates

The `prompts/` directory contains structured prompt templates for common development tasks:

```bash
# Example: Use the function analysis prompt
cat prompts/AnalyzeFunction.prompt.md
```

Each prompt follows a consistent CRISP framework structure:
- **Context**: Background information
- **Role**: Your role in the task
- **Instructions**: What to do
- **Specifics**: Detailed requirements
- **Pattern**: Expected output format

### 2. Working with the Context Pack

The `context-pack/` demonstrates a complete specification-driven development approach:

```bash
# Start with the overview
open context-pack/README.md

# Use with AI tools by referencing multiple files
# Example: "Using the context from requirements.md and api-spec.yaml, implement..."
```

This pack includes everything needed to build a complete application:
- Business requirements and user stories
- Technical architecture and stack decisions
- API specifications and database schemas
- UI mockups and design patterns
- Code examples and best practices

### 3. Chat Modes & Instructions

- **`Chatmodes/`**: Pre-configured AI assistant modes for different scenarios
- **`Instructions/`**: Development guidelines and coding standards

## 📋 Prompt Categories

| Category | Files | Purpose |
|----------|-------|---------|
| **Analysis** | `AnalyzeFunction.prompt.md`<br>`AnalyzeStory.prompt.md` | Code and requirement analysis |
| **Generation** | `GenerateArchitecture.prompt.md`<br>`GenerateDocumentation.prompt.md`<br>`GenerateTests.prompt.md` | Creating new code and docs |
| **Implementation** | `ImplementStory.prompt.md` | Feature development |
| **Quality** | `ReviewSecurity.prompt.md`<br>`SearchForIssues.prompt.md` | Code review and issue detection |
| **Debugging** | `Errorfix.prompt.md`<br>`Open Issues.prompt.md` | Problem resolution |

## 📖 Training Materials

### PowerPoint Presentation
The main training resource is `github-copilot-training.pptx` - a comprehensive full-day course on AI development tools.

### Marp Version
For those preferring markdown-based presentations:

1. **VS Code with Marp Extension** (Recommended):
   - Install [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode)
   - Open `github-copilot-training.md`
   - Use `Cmd+K V` (Mac) or `Ctrl+K V` (Windows/Linux) for preview

2. **Marp CLI**:
   ```bash
   npm install -g @marp-team.marp-cli
   marp github-copilot-training.md -o presentation.html
   ```

## 🛠 Best Practices

### Effective Prompt Engineering

1. **Be Specific**: Use the detailed prompt templates as starting points
2. **Provide Context**: Reference multiple specification files when relevant
3. **Follow Patterns**: Use the CRISP framework structure
4. **Iterate**: Start with basic prompts and refine based on results

### Context-Driven Development

1. **Gather Complete Context**: Use all relevant specification documents
2. **Reference Standards**: Point AI tools to your code patterns and conventions
3. **Validate Against Specs**: Always check implementations against requirements
4. **Use Real Examples**: The context-pack provides a complete working example

## 🎯 Use Cases

- **Training Sessions**: Use the PowerPoint for workshops and courses
- **Daily Development**: Apply prompt templates for routine coding tasks
- **Project Setup**: Follow the context-pack pattern for new projects
- **Code Reviews**: Use analysis prompts for systematic code evaluation
- **Documentation**: Generate docs using the provided templates

## 🤝 Contributing

This repository serves as a reference collection. To contribute:

1. **New Prompts**: Add structured prompts following the CRISP framework
2. **Context Examples**: Expand the context-pack with additional scenarios  
3. **Training Updates**: Keep presentation materials current with latest AI tools
4. **Documentation**: Improve examples and usage instructions

## 📄 License

These materials are provided for educational and development purposes. Please respect any third-party content licenses when adapting for your organization.

## 🔗 Related Resources

- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [Prompt Engineering Guide](https://www.promptingguide.ai/)
- [Marp Presentation Framework](https://marp.app/)

---

*Created for AI-assisted development training and best practices*