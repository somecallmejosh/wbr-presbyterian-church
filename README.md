# West Baton Rouge Presbyterian Church Management System

A comprehensive Rails application for managing church members, events, galleries, and photos for the West Baton Rouge Presbyterian Church.

## Features

### Church Members Management
- View all church members with their contact information
- Add, edit, and manage member details including birthdays
- Display monthly birthday celebrations on the home page

### Events Management
- Create and manage church events with dates and times
- View upcoming events
- Display this week's events on the home page

### Photo Galleries
- Create galleries to organize church photos
- Upload multiple photos with drag-and-drop functionality
- Reorder photos within galleries
- View galleries with thumbnail navigation

### User Authentication
- Secure login system using Devise
- Restricted editing capabilities for authenticated users
- Public viewing of all content

### Responsive Design
- Mobile-friendly interface using Tailwind CSS
- Consistent styling with custom button classes

## Tech Stack

- **Framework:** Ruby on Rails 8
- **Database:** PostgreSQL
- **Authentication:** Devise
- **File Storage:** Active Storage (with local storage)
- **Frontend:** HTML, CSS, JavaScript
- **CSS Framework:** Tailwind CSS
- **JavaScript Framework:** Stimulus
- **Deployment:** Kamal

## Prerequisites

- Ruby 3.2.0 or higher
- Rails 8.0 or higher
- PostgreSQL 13 or higher
- Node.js and Yarn (for asset compilation)

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/somecallmejosh/wbr-presbyterian-church.git
   cd wbr-presbyterian-church
   ```

2. **Install Ruby dependencies:**
   ```bash
   bundle install
   ```

3. **Install JavaScript dependencies:**
   ```bash
   yarn install
   ```

4. **Database setup:**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Start the Rails server:**
   ```bash
   rails server
   ```

6. **Visit the application:**
   Open your browser and go to `http://localhost:3000`

## Database Schema

The application uses the following main models:

- **User:** Authentication (via Devise)
- **ChurchMember:** Member information and birthdays
- **Event:** Church events with dates and descriptions
- **Gallery:** Photo gallery containers
- **Photo:** Individual photos with ordering

## Usage

### For Visitors
- View the home page with church information and current events
- Browse all church members, events, galleries, and photos
- View individual member profiles, event details, and photo galleries

### For Administrators
- Log in to access editing capabilities
- Add, edit, and delete church members, events, galleries, and photos
- Upload and reorder photos in galleries
- Manage all church content

## Development

### Running Tests
```bash
rails test
```

### Code Quality
```bash
rubocop
```

### Database Management
```bash
rails db:migrate          # Run pending migrations
rails db:rollback         # Rollback last migration
rails db:seed             # Seed the database
rails db:reset            # Reset database
```

## Deployment

This application is configured for deployment using Kamal:

1. **Configure deployment settings:**
   Edit `config/deploy.yml` with your server details

2. **Deploy:**
   ```bash
   kamal deploy
   ```

## Environment Variables

Create a `.env` file in the root directory for sensitive configuration:

```
DATABASE_URL=postgresql://username:password@localhost/church_rails
SECRET_KEY_BASE=your_secret_key_here
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Built with Ruby on Rails
- Styled with Tailwind CSS
- Authentication powered by Devise
- File uploads handled by Active Storage
- Drag-and-drop functionality using Stimulus and SortableJS

## Support

For support or questions, please contact the development team or create an issue in the GitHub repository.
