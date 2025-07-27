# Team Lunch Voting App - Context Pack

## Overview
This context pack contains all the information needed to build the Team Lunch Voting App with proper architecture, patterns, and standards.

## Files Included

1. **requirements.md** - Complete functional and non-functional requirements
2. **tech-stack.md** - Technology choices and setup instructions
3. **api-spec.yaml** - OpenAPI specification for all endpoints
4. **database-schema.sql** - PostgreSQL schema with sample data
5. **ui-mockup.md** - UI design, components, and styling guide
6. **code-patterns.md** - Code examples and best practices

## How to Use This Context

### With GitHub Copilot Agent Mode

1. **Attach all context files** when starting:
   ```
   @workspace Include all files from /context-pack
   ```

2. **Reference specific files** as needed:
   ```
   Following the patterns in @code-patterns.md, create the vote service
   ```

3. **Use the API spec** for endpoints:
   ```
   Implement all endpoints defined in @api-spec.yaml
   ```

### Key Decisions Made

- **Monorepo structure** for easier development
- **Real-time updates** via WebSockets for live voting
- **Anonymous voting** by default
- **Trunk-based development** for Git workflow
- **Auth0 ready** but disabled for local development

### Success Criteria

Your implementation should:
- ✅ Allow restaurant suggestions (max 3 per user per day)
- ✅ Enable voting between 9 AM and 11:30 AM
- ✅ Show real-time vote updates
- ✅ Handle tie-breaking with random selection
- ✅ Work on mobile and desktop
- ✅ Include basic tests
- ✅ Follow the provided code patterns

### Common Pitfalls to Avoid

- Don't allow vote changes after submission
- Don't show who voted for what (anonymous)
- Don't forget the voting time window
- Don't overlook the WebSocket setup for real-time updates
- Don't skip the database constraints

## Questions?

If anything is unclear, the requirements.md file has the most detailed information about the business logic.