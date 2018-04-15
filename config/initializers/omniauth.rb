# ENV['GITHUB_KEY'] = 'a8cac03a4120bb3e1f67'
# ENV['GITHUB_SECRET'] = 'bcdf8b060f31ccdb7168ccaea5cb813608761f1e'

Rails.application.config.middleware.use   OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'],scope: "user,repo,gist"
end
