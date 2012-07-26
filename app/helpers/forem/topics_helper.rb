module Forem
  module TopicsHelper

    def url_for_latest_post(post)
      topic = post.topic
      post_page = (topic.posts.index(post) / topic.posts.per_page) + 1

      link_params = {:anchor => "post-#{post.id}"}
      link_params[:page] = post_page if post_page > 1

      forum_topic_path(post.topic.forum, post.topic, link_params)
    end

    def link_to_latest_post(post)
      text = "#{time_ago_in_words(post.created_at)} #{t("ago_by")} #{post.user}"
      link_to text, url_for_latest_post(post)
    end
  end

end
