# Things I Learned Building a Church Management Rails App

This document summarizes the key accomplishments and learnings from building a comprehensive Rails application for managing church members, events, galleries, and photos. Each section includes what was accomplished and how to replicate it in future projects.

## 1. Setting Up a New Rails Application with Authentication

**Accomplished:** Created a new Rails 8 application with PostgreSQL database, Active Storage for file uploads, and Devise for user authentication.

**How to do it:**
- Install Rails: `gem install rails`
- Create app: `rails new app_name --database=postgresql`
- Add Devise: Add `gem 'devise'` to Gemfile, run `bundle install`, then `rails generate devise:install`
- Generate User model: `rails generate devise User`
- Run migrations: `rails db:migrate`
- Configure Devise in `config/initializers/devise.rb`

## 2. Creating Models with Relationships and Validations

**Accomplished:** Built models for ChurchMember, Event, Gallery, and Photo with proper associations, validations, and scopes.

**How to do it:**
- Generate models: `rails generate model ModelName field:type`
- Add associations in model files (belongs_to, has_many, has_many :through)
- Add validations: `validates :field, presence: true, uniqueness: true`
- Add scopes: `scope :active, -> { where(active: true) }`
- Run migrations: `rails db:migrate`

## 3. Implementing CRUD Operations with RESTful Controllers

**Accomplished:** Created full CRUD functionality for all resources with proper routing and controller actions.

**How to do it:**
- Generate controllers: `rails generate controller Resources`
- Define RESTful routes in `config/routes.rb`: `resources :resources`
- Implement actions: index, show, new, create, edit, update, destroy
- Use strong parameters in private methods: `params.require(:model).permit(:fields)`
- Add before_actions for authentication: `before_action :authenticate_user!`

## 4. Adding Authentication and Authorization

**Accomplished:** Restricted edit/destroy actions to logged-in users while keeping public viewing.

**How to do it:**
- Use Devise helpers: `user_signed_in?`, `current_user`
- Wrap actions in views: `<% if user_signed_in? %>`
- Skip authentication for public actions: `skip_before_action :authenticate_user!, only: [:index, :show]`
- Add logout functionality with proper HTTP method: `button_to "Logout", destroy_user_session_path, method: :delete`

## 5. Implementing File Uploads with Active Storage

**Accomplished:** Added image upload functionality for galleries and photos with variants and drag-and-drop.

**How to do it:**
- Install Active Storage: `rails active_storage:install` (migration created)
- Add attachments to models: `has_one_attached :image` or `has_many_attached :images`
- In forms: `<%= f.file_field :image %>` or use Stimulus for drag-and-drop
- Display images: `<%= image_tag url_for(model.image) %>`
- Create variants: `model.image.variant(resize_to_limit: [800, 600])`

## 6. Adding Drag-and-Drop Functionality with Stimulus

**Accomplished:** Implemented drag-and-drop image uploads and photo reordering using Stimulus controllers.

**How to do it:**
- Install Stimulus: Already included in Rails 7+
- Create controller: `app/javascript/controllers/drag_controller.js`
- Add data attributes: `data-controller="drag"` and `data-action="dragover->drag#dragover"`
- Use libraries like SortableJS for reordering
- Handle file uploads in JavaScript and submit via form or AJAX

## 7. Seeding the Database with Realistic Data

**Accomplished:** Populated the database with sample church members, events, galleries, and photos using Faker.

**How to do it:**
- Add Faker gem: `gem 'faker'` in Gemfile
- Create `db/seeds.rb` with data creation logic
- Use Faker methods: `Faker::Name.name`, `Faker::Date.birthday`
- Run seeds: `rails db:seed`

## 8. Implementing Scopes and Queries for Data Filtering

**Accomplished:** Added scopes for filtering events by date and members by birthday month.

**How to do it:**
- Define scopes in models: `scope :upcoming, -> { where('starts_at > ?', Time.current) }`
- Use in controllers: `@events = Event.upcoming`
- Chain scopes: `Event.upcoming.order(:starts_at)`

## 9. Creating Nested Resources and Routes

**Accomplished:** Set up nested routes for photos within galleries.

**How to do it:**
- In `routes.rb`: `resources :galleries do resources :photos end`
- Update controllers to handle nested params: `params[:gallery_id]`
- Use nested paths in views: `gallery_photos_path(@gallery)`

## 10. Styling with Tailwind CSS and Custom Classes

**Accomplished:** Applied consistent styling using Tailwind CSS with custom button classes.

**How to do it:**
- Install Tailwind: Add to Gemfile or use CDN
- Create custom classes in CSS: `.btn-link { @apply ... }`
- Apply classes in views: `class: "btn-link"`
- Standardize styling across similar elements

## 11. Handling Date/Time Fields and Formatting

**Accomplished:** Added date of birth and event datetime fields with proper formatting.

**How to do it:**
- Use datetime fields in migrations: `t.datetime :starts_at`
- In forms: `<%= f.datetime_local_field :starts_at %>`
- Format display: `event.starts_at.strftime("%A, %b %e at %l:%M %p")`

## 12. Implementing Reordering Functionality

**Accomplished:** Added ability to reorder photos in galleries via drag-and-drop.

**How to do it:**
- Add position field: `t.integer :position` in migration
- Add reorder action in controller: `def reorder; ... end`
- Use JavaScript to send new order via AJAX
- Update positions: `Photo.update_positions(order_params)`

## 13. Debugging and Fixing Common Issues

**Accomplished:** Resolved routing errors, authentication issues, and drag-and-drop failures.

**How to do it:**
- Check routes: `rails routes`
- Use Rails logger for debugging
- Test authentication flows manually
- Verify JavaScript console for frontend issues
- Use `binding.pry` for debugging in development

## 14. Version Control and Deployment Preparation

**Accomplished:** Set up Git repository and prepared for deployment with Kamal.

**How to do it:**
- Initialize Git: `git init`
- Add files: `git add .`
- Commit: `git commit -m "message"`
- Push to GitHub: `git push -u origin main`
- Configure deployment with Kamal in `config/deploy.yml`

## Key Rails Concepts Learned

- **MVC Architecture:** Models for data, Views for presentation, Controllers for logic
- **RESTful Design:** Standard CRUD actions and HTTP methods
- **Active Record:** Database interactions through models
- **Asset Pipeline:** Managing CSS, JS, and images
- **Environment Configuration:** Different settings for development/production
- **Migrations:** Version-controlled database schema changes
- **Associations:** Relationships between models (belongs_to, has_many)
- **Validations:** Ensuring data integrity
- **Scopes:** Reusable query methods
- **Strong Parameters:** Security for mass assignment
- **Authentication/Authorization:** User management and access control
- **File Uploads:** Active Storage for attachments
- **JavaScript Integration:** Stimulus for interactive features
- **Testing:** Basic validation of functionality

## Best Practices Applied

- Keep controllers skinny, models fat
- Use partials for reusable view code
- Implement proper error handling
- Follow Rails naming conventions
- Use environment variables for secrets
- Write descriptive commit messages
- Test changes incrementally
- Use version control for all changes

This project demonstrates a complete Rails application from setup to deployment-ready state, covering all major aspects of web development with Ruby on Rails.</content>
<filePath">/Users/joshuabriley/Documents/web/rails-apps/church_rails/THINGS_I_LEARNED.md
