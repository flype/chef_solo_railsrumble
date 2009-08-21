node[:users].each do |user|
  homedir = user[:homedir].last
  ##
  # Create user.
  user user[:username] do
    comment user[:username]
    home homedir
    shell user[:shell]
  end

  ##
  # Create skel homedir.
  user[:homedir] << "#{homedir}/.ssh"
  user[:homedir].each do |dir|
    directory dir do
      recursive true
      owner user[:username]
      group user[:username]
      mode (dir.include?('.ssh') ? 0700 : 0755)
    end
  end

  ##
  # Run user specific recipes.
  include_recipe "users::#{user[:username]}"

  remote_file "#{homedir}/.ssh/authorized_keys" do
    source "#{user[:username]}_id_rsa.pub"
    mode 0400
    owner user[:username]
    group user[:username]
  end

  # remote_file "#{homedir}/.zshrc" do
  #   source "zshrc"
  #   mode 0400
  #   owner user[:username]
  #   group user[:username]
  # end
end
