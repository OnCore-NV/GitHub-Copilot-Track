# UI Design Mockup

## Layout Structure

### Header (Fixed)
```
┌─────────────────────────────────────────────────────────┐
│ 🍽️ Team Lunch Voter          [Suggest] [History] [User] │
│─────────────────────────────────────────────────────────│
│ Voting closes in: 02:34:56              📊 15 votes cast│
└─────────────────────────────────────────────────────────┘
```

### Main Content Area

#### Voting View (Default)
```
┌─────────────────────────────────────────────────────────┐
│                   Today's Options                        │
├─────────────────────────────────────────────────────────┤
│ ┌─────────────────────┐ ┌─────────────────────┐        │
│ │ 🍕 Pizza Palace    │ │ 🍣 Sushi Express   │        │
│ │ Italian · 4.5★     │ │ Asian · 4.7★       │        │
│ │ 123 Main St        │ │ 456 Oak Ave        │        │
│ │                    │ │                    │        │
│ │ ████████████ 8     │ │ ██████ 4           │        │
│ │ [Vote for this]    │ │ [Vote for this]    │        │
│ └─────────────────────┘ └─────────────────────┘        │
│                                                          │
│ ┌─────────────────────┐ ┌─────────────────────┐        │
│ │ 🍔 Burger Barn     │ │ 🌮 Taco Fiesta     │        │
│ │ American · 4.2★    │ │ Mexican · 4.6★     │        │
│ │ 789 Elm St         │ │ 321 Pine Rd        │        │
│ │                    │ │                    │        │
│ │ ██ 2               │ │ █ 1                │        │
│ │ [Vote for this]    │ │ [Vote for this]    │        │
│ └─────────────────────┘ └─────────────────────┘        │
└─────────────────────────────────────────────────────────┘
```

#### Suggest Restaurant Modal
```
┌─────────────────────────────────────────────────────────┐
│                 Suggest a Restaurant                     │
├─────────────────────────────────────────────────────────┤
│ Search: [_____________________________] 🔍              │
│                                                          │
│ Available Restaurants:                                   │
│ ┌─────────────────────────────────────────────────┐    │
│ │ □ Green Garden - Vegetarian                      │    │
│ │ □ Pasta Paradise - Italian                       │    │
│ │ □ BBQ Shack - American                          │    │
│ └─────────────────────────────────────────────────┘    │
│                                                          │
│ You can suggest 2 more restaurants today                 │
│                                                          │
│ [Cancel]                              [Add Selected]     │
└─────────────────────────────────────────────────────────┘
```

#### Winner Announcement (After 11:30 AM)
```
┌─────────────────────────────────────────────────────────┐
│                    🎉 Today's Winner! 🎉                 │
├─────────────────────────────────────────────────────────┤
│                                                          │
│                   🍕 Pizza Palace                        │
│                   Italian · 4.5★                         │
│                   123 Main St                            │
│                                                          │
│                   Won with 8 votes!                      │
│                                                          │
│ ┌─────────────────────────────────────────────────┐    │
│ │ Final Results:                                    │    │
│ │ 1. Pizza Palace - 8 votes                        │    │
│ │ 2. Sushi Express - 4 votes                       │    │
│ │ 3. Burger Barn - 2 votes                         │    │
│ │ 4. Taco Fiesta - 1 vote                         │    │
│ └─────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────┘
```

## Component Library

### RestaurantCard Component
```jsx
<RestaurantCard
  name="Pizza Palace"
  category="Italian"
  rating={4.5}
  location="123 Main St"
  voteCount={8}
  totalVotes={15}
  hasVoted={false}
  onVote={() => {}}
/>
```

### VoteProgressBar Component
```jsx
<VoteProgressBar 
  current={8} 
  total={15}
  animated={true}
  color="primary"
/>
```

### CountdownTimer Component
```jsx
<CountdownTimer 
  endTime="11:30:00"
  onExpire={() => {}}
  format="hh:mm:ss"
/>
```

## Color Scheme
- Primary: `#3B82F6` (Blue)
- Success: `#10B981` (Green)
- Warning: `#F59E0B` (Amber)
- Error: `#EF4444` (Red)
- Background: `#F9FAFB`
- Card Background: `#FFFFFF`
- Text Primary: `#111827`
- Text Secondary: `#6B7280`

## Responsive Breakpoints
- Mobile: < 640px (1 column)
- Tablet: 640px - 1024px (2 columns)
- Desktop: > 1024px (3-4 columns)

## Animations
- Vote count increases: Smooth counter animation
- New vote: Card pulse effect
- Progress bar: Smooth fill animation
- Winner announcement: Confetti animation

## Accessibility
- All interactive elements keyboard accessible
- ARIA labels for vote counts
- Screen reader announcements for updates
- High contrast mode support
- Focus indicators on all buttons