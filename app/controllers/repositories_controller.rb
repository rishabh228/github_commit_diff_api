class RepositoriesController < ApplicationController
  before_action :set_headers

  def commit
    owner = params[:owner]
    repo = params[:repository]
    commit_id = params[:oid]
    url = "https://api.github.com/repos/#{owner}/#{repo}/commits/#{commit_id}"
    response = HTTParty.get(url, headers: @headers)
    
    if response.success?
      render json: response.parsed_response
    else
      render json: { error: 'Commit not found' }, status: :not_found
    end
  end

  def commit_diff
    owner = params[:owner]
    repo = params[:repository]
    commit_id = params[:oid]
    url = "https://api.github.com/repos/#{owner}/#{repo}/commits/#{commit_id}"
    response = HTTParty.get(url, headers: @headers)
    
    if response.success?
      files = response.parsed_response['files'] || []
      diffs = files.map do |file|
        {
          changeKind: file['status'].upcase,
          headFile: { filename: file['filename'] },
          baseFile: {},
          hunks: file['patch'] ? [file['patch']] : []
        }
      end
      render json: diffs
    else
      render json: { error: 'Commit not found' }, status: :not_found
    end
  end

  private

  def set_headers
    @headers = { "Authorization" => "token #{ENV['GITHUB_TOKEN']}" }
  end
end
