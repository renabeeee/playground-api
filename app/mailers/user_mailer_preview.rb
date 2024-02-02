class UserMailerPreview < ActionMailer::Preview
  def reset_password_instructions
    user = User.first
    UserMailer.reset_password_instructions(user)
  end
end
