class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :quizzes

  DBC_TEACHER_GITHUBS = ['aespaldi', 'amgando', 'bluemihai', 'sebabelmar',
    'b0uma', 'bootcoder', 'dreeve', 'jkarnowski', 'salogel42', 'ssachid',
    'booneteam', 'stujo']

  def set_default_role
    if DBC_TEACHER_GITHUBS.include? self.github_nickname
      self.role ||= :admin
    else
      self.role ||= :user      
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.github_nickname = auth['info']['nickname']
        user.github_avatar = auth['info']['image']
        user.name = auth['info']['name'] || ''
        user.email = auth['info']['email'] || ''
      end
    end
  end

end
