---
marp: true
theme: cronos
paginate: true
backgroundColor: #fff
style: |
  /* Cronos Public Services Theme */
  @import 'default';
  
  :root {
    --cronos-blue: #0084C7;
    --cronos-dark-blue: #003D5B;
    --cronos-light-blue: #E6F2F8;
    --cronos-gray: #F5F5F5;
    --cronos-text: #333333;
  }
  
  section {
    font-family: 'Arial', 'Helvetica', sans-serif;
    padding: 40px 60px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    background-color: white;
  }
  
  /* Title Slide */
  section.title {
    background-image: linear-gradient(to right, rgba(255,255,255,0.9), rgba(255,255,255,0.7)), url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1920 1080"><rect fill="%23E6F2F8" width="1920" height="1080"/><path fill="%230084C7" opacity="0.1" d="M1920,0 L1920,1080 L960,1080 C960,540 1440,540 1440,0 Z"/></svg>');
    background-size: cover;
    background-position: center;
    justify-content: center;
    align-items: center;
    text-align: center;
  }
  
  section.title h1 {
    color: var(--cronos-blue);
    font-size: 48px;
    font-weight: bold;
    margin-bottom: 20px;
  }
  
  section.title .subtitle {
    color: var(--cronos-text);
    font-size: 24px;
    margin-bottom: 40px;
  }
  
  /* Header and Footer */
  header {
    position: absolute;
    top: 20px;
    left: 60px;
    color: var(--cronos-blue);
    font-weight: bold;
    font-size: 14px;
  }
  
  footer {
    position: absolute;
    bottom: 20px;
    left: 60px;
    right: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 12px;
    color: var(--cronos-text);
  }
  
  footer .date {
    flex: 1;
  }
  
  footer .title {
    flex: 2;
    text-align: center;
  }
  
  footer .page {
    text-align: right;
  }
  
  /* Regular Slides */
  h1 {
    color: var(--cronos-blue);
    font-size: 36px;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid var(--cronos-blue);
  }
  
  h2 {
    color: var(--cronos-dark-blue);
    font-size: 28px;
    margin-top: 20px;
    margin-bottom: 15px;
  }
  
  h3 {
    color: var(--cronos-blue);
    font-size: 22px;
    margin-top: 15px;
    margin-bottom: 10px;
  }
  
  p {
    color: var(--cronos-text);
    font-size: 18px;
    line-height: 1.6;
    margin-bottom: 15px;
  }
  
  ul, ol {
    color: var(--cronos-text);
    font-size: 18px;
    line-height: 1.8;
    margin-left: 20px;
  }
  
  li {
    margin-bottom: 10px;
  }
  
  /* Cronos Logo */
  .logo {
    position: absolute;
    top: 40px;
    right: 60px;
    width: 150px;
    height: auto;
  }
  
  .logo-large {
    width: 300px;
    margin: 40px auto;
  }
  
  /* Code Blocks */
  pre {
    background-color: var(--cronos-gray);
    border-left: 4px solid var(--cronos-blue);
    padding: 15px;
    border-radius: 4px;
    overflow-x: auto;
    font-size: 16px;
    margin: 20px 0;
  }
  
  code {
    background-color: var(--cronos-light-blue);
    padding: 2px 6px;
    border-radius: 3px;
    font-family: 'Consolas', 'Monaco', monospace;
    font-size: 16px;
  }
  
  /* Tables */
  table {
    border-collapse: collapse;
    width: 100%;
    margin: 20px 0;
  }
  
  th {
    background-color: var(--cronos-blue);
    color: white;
    padding: 12px;
    text-align: left;
    font-weight: bold;
  }
  
  td {
    padding: 12px;
    border-bottom: 1px solid var(--cronos-light-blue);
  }
  
  tr:nth-child(even) {
    background-color: var(--cronos-gray);
  }
  
  /* Blockquotes */
  blockquote {
    border-left: 4px solid var(--cronos-blue);
    padding-left: 20px;
    margin: 20px 0;
    font-style: italic;
    color: var(--cronos-dark-blue);
  }
  
  /* Two Column Layout */
  .columns {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 40px;
    align-items: start;
  }
  
  /* Emphasis */
  strong {
    color: var(--cronos-dark-blue);
    font-weight: bold;
  }
  
  em {
    color: var(--cronos-blue);
    font-style: italic;
  }
  
  /* Images */
  img {
    max-width: 100%;
    height: auto;
    display: block;
    margin: 20px auto;
  }
  
  /* Links */
  a {
    color: var(--cronos-blue);
    text-decoration: none;
    border-bottom: 1px solid transparent;
    transition: border-bottom 0.3s;
  }
  
  a:hover {
    border-bottom: 1px solid var(--cronos-blue);
  }
  
  /* Slide Numbers */
  section::after {
    content: attr(data-marpit-pagination);
    position: absolute;
    bottom: 20px;
    right: 60px;
    color: var(--cronos-text);
    font-size: 12px;
  }
  
  /* Hide pagination on title slide */
  section.title::after {
    display: none;
  }
---

<!-- _class: title -->
<!-- _header: "" -->
<!-- _footer: "" -->

# GitHub Copilot Training

<div class="subtitle">Advanced AI-Powered Development</div>

