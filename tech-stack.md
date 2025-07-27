# Technology Stack & Architecture

## Overview
Monorepo structure with React frontend and Java Spring Boot backend.

## Repository Structure
```
team-lunch-voter/
├── frontend/          # React application
├── backend/           # Java Spring Boot API
├── database/          # SQL schemas and migrations
├── docs/              # Additional documentation
└── scripts/           # Build and deployment scripts
```

## Frontend Stack
- **Framework**: React 18+ with TypeScript
- **State Management**: Zustand
- **Styling**: Tailwind CSS
- **Build Tool**: Vite
- **HTTP Client**: Axios
- **WebSocket**: Socket.io-client
- **Date Handling**: date-fns
- **Testing**: Jest + React Testing Library
- **Linting**: ESLint + Prettier

## Backend Stack
- **Framework**: Spring Boot 3.x
- **Language**: Java 17
- **Build Tool**: Maven
- **Database**: PostgreSQL 14+
- **ORM**: Spring Data JPA
- **WebSocket**: Spring WebSocket with STOMP
- **API Documentation**: OpenAPI 3.0 (Swagger)
- **Testing**: JUnit 5 + MockMvc
- **Authentication**: Spring Security (Auth0 ready)

## Database
- **Primary DB**: PostgreSQL
- **Connection Pooling**: HikariCP
- **Migrations**: Flyway
- **Naming Convention**: snake_case for tables/columns

## Development Tools
- **API Testing**: Postman collection provided
- **Database GUI**: pgAdmin or DBeaver
- **Git Workflow**: Trunk-based development
- **Code Style**: Google Java Style Guide
- **Pre-commit Hooks**: Husky for linting

## External Services
- **Authentication**: Auth0 (disabled for local dev)
- **Restaurant API**: OpenTable or Yelp API (mocked for dev)
- **Monitoring**: Prepared for DataDog integration

## Local Development Setup
```bash
# Start PostgreSQL (Docker)
docker-compose up -d postgres

# Backend (port 8080)
cd backend
./mvnw spring-boot:run

# Frontend (port 5173)
cd frontend
npm install
npm run dev
```

## Environment Variables
```
# Backend (.env)
DATABASE_URL=postgresql://localhost:5432/lunch_voter
AUTH0_DOMAIN=disabled-for-local
RESTAURANT_API_KEY=mock-key

# Frontend (.env)
VITE_API_URL=http://localhost:8080
VITE_WS_URL=ws://localhost:8080/ws
VITE_AUTH0_DOMAIN=disabled-for-local
```