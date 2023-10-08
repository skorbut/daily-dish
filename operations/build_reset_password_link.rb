# frozen_string_literal: true

# run on console to set reset password token hash of user and generate reset link to be send to the user.
# execute console on fly.io system (https://fly.io/docs/rails/the-basics/run-tasks-and-consoles/):
# `fly ssh console --pty -C "/rails/bin/rails console"`

def build_reset_password_link(email)
  user = User.find_by(email: email)
  token = user.send(:set_reset_password_token)
  app.edit_user_password_url(user, reset_password_token: token)
end