![w:300](https://via.placeholder.com/300x150/0084C7/FFFFFF?text=CRONOS+LOGO)

<div style="position: absolute; bottom: 60px; left: 60px; right: 60px; display: flex; justify-content: space-between; font-size: 14px;">
  <span>CRONOS PUBLIC SERVICES</span>
  <span>info@cronos-public-services.be</span>
  <span>www.cronos-public-services.be</span>
</div>

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 2" -->

# Meet the team

- Introduction of trainers
- Participants round table
- Training objectives
- Schedule overview

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 3" -->

# Round table

## Quick Introduction
- Name and role
- Experience with AI tools
- Current development stack

## Expectations
- What do you hope to learn?
- Specific challenges you want to address
- Questions about GitHub Copilot

---
<!-- _class: title -->
<!-- _header: "" -->
<!-- _footer: "" -->

# Large Language Models

<div class="subtitle">Understanding the Technology Behind Copilot</div>

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 5" -->

# What are Large Language Models?

## Definition
Large Language Models (LLMs) are AI systems trained on vast amounts of text data to understand and generate human-like text.

## Key Characteristics
- **Scale**: Billions of parameters
- **Training**: Massive datasets from the internet
- **Capabilities**: Code generation, natural language understanding, pattern recognition

## Popular Models
- GPT-4 (OpenAI)
- Claude (Anthropic)
- Codex (GitHub Copilot's engine)

---
<!-- _class: title -->
<!-- _header: "" -->
<!-- _footer: "" -->

# GitHub Copilot

<div class="subtitle">Your AI Pair Programmer</div>

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 7" -->

# What is GitHub Copilot?

<div class="columns">
<div>

## Overview
- AI-powered code completion
- Context-aware suggestions
- Multi-language support
- IDE integration

## Key Features
- Real-time code suggestions
- Function generation
- Comment-to-code
- Test generation

</div>
<div>

## Benefits
- Increased productivity
- Learning aid
- Reduced boilerplate
- Creative solutions

## Supported Languages
- JavaScript/TypeScript
- Python
- Java
- C#, Go, Ruby, and more...

</div>
</div>

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 8" -->

# Installation and Setup

## Prerequisites
- GitHub account with Copilot access
- Supported IDE (VS Code, JetBrains, etc.)
- Active internet connection

## Installation Steps
1. Install GitHub Copilot extension
2. Sign in with GitHub account
3. Authorize Copilot access
4. Configure settings

```bash
# VS Code installation via command line
code --install-extension GitHub.copilot
```

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 9" -->

# Basic Usage

## Comment-Driven Development

```javascript
// Function to calculate the fibonacci sequence up to n terms
function fibonacci(n) {
  // Copilot will suggest the implementation
}
```

## Autocomplete Enhancement

```python
# Start typing and Copilot suggests completions
def merge_sort(arr):
    # Copilot helps with the algorithm
```

## Natural Language Queries

```typescript
// Q: How do I make an HTTP GET request in TypeScript?
// Copilot provides the answer with code
```

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 10" -->

# Best Practices

<div class="columns">
<div>

## Do's ✅
- Write clear comments
- Review suggestions carefully
- Use for boilerplate code
- Learn from suggestions
- Customize to your style

## Context Matters
- Keep relevant code visible
- Use descriptive names
- Maintain consistent style

</div>
<div>

## Don'ts ❌
- Blindly accept all suggestions
- Ignore security implications
- Skip code reviews
- Rely solely on Copilot
- Share sensitive data

## Security First
- Review for vulnerabilities
- Check dependencies
- Validate input handling

</div>
</div>

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 11" -->

# Advanced Features

## GitHub Copilot Chat
- Interactive coding assistance
- Explain code functionality
- Generate unit tests
- Refactoring suggestions

## Code Explanations
```python
# Select code and ask: "Explain this function"
def quicksort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quicksort(left) + middle + quicksort(right)
```

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 12" -->

# Hands-on Exercise 1

## Task: Create a Todo List Application

### Requirements:
1. Create a simple Todo class
2. Implement add, remove, and list functions
3. Add persistence to JSON file
4. Include error handling

### Tips:
- Start with clear comments
- Let Copilot suggest the structure
- Review and refine suggestions
- Test the implementation

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 13" -->

# Common Pitfalls and Solutions

| Pitfall | Solution |
|---------|----------|
| **Incorrect suggestions** | Provide more context in comments |
| **Security vulnerabilities** | Always review for security issues |
| **Over-reliance** | Use as a tool, not a replacement |
| **Inconsistent style** | Configure Copilot settings |
| **Performance issues** | Review algorithmic complexity |

> "Copilot is like a very smart junior developer - helpful but needs supervision"

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 14" -->

# Integration with Development Workflow

## Code Reviews
- Copilot as first reviewer
- Catch common issues
- Suggest improvements

## Testing
- Generate test cases
- Mock data creation
- Edge case identification

## Documentation
- Auto-generate JSDoc/docstrings
- README templates
- API documentation

## CI/CD
- GitHub Actions workflows
- Deployment scripts
- Configuration files

---
<!-- _header: "CRONOS PUBLIC SERVICES" -->
<!-- _footer: "27/07/2025 | GitHub Copilot Training | slide 15" -->

# Q&A Session

## Let's Discuss!

### Topics we can cover:
- Specific use cases in your projects
- Integration challenges
- Best practices for your team
- Future of AI in development
- Ethical considerations

### Your Questions?

---
<!-- _class: title -->
<!-- _header: "" -->
<!-- _footer: "" -->

# Thank You!

<div class="subtitle">Happy Coding with GitHub Copilot!</div>

### Contact Information
**CRONOS PUBLIC SERVICES**  
📧 info@cronos-public-services.be  
🌐 www.cronos-public-services.be

### Resources
- [GitHub Copilot Docs](https://docs.github.com/copilot)
- [Best Practices Guide](https://github.com/features/copilot)
- [Community Forum](https://github.community)