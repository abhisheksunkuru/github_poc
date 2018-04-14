class ReposController < ApplicationController
  def index
    repos = Github::Client::Repos.new
    #debugger
    @repos_list = repos.list(user: current_user.name,per_page:100,page:1)
  end

  def show

    repo_name = params[:id]
    # commit_ids = []
    # res = Typhoeus.get("https://api.github.com/repos/#{current_user.name}/#{repo_name}/commits")
    # cmt = JSON.parse(res.body)[0]
    # commit_ids << cmt["sha"]
    # commit_ids << cmt["parents"][0]["sha"]
    # p commit_ids.inspect
    # loop do
    #   response,val =  get_commit_det(repo_name,commit_ids.last)
    #   commit_ids << val
    #  # new_cmt_data = Typhoeus.get("https://api.github.com/repos/#{current_user.name}/#{repo_name}/commits/#{commit_ids.last}")
    #  # response = JSON.parse(new_cmt_data.body)
    #  # if response.has_key?("parents")
    #  #   commit_ids << response["parents"][0]["sha"]
    #  # end
    # break unless response.has_key?('parents')
    # end
    @commits  = Octokit.commits("#{current_user.name}/#{repo_name}")



  end

  # def get_commit_det(repo_name,cmt_id)
  #   val = ""
  #   res = Typhoeus.get("https://api.github.com/repos/#{current_user.name}/#{repo_name}/commits/#{cmt_id}")
  #   response = JSON.parse(res.body)
  #   if response.has_key?("parents")
  #     val = response['parents'][0]["sha"]
  #   end
  #   return response,val
  # end
end
