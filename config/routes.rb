Rails.application.routes.draw do
  get 'repositories/:owner/:repository/commits/:oid', to: 'repositories#commits'
  get 'repositories/:owner/:repository/commits/:oid/diff', to: 'repositories#diff'
end
