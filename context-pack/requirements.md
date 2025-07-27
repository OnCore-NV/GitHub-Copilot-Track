# Team Lunch Voting App Requirements

## Overview
Build a fullstack application that helps teams decide where to have lunch through democratic voting.

## Functional Requirements

### Restaurant Suggestions
- Users can suggest up to 3 restaurants per day
- Suggestions include restaurant name and category
- Suggestions are reset daily at midnight
- Users can see all suggested restaurants for today

### Voting Rules
- Voting opens at 9:00 AM and closes at 11:30 AM
- Each user gets exactly one vote per day
- Votes are final - no changes allowed after submission
- Voting is anonymous - users cannot see who voted for what
- Users can see aggregate vote counts in real-time

### Winner Selection
- Winner is announced at 11:30 AM
- In case of a tie:
  - Display all tied restaurants as winners
  - System randomly selects one as the final choice
  - Show both the tied restaurants and the random selection

### Restaurant Data
- Categories: Italian, Asian, American, Mexican, Vegetarian, Fast Food, Other
- Pull restaurant info from external API when available
- For development: Use seeded database with 20 sample restaurants
- Display: Name, description, location, average rating, category

### History
- Keep indefinite history of all votes
- Track: Date, winning restaurant(s), vote counts, total participants
- Users can browse past lunch decisions

## Non-Functional Requirements

### Real-time Updates
- Vote counts update in real-time without page refresh
- Use WebSockets for live updates
- Show animation when new votes come in

### Responsive Design
- Mobile-first approach
- Works on phones, tablets, and desktops
- Touch-friendly interface for mobile

### Authentication
- Auth0 integration ready but disabled for local development
- Use mock authentication for testing (simple user ID)
- Prepare auth hooks for easy enablement

## User Stories

1. As a team member, I want to suggest restaurants so we have options to vote on
2. As a team member, I want to vote for my preferred lunch spot
3. As a team member, I want to see real-time vote counts so I know which restaurant is winning
4. As a team member, I want to see today's winner at 11:30 AM
5. As a team member, I want to browse our lunch history to see patterns