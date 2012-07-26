require 'friendly_id'

module Forem
  class Forum < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, :use => :slugged

    belongs_to :category
    has_many :topics, :dependent => :destroy, :order => 'last_post_at DESC, created_at DESC'
    has_many :posts, :through => :topics, :dependent => :destroy
    has_many :views, :through => :topics, :dependent => :destroy

    has_many :moderator_groups
    has_many :moderators, :through => :moderator_groups, :source => :group

    validates :category, :presence => true
    validates :title, :presence => true
    validates :description, :presence => true

    def last_post_for(forem_user)
      forem_user && forem_user.forem_admin? ? posts.last : last_visible_post
    end

    def last_visible_post
      posts.where("forem_topics.hidden = ?", false).last
    end

    def moderator?(user)
      user && (user.forem_group_ids & self.moderator_ids).any?
    end
  end
end
