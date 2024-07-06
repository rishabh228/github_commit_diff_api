Rails.application.routes.draw do
  get 'repositories/:owner/:repository/commits/:oid', to: 'repositories#commit'
  get 'repositories/:owner/:repository/commits/:oid/diff', to: 'repositories#commit_diff'
end
