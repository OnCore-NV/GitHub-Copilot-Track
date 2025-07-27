# Code Patterns & Standards

## Frontend Patterns

### Component Structure
```tsx
// components/RestaurantCard.tsx
import { FC } from 'react';
import { Restaurant } from '@/types';
import { useVoteStore } from '@/stores/voteStore';

interface RestaurantCardProps {
  restaurant: Restaurant;
  voteCount: number;
  totalVotes: number;
  onVote: (id: string) => void;
}

export const RestaurantCard: FC<RestaurantCardProps> = ({
  restaurant,
  voteCount,
  totalVotes,
  onVote
}) => {
  const hasVoted = useVoteStore(state => state.hasVoted);
  
  return (
    <div className="bg-white rounded-lg shadow-md p-6">
      {/* Component implementation */}
    </div>
  );
};
```

### Zustand Store Pattern
```ts
// stores/voteStore.ts
import { create } from 'zustand';
import { subscribeWithSelector } from 'zustand/middleware';

interface VoteState {
  votes: Record<string, number>;
  hasVoted: boolean;
  userVote: string | null;
  setVote: (restaurantId: string) => void;
  updateVoteCounts: (counts: Record<string, number>) => void;
}

export const useVoteStore = create<VoteState>()(
  subscribeWithSelector((set) => ({
    votes: {},
    hasVoted: false,
    userVote: null,
    setVote: (restaurantId) => set({ 
      hasVoted: true, 
      userVote: restaurantId 
    }),
    updateVoteCounts: (counts) => set({ votes: counts })
  }))
);
```

### API Hook Pattern
```ts
// hooks/useRestaurants.ts
import { useQuery } from '@tanstack/react-query';
import { api } from '@/lib/api';

export const useRestaurants = () => {
  return useQuery({
    queryKey: ['restaurants'],
    queryFn: api.restaurants.getAll,
    staleTime: 5 * 60 * 1000, // 5 minutes
  });
};
```

### WebSocket Hook
```ts
// hooks/useVoteUpdates.ts
import { useEffect } from 'react';
import { socket } from '@/lib/socket';
import { useVoteStore } from '@/stores/voteStore';

export const useVoteUpdates = () => {
  const updateVoteCounts = useVoteStore(state => state.updateVoteCounts);
  
  useEffect(() => {
    socket.on('vote-update', updateVoteCounts);
    return () => {
      socket.off('vote-update');
    };
  }, [updateVoteCounts]);
};
```

## Backend Patterns

### Controller Pattern
```java
// controllers/VoteController.java
@RestController
@RequestMapping("/api/votes")
@RequiredArgsConstructor
public class VoteController {
    private final VoteService voteService;
    private final SimpMessagingTemplate messagingTemplate;
    
    @PostMapping
    public ResponseEntity<VoteResponse> castVote(@RequestBody VoteRequest request) {
        // Validate voting window
        if (!voteService.isVotingOpen()) {
            return ResponseEntity.badRequest()
                .body(new VoteResponse("Voting is closed"));
        }
        
        Vote vote = voteService.castVote(request.getUserId(), request.getRestaurantId());
        
        // Broadcast update via WebSocket
        VoteUpdate update = voteService.getCurrentCounts();
        messagingTemplate.convertAndSend("/topic/votes", update);
        
        return ResponseEntity.status(HttpStatus.CREATED).body(vote);
    }
}
```

### Service Pattern
```java
// services/VoteService.java
@Service
@Transactional
@RequiredArgsConstructor
public class VoteService {
    private final VoteRepository voteRepository;
    private final RestaurantRepository restaurantRepository;
    
    public Vote castVote(UUID userId, UUID restaurantId) {
        // Check if user already voted today
        if (voteRepository.existsByUserIdAndVotingDate(userId, LocalDate.now())) {
            throw new AlreadyVotedException("User has already voted today");
        }
        
        Vote vote = Vote.builder()
            .userId(userId)
            .restaurantId(restaurantId)
            .votingDate(LocalDate.now())
            .build();
            
        return voteRepository.save(vote);
    }
    
    public boolean isVotingOpen() {
        LocalTime now = LocalTime.now();
        return now.isAfter(LocalTime.of(9, 0)) && 
               now.isBefore(LocalTime.of(11, 30));
    }
}
```

### Repository Pattern
```java
// repositories/VoteRepository.java
@Repository
public interface VoteRepository extends JpaRepository<Vote, UUID> {
    boolean existsByUserIdAndVotingDate(UUID userId, LocalDate votingDate);
    
    @Query("SELECT new com.lunch.dto.VoteCountDto(v.restaurantId, COUNT(v)) " +
           "FROM Vote v WHERE v.votingDate = :date " +
           "GROUP BY v.restaurantId")
    List<VoteCountDto> getVoteCountsByDate(@Param("date") LocalDate date);
}
```

### Entity Pattern
```java
// entities/Vote.java
@Entity
@Table(name = "votes", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"user_id", "voting_date"})
})
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Vote {
    @Id
    @GeneratedValue
    private UUID id;
    
    @Column(name = "user_id", nullable = false)
    private UUID userId;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "restaurant_id", nullable = false)
    private Restaurant restaurant;
    
    @Column(name = "voting_date", nullable = false)
    private LocalDate votingDate;
    
    @CreationTimestamp
    @Column(name = "created_at")
    private Instant createdAt;
}
```

### WebSocket Configuration
```java
// config/WebSocketConfig.java
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
    
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/topic");
        config.setApplicationDestinationPrefixes("/app");
    }
    
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws")
            .setAllowedOrigins("http://localhost:5173")
            .withSockJS();
    }
}
```

## Testing Patterns

### Frontend Testing
```tsx
// __tests__/RestaurantCard.test.tsx
import { render, screen, fireEvent } from '@testing-library/react';
import { RestaurantCard } from '@/components/RestaurantCard';

describe('RestaurantCard', () => {
  it('should disable vote button when user has voted', () => {
    render(
      <RestaurantCard
        restaurant={mockRestaurant}
        voteCount={5}
        totalVotes={10}
        onVote={jest.fn()}
      />
    );
    
    const voteButton = screen.getByRole('button', { name: /vote/i });
    expect(voteButton).toBeDisabled();
  });
});
```

### Backend Testing
```java
// VoteServiceTest.java
@SpringBootTest
@AutoConfigureMockMvc
class VoteServiceTest {
    
    @Test
    void shouldNotAllowDuplicateVotes() {
        // Given
        UUID userId = UUID.randomUUID();
        voteService.castVote(userId, restaurantId);
        
        // When/Then
        assertThrows(AlreadyVotedException.class, () -> {
            voteService.castVote(userId, anotherRestaurantId);
        });
    }
}
```

## Git Workflow (Trunk-based)
```bash
# Feature development
git checkout main
git pull origin main
git checkout -b feature/add-vote-animation
# Make changes
git add .
git commit -m "feat: Add vote count animation"
git push origin feature/add-vote-animation
# Create PR, merge quickly to main

# Hotfix
git checkout -b hotfix/voting-window-fix
# Fix issue
git push origin hotfix/voting-window-fix
# Merge to main immediately after review
```