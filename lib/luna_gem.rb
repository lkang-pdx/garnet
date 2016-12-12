require 'httparty'
require 'json'
require_relative 'roadmap'

class LunaGem
  include HTTParty
  include Roadmap

  def initialize(email, password)
    response = self.class.post(api_url("sessions"), body: {"email": email, "password": password})
    puts response.code
    raise "Error" if response.code == 404
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(api_url("users/me"), headers: { "authorization" => @auth_token })
    @user = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(api_url("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
    @mentor = JSON.parse(response.body)
  end

  def get_messages(page_num=nil)
    end_point = page_num == nil ? "message_threads?page=1" : "message_threads?page=#{page_num}"
    response = self.class.get(api_url(end_point), headers: { "authorization" => @auth_token })
    @messages = JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, subject=nil, stripped_text)
    response = self.class.post(api_url("messages"),
      body: {
        "sender": sender,
        "recipient_id": recipient_id,
        "subject": subject,
        "stripped-text": stripped_text
      },
      headers: { "authorization" => @auth_token })
    puts response
  end

  def create_submission(checkpoint_id, assignment_branch, commit_link, comment, enrollment_id)
    response = self.class.post(api_url("checkpoint_submissions"),
      body: {
        "checkpoint_id": checkpoint_id,
        "assignment_branch": assignment_branch,
        "assignment_commit_link": commit_link,
        "comment": comment,
        "enrollment_id": enrollment_id
      },
      headers: { "authorization" => @auth_token })
    puts response
  end

private

  def api_url(end_point)
    "https://www.bloc.io/api/v1/#{end_point}"
  end
end
