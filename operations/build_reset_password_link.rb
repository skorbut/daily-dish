# frozen_string_literal: true

# run on console to set reset password token hash of user and generate reset link to be send to the user.
# TODO: document system access if deployt somewhere

def build_reset_password_link(email)
  user = User.find_by(email:)
  token = user.send(:set_reset_password_token)
  app.edit_user_password_url(user, reset_password_token: token)
end
