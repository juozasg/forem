module Forem
  class SubscriptionMailer < ActionMailer::Base
    default :from => Forem.email_from_address

    def topic_reply(post, subscriber)
      @post = post
      @topic = @post.topic
      @subscriber = subscriber

      mail(:to => @subscriber.email, :subject => "[#{Forem.site_name}] #{@post.user.username} has replied to '#{@topic.subject}'")
    end
  end
end
