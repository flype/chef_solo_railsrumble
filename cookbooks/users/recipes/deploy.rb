bash "sudo_user" do
  code "usermod -G sudo -a deploy"
end
