# GitHub Commit Diff API

This project is a Ruby on Rails application that provides API endpoints to fetch commit details and diffs from a GitHub repository using the GitHub API and PostgreSQL as the database.

## Setup

To set up the project, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/new-repo.git
   cd new-repo
2.Install dependencies:
  bundle install
3.Set up the PostgreSQL database:
  rails db:create
  rails db:migrate
4.Create a .env file for your GitHub Personal Access Token and add .env to .gitignore:
  GITHUB_TOKEN=your_github_token_here
5. Start the server:
  rails server

API Endpoints
	Get Commit Details:
			GET /repositories/:owner/:repository/commits/:oid
			Fetches metadata about a specific commit.
	Get Commit Diff:
			GET /repositories/:owner/:repository/commits/:oid/diff
			Fetches the list of files in the commit, including the diff of each file.


curl -X GET "http://localhost:3000/repositories/golemfactory/clay/commits/a1bf367b3af680b1182cc52bb77ba095764a11f9" \
-H "Authorization: token YOUR_GITHUB_TOKEN" \
-H "Content-Type: application/json"


curl -X GET "http://localhost:3000/repositories/golemfactory/clay/commits/a1bf367b3af680b1182cc52bb77ba095764a11f9/diff" \
-H "Authorization: token YOUR_GITHUB_TOKEN" \
-H "Content-Type: application/json"

