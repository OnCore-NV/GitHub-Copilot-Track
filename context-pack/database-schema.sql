-- Team Lunch Voting Database Schema
-- PostgreSQL 14+

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Categories enum
CREATE TYPE restaurant_category AS ENUM (
    'Italian', 
    'Asian', 
    'American', 
    'Mexican', 
    'Vegetarian', 
    'Fast Food', 
    'Other'
);

-- Restaurants table
CREATE TABLE restaurants (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(500),
    average_rating DECIMAL(2,1) CHECK (average_rating >= 0 AND average_rating <= 5),
    external_id VARCHAR(255), -- ID from external API if applicable
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Restaurant categories (many-to-many)
CREATE TABLE restaurant_categories (
    restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
    category restaurant_category NOT NULL,
    PRIMARY KEY (restaurant_id, category)
);

-- Users table (simplified for local dev)
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    display_name VARCHAR(255),
    auth0_id VARCHAR(255), -- For future Auth0 integration
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Daily suggestions
CREATE TABLE suggestions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    suggested_date DATE NOT NULL DEFAULT CURRENT_DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(restaurant_id, suggested_date) -- Each restaurant can only be suggested once per day
);

-- Votes
CREATE TABLE votes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
    voting_date DATE NOT NULL DEFAULT CURRENT_DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, voting_date) -- One vote per user per day
);

-- Voting results history
CREATE TABLE voting_results (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    voting_date DATE NOT NULL UNIQUE,
    winning_restaurant_id UUID REFERENCES restaurants(id),
    was_tie BOOLEAN DEFAULT FALSE,
    total_votes INTEGER NOT NULL,
    total_participants INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Detailed results for each restaurant each day
CREATE TABLE voting_result_details (
    voting_result_id UUID REFERENCES voting_results(id) ON DELETE CASCADE,
    restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
    vote_count INTEGER NOT NULL DEFAULT 0,
    was_winner BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (voting_result_id, restaurant_id)
);

-- Indexes for performance
CREATE INDEX idx_suggestions_date ON suggestions(suggested_date);
CREATE INDEX idx_suggestions_user_date ON suggestions(user_id, suggested_date);
CREATE INDEX idx_votes_date ON votes(voting_date);
CREATE INDEX idx_votes_restaurant_date ON votes(restaurant_id, voting_date);
CREATE INDEX idx_voting_results_date ON voting_results(voting_date DESC);

-- View for current day vote counts
CREATE VIEW current_vote_counts AS
SELECT 
    r.id as restaurant_id,
    r.name as restaurant_name,
    COUNT(v.id) as vote_count
FROM restaurants r
INNER JOIN suggestions s ON r.id = s.restaurant_id
LEFT JOIN votes v ON r.id = v.restaurant_id AND v.voting_date = CURRENT_DATE
WHERE s.suggested_date = CURRENT_DATE
GROUP BY r.id, r.name
ORDER BY vote_count DESC, r.name;

-- Function to check daily suggestion limit
CREATE OR REPLACE FUNCTION check_suggestion_limit()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        SELECT COUNT(*) 
        FROM suggestions 
        WHERE user_id = NEW.user_id 
        AND suggested_date = NEW.suggested_date
    ) >= 3 THEN
        RAISE EXCEPTION 'User has reached the daily suggestion limit of 3';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_suggestion_limit
BEFORE INSERT ON suggestions
FOR EACH ROW
EXECUTE FUNCTION check_suggestion_limit();

-- Sample data for development
INSERT INTO restaurants (id, name, description, location, average_rating) VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Pizza Palace', 'Authentic Italian pizzas', '123 Main St', 4.5),
    ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Sushi Express', 'Fresh sushi and Japanese cuisine', '456 Oak Ave', 4.7),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Burger Barn', 'Gourmet burgers and fries', '789 Elm St', 4.2),
    ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Taco Fiesta', 'Authentic Mexican street food', '321 Pine Rd', 4.6),
    ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'Green Garden', 'Vegetarian and vegan options', '654 Maple Dr', 4.4);

INSERT INTO restaurant_categories (restaurant_id, category) VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Italian'),
    ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Asian'),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'American'),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Fast Food'),
    ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Mexican'),
    ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'Vegetarian');

-- Sample users for development
INSERT INTO users (id, email, display_name) VALUES
    ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'alice@team.com', 'Alice'),
    ('f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a77', 'bob@team.com', 'Bob'),
    ('f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a88', 'charlie@team.com', 'Charlie');